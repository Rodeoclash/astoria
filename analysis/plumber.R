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
  payload %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at)) %>%
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
}

#* Return the longterm (annual) average ages of merged and closed PRs against current month 
#* @post /merged_closed_age
function(req) {
  payload <- req$body %>% as.data.table()
  payload %>%
    select(merged_at, closed_at) %>% 
    filter(!is.na(closed_at)) %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      closed_at = lubridate::ymd_hms(closed_at),
      group = ifelse(is.na(merged_at) & !is.na(closed_at),
                      'closed',
                      'merged')) %>%
    filter(closed_at < Sys.Date() - years(1))
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
}

payload <- jsonlite::fromJSON('payload_test/payload_large.json')
