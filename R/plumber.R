library(dplyr)
library(data.table)
library(lubridate)
library(anytime)

#* Return the monthly changes of PRs merged
#* @param json input json payload
#* @post /monthly_total_change
function(json) {
   payload <- jsonlite::fromJSON(json) %>% as.data.table()
   payload %>% 
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      year_month = format(merged_at, '%Y-%m'),
      date = anytime::iso8601(anytime(paste0(year_month, '-01')))
    ) %>%
    filter(!is.na(year_month)) %>% 
    group_by(date) %>% 
    summarise(total = n()) %>% 
    arrange(date) %>% 
    mutate(
      change = (total - lag(total)) / lag(total),
      mom_change  = (total - lag(total, 12)) / lag(total,12)
    )
}

#* Return the weekly changes of PRs merged
#* @param json input json payload
#* @post /weekly_total_change
function(json) {
  payload <- jsonlite::fromJSON(json) %>% as.data.table()
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
#* @param json input json payload
#* @post /last30_total
function(json) {
  payload <- jsonlite::fromJSON(json) %>% as.data.table()
  payload %>% 
    mutate(
      merged_at = lubridate::ymd_hms(merged_at)) %>%
    filter(!is.na(year_month) & merged_at > (Sys.Date() - days(60))) %>%
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


