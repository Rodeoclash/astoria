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
    name = 'How many merged PRs in the last 30 days?',
    value = paste0(round(store$total[store$group == 'current'],1)),
    unit_type = 'PRs',
    description = "This value represents the absolute number of pull requests being merged into the codebase.

In general, an increasing number of PRs being merged indicates an increase in the amount of work being done. While mainly positive, care must also be taken to ensure that the work being produced is useful to users.

### Decreased due to:
* Developers leaving
* New developers starting and existing developers taking time to onboard them
* New languages or frameworks being introduced
* Explatory or new work being undertaken
* Holiday or other leave

### Increased through:
* Adding additional staff with adequate time to become familiar with the codebase
* Well organised code that is easy to make modifications to in isolation
* Clear and unchanging development requirements
",
    change_direction = ifelse(store$change[store$group == 'current'] > 0,
                              'increase',
                              'decrease'),
    sentiment = ifelse(change_direction == 'increase',
                       'positive', 'negative'),
    byline = paste0('Change of **',
                    round(100*store$change[store$group == 'current'],1),
                    '%** compared to previous 30 day interval of **',
                    round(store$total[store$group == 'previous'],1), '** PRs.')
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
    name = 'How Long Until Work Is Merged?',
    value = paste0(as.character(round(store$avg_age_days_current[store$group == 'merged'],1))),
    unit_type = 'days',
    description = "This value represents the length of time between creation of a PR and that PR being merged into the codebase.

A fast turnaround on reviews means that features and fixes to get into the hands of users faster.

### Decreased due to:
* Bottlenecks in the review process
* Code that is complicated and hard to reason about
* Underconfident developers

### Increased through:
* Education around the purpose of PRs
* Improving the quality of code and size of PRs
* Deveopers becoming more experienced",
    change_direction = ifelse(store$change[store$group == 'merged'] > 0,
                              'increase',
                              'decrease'),
    sentiment = ifelse(change_direction == 'decrease',
                       'positive', 'negative'),
    byline = paste0('Change of **',
                    ifelse(is.nan(store$change[store$group == 'merged']),
                           '0%',
                           paste0(round(100*store$change[store$group == 'merged'],1), '%')),
                    '** compared to annual average of **',
                    ifelse(is.nan(store$avg_age_days_annual[store$group == 'merged']),
                           '(-)',
                           round(store$avg_age_days_annual[store$group == 'merged'],1)),
                    '** days.')
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
    name = 'How Old Were Lost PRs?',
    value = as.character(round(store$avg_age_days_current[store$group == 'closed'],1)),
    unit_type = 'days',
    description = "This value represents the average age of PRs that closed without being merged (a.k.a 'lost' PRs).

All PRs take some time to be reviewed, however, the longer PRs are left, the more likely they are to be closed rather than merged.

A closed PR does not always mean that time was wasted, however it does indicate that the initial assumptions that lead to the PR being created have likely changed. This can include:

* The underlying code changing so much that it's impossible to merge
* The feature is no longer relevant
* The developer moving on to new features",
    change_direction = ifelse(store$change[store$group == 'closed'] > 0,
                              'increase',
                              'decrease'),
    byline = paste0('Change of ',
                    round(100*store$change[store$group == 'closed'],1),
                    '% compared to annual average of ',
                    round(store$avg_age_days_annual[store$group == 'closed'],1),
                    ' days')
  )
  return(out)
}

#* Return total Open PRs
#* @post /opened_total
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(created_at, merged_at, closed_at) %>%
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      condition_date = as.Date(ifelse(is.na(merged_at), Sys.Date(), merged_at), origin = '1970-01-01')) %>%
    summarise(
      total = sum(is.na(closed_at) & is.na(merged_at))
    )
  out <- tibble(
    name = 'How Many PRs Are Open?',
    value = as.character(store$total),
    unit_type = 'PRs',
    description = "This number represents the current number of open PRs in the repository. If a large number of PRs are constantly open, it can represent bottlenecks in the review process.",
    change_direction = NULL,
    byline = "Total Open PRs in this repository")
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
      condition_date = case_when(
        is.na(merged_at) ~ Sys.Date(),
        TRUE ~ as.Date(merged_at, origin = '1970-01-01')),
      age_days = round(difftime(
        condition_date,
        created_at,
        units = 'days'), 0)) %>%
    summarise(
      total = sum(is.na(closed_at) & is.na(merged_at)),
      avg_days_currently_open = as.numeric(mean(age_days[is.na(closed_at) & is.na(merged_at)], na.rm = TRUE)),
      annual_avg_days = as.numeric(mean(age_days[!is.na(merged_at)], na.rm = TRUE))
    )
  out <- tibble(
    name = 'How Old Are The Open PRs?',
    value = ifelse(is.nan(store$avg_days_currently_open), '-', round(store$avg_days_currently_open, 1)),
    unit_type = 'days',
    description = "This value represents the average age of the currently open PRs.

All PRs will take some time to be reviewed and to have review feedback implemented. However, an excessivly long length of time before merging can indicate problems with the way work is being done. Additionally, the longer PRs exist, the more at risk they become to being closed rather than merged.",
    change_direction = ifelse(
      store$avg_days_currently_open > store$annual_avg_days,
      'increase',
      'decrease'
      ),
    sentiment = ifelse(change_direction == 'increase', 'negative', 'positive'),
    byline = paste0('Compared to Annual Average of ',
                    ifelse(is.nan(store$annual_avg_days), '-', round(store$annual_avg_days, 1)),
                    ' ',
                    ifelse(!is.numeric(store$change), paste0('(-%)'),
                           paste0('(', round(100*store$change,1), '%)'))))
  return(out)
}
