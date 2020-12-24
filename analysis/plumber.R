library(dplyr)
library(data.table)
library(lubridate)
library(anytime)

#* Return the monthly changes of PRs merged
#* @post /monthly_total_change
function(req) {
   payload <- req$body %>% as.data.table()
   payload %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      year_month = format(merged_at, '%Y-%m'),
      datetime = anytime::iso8601(anytime(paste0(year_month, '-01')))
    ) %>%
    filter(!is.na(year_month)) %>%
    group_by(datetime) %>%
    summarise(total = n()) %>%
    arrange(datetime) %>%
    mutate(
      change = (total - lag(total)) / lag(total),
      mom_change  = (total - lag(total, 12)) / lag(total,12)
    )
}

#* Return the weekly changes of PRs merged
#* @post /weekly_total_change
function(req) {
  payload <- req$body %>% as.data.table()
  payload %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      year_week = format(merged_at, '%Y-%U'),
      date = anytime::iso8601(anytime(as.Date(lubridate::floor_date(merged_at, unit = 'week'))))
    ) %>%
    filter(!is.na(date)) %>%
    group_by(date) %>%
    summarise(total = n()) %>%
    arrange(date) %>%
    mutate(
      change = (total - lag(total))
    )
}

#* Return the monthly changes of PRs merged last 30 days compared to previous
#* @post /last30_total
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at)
      ) %>%
    filter(merged_at > (Sys.Date() - days(60))) %>%
    mutate(group = factor(case_when(
      merged_at < Sys.Date() - days(30) ~ 'previous',
      TRUE ~ 'current'),
      ordered = TRUE,
      levels = c('previous','current'))) %>%
    group_by(group) %>%
    summarise(total = n()) %>%
    arrange(group) %>%
    mutate(
      change = (total - lag(total)) / lag(total)
    )
  out <- tibble(
    name = '30 Day PRs',
    value = round(store$total[store$group == 'current'],1),
    description = "Last 30 Days Total Merged PRs",
    change_direction = ifelse(store$change[store$group == 'current'] > 0,
                              'positive',
                              'negative'),
    byline = paste0('Change of ',
                    round(100*store$change[store$group == 'current'],1),
                    '% compared to previous 30 Day interval of ',
                    round(store$total[store$group == 'previous'],1), ' PRs')
  )
  return(out)
}

#* Return the longterm (annual) average ages of merged PRs against current month
#* @post /merged_age
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(created_at, merged_at, closed_at) %>%
    filter(!is.na(closed_at)) %>%
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      merged_at = lubridate::ymd_hms(merged_at),
      closed_at = lubridate::ymd_hms(closed_at),
      group = ifelse(is.na(merged_at) & !is.na(closed_at),
                      'closed',
                      'merged'),
      age_days = round(difftime(closed_at, created_at, units = 'days'), 0)) %>%
    filter(closed_at > Sys.Date() - years(1) &
             group == 'merged') %>%
    group_by(group) %>%
    summarise(
      total = n(),
      avg_age_days_annual = as.numeric(mean(age_days, na.rm = TRUE)),
      avg_age_days_current = as.numeric(mean(age_days[closed_at > Sys.Date() - days(30)], na.rm = TRUE))
    ) %>%
    mutate(
      diff = avg_age_days_current - avg_age_days_annual,
      change = (avg_age_days_current - avg_age_days_annual) / avg_age_days_annual
    )
  out <- tibble(
    name = 'Merged PR Age',
    value = as.character(round(store$avg_age_days_current[store$group == 'merged'],1)),
    description = "Average Age in Days for Merged PRs (Last 30 Days)",
    change_direction = ifelse(store$change[store$group == 'merged'] > 0,
                              'positive',
                              'negative'),
    sentiment = ifelse(change_direction == 'negative',
                       'bad', 'good'),
    byline = paste0('Change of ',
                    ifelse(is.nan(store$change[store$group == 'merged']),
                           '0%', 
                           paste0(round(100*store$change[store$group == 'merged'],1), '%')),
                    ' compared to annual average of ',
                    ifelse(is.nan(store$avg_age_days_annual[store$group == 'merged']),
                           '(-)',
                           round(store$avg_age_days_annual[store$group == 'merged'],1)),
                    ' days')
  )
  return(out)
}

#* Return the longterm (annual) average ages of closed PRs against current month
#* @post /closed_age
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(created_at, merged_at, closed_at) %>%
    filter(!is.na(closed_at)) %>%
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      merged_at = lubridate::ymd_hms(merged_at),
      closed_at = lubridate::ymd_hms(closed_at),
      group = ifelse(is.na(merged_at) & !is.na(closed_at),
                     'closed',
                     'merged'),
      age_days = round(difftime(closed_at, created_at, units = 'days'), 0)) %>%
    filter(closed_at > Sys.Date() - years(1) &
             group == 'closed') %>%
    group_by(group) %>%
    summarise(
      total = n(),
      avg_age_days_annual = as.numeric(mean(age_days, na.rm = TRUE)),
      avg_age_days_current = as.numeric(mean(as.numeric(age_days[closed_at > (Sys.Date() - days(30))]), na.rm = TRUE))
    ) %>%
    mutate(
      diff = avg_age_days_current - avg_age_days_annual,
      change = (avg_age_days_current - avg_age_days_annual) / avg_age_days_annual
    )
  out <- tibble(
    name = 'Closed PR Age',
    value = as.character(round(store$avg_age_days_current[store$group == 'closed'],1)),
    description = "Average Age in Days for Unmerged Closed PRs (Last 30 Days)",
    change_direction = ifelse(store$change[store$group == 'closed'] > 0,
                              'positive',
                              'negative'),
    sentiment = ifelse(change_direction == 'positive',
                       'bad', 'good'),
    byline = paste0('Change of ',
                    round(100*store$change[store$group == 'closed'],1),
                    '% compared to annual average of ',
                    round(store$avg_age_days_annual[store$group == 'closed'],1),
                    ' days')
  )
  return(out)
}

#* Return average age of all PRs currently open
#* @post /opened_age
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(created_at, merged_at, closed_at) %>%
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      condition_date = as.Date(ifelse(is.na(merged_at), Sys.Date(), merged_at), origin = '1970-01-01'),
      age_days = round(difftime(
        condition_date,
        created_at, units = 'days'), 0)) %>%
    summarise(
      total = sum(is.na(closed_at) & is.na(merged_at)),
      avg_days_currently_open = as.numeric(mean(age_days[is.na(closed_at) & is.na(merged_at)], na.rm = TRUE)),
      annual_avg_days = as.numeric(mean(age_days[!is.na(merged_at)], na.rm = TRUE))
    ) %>%
    mutate(
      diff = ifelse(is.nan(avg_days_currently_open - annual_avg_days), '-' , avg_days_currently_open - annual_avg_days),
      change = ifelse(is.nan(avg_days_currently_open - annual_avg_days), '-', diff / annual_avg_days))
  out <- tibble(
    name = 'Total PRs Open',
    value = as.character(store$total),
    description = "Total Open PRs",
    change_direction = NULL,
    byline = paste0('Current Average Days for Open PRs ',
                    ifelse(is.nan(store$avg_days_currently_open), '0', round(store$avg_days_currently_open, 1)),
                    ' Compared to Annual Average of ',
                    ifelse(is.nan(store$annual_avg_days), '0', round(store$annual_avg_days, 1)),
                    ' ', 
                    ifelse(!is.numeric(store$change), paste0('(0%)'),
                           paste0('(', round(100*store$change,1), '%)'))))
  return(out)
}

test$closed_at %>% summary
