#* Return the PRs merged for the month
#* @param json input json payload
#* @post /total_month
function(json) {
  payload <- jsonlite::fromJSON(json) %>% as.data.table()
  payload$year <- lubridate::year(payload$merged_at)
  payload$month <- lubridate::month(payload$merged_at)
  payload$month_label <- lubridate::month(payload$merged_at, label = T)
  payload %>%
    dplyr::count(year, month, month_label)
}

#* Return the monthly changes of PRs merged
#* @param json input json payload
#* @post /monthly_changes
function(json) {
  payload <- jsonlite::fromJSON(json) %>% as.data.table()
  payload %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      YearMonth = format(merged_at, '%Y-%m')
    ) %>%
    filter(!is.na(year_month)) %>%
    group_by(year_month) %>%
    summarise(monthly_total = n()) %>%
    arrange(year_month) %>%
    mutate(
      monthly_change = (monthly_total - lag(monthly_total)) / lag(monthly_total)
    )
}
