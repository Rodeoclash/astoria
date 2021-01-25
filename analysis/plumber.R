library(dplyr)
library(data.table)
library(lubridate)
library(anytime)

######### TIMELINES #########

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

#* PRs created each month
#* @post /open_timeline
function(req) {
  payload <- req$body %>% as.data.table()
  payload %>%
    select(created_at) %>% 
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      date = anytime::iso8601(anytime(as.Date(lubridate::floor_date(created_at, unit = 'month'))))) %>% 
    group_by(date) %>% 
    summarise(total = n())
}

#* The weekly rolling average of ages of merged PRs
#* @post /merged_age_timeline
function(req) {
  payload <- req$body %>% as.data.table()
  payload %>%
    select(created_at, merged_at) %>% 
    mutate(
      created_at = lubridate::ymd_hms(created_at),
      merged_at = lubridate::ymd_hms(merged_at),
      date = anytime::iso8601(anytime(as.Date(lubridate::floor_date(merged_at, unit = 'month')))),
      age = round(difftime(merged_at,created_at, unit = 'days'),1),
      age = ifelse(is.na(age), 
                   round(difftime(Sys.Date(),created_at, unit = 'days'),1),
                   age)
      ) %>% 
    group_by(date) %>% 
    summarise(
      total_merged = n(),
      total_age_in_days = round(sum(age, na.rm = TRUE),0),
      mean_age_in_days = round(mean(age, na.rm = TRUE),2)
    )
}  


######### HERO NUMBERS #########

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
* Underconfident developers avoiding reviews

### Increased through:
* Education around the benefits of using PRs to merge code
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
    name = 'How old were lost PRs?',
    value = as.character(round(store$avg_age_days_current[store$group == 'closed'],1)),
    unit_type = 'days',
    description = "This value represents the average age of PRs that closed without being merged (a.k.a 'lost' PRs).

A closed PR does not always mean that time was wasted, however it does indicate that the initial assumptions that lead to the PR being created have likely changed. This can include:

### Decreased due to:
* Well reasoned and designed features
* Education in the team around the benefits of timely reviews

### Increased through:
* Delayed Code reviews
* Changing requirements
* Developers moving on to new features",
    change_direction = ifelse(store$change[store$group == 'closed'] > 0,
                              'increase',
                              'decrease'),
    byline = paste0('Change of **',
                    round(100*store$change[store$group == 'closed'],1),
                    '%** compared to annual average of **',
                    round(store$avg_age_days_annual[store$group == 'closed'],1),
                    '** days')
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
      condition_date = case_when(
        is.na(merged_at) ~ Sys.Date(),
        TRUE ~ as.Date(merged_at, origin = '1970-01-01'))
    ) %>%
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
    ) %>% 
    mutate(
      diff = avg_days_currently_open - annual_avg_days,
      change = diff / annual_avg_days
    )
  out <- tibble(
    name = 'How old are the open PRs?',
    value = ifelse(is.nan(store$avg_days_currently_open), '-', round(store$avg_days_currently_open, 1)),
    unit_type = 'days',
    description = "This value represents the average length of time open PRs have been waiting for review.

All PRs will take some time to be reviewed and to have review feedback implemented. However, an excessivly long length of time before merging can indicate problems with the way work is being done. Additionally, the longer PRs exist, the more at risk they become to being closed rather than merged.

### Decreased due to:
* Education in the team around the benefits of timely reviews
* Systems to notify and remind developers of open PRs

### Increased due to:
* Developers concentrating on other priorities
* Underconfident developers avoiding reviews",
    change_direction = ifelse(
      store$avg_days_currently_open > store$annual_avg_days,
      'increase',
      'decrease'
      ),
    sentiment = ifelse(change_direction == 'increase', 'negative', 'positive'),
    byline = paste0('Compared to Annual Average of **',
                    ifelse(is.nan(store$annual_avg_days), 
                           '-**', 
                           paste0(round(store$annual_avg_days, 1), '**')),
                    ifelse(!is.numeric(store$change), 
                           paste0(' there is no noteable change.'),
                           paste0(' there is a change of **', round(100*store$change,1), '%**.'))))
  return(out)
}



#* Last 30 day changed lines compared to previous 30 day interval
#* @post /changed_lines
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(merged_at, additions, deletions) %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at)
      ) %>%
    filter(
      merged_at > Sys.Date() - days(60) & !is.na(merged_at)
    ) %>% 
    mutate(
      group = case_when(
        merged_at > Sys.Date() - days(30) ~ 'current',
        TRUE ~ 'previous'
      ),
      lines = as.numeric(additions) + as.numeric(deletions)
    ) %>% 
    group_by(
      group
    ) %>% 
    summarise(
      total_lines = sum(lines)
    ) %>% 
    mutate(
      diff = total_lines[group == 'current'] - total_lines[group == 'previous'],
      change = diff / total_lines
    )
  out <- tibble(
    name = 'How many lines of code were merged?',
    value = ifelse(is.nan(store$total_lines[store$group == 'current']), 
                   '-', 
                   store$total_lines[store$group == 'current']),
    unit_type = 'lines',
    description = "This value represents the number of added or deleted lines of code merged in the last 30 days.

TO BE EDITED 
All PRs will take some time to be reviewed and to have review feedback implemented. However, an excessivly long length of time before merging can indicate problems with the way work is being done. Additionally, the longer PRs exist, the more at risk they become to being closed rather than merged.

### Decreased due to:
* 

### Increased due to:
* ",
    change_direction = ifelse(
      store$total_lines[store$group == 'current'] > store$total_lines[store$group == 'previous'],
      'increase',
      'decrease'
    ),
    sentiment = ifelse(change_direction == 'increase', 'positive', 'negative'),
    byline = paste0('Compared to last 30 day total of **',
                    ifelse(is.nan(store$total_lines[store$group == 'previous']), 
                           '-**', 
                           paste0(store$total_lines[store$group == 'previous'], '**')),
                    ifelse(!is.numeric(store$change[store$group == 'current']), 
                           paste0(' there is no noteable change.'),
                           paste0(' there is a change of **', round(100*store$change[store$group == 'current'],1), '%**.'))))
  return(out)
}


#* Grabs historic merged to closed PR ratio 
#* @post /merged_closed_ratio
function(req) {
  payload <- req$body %>% as.data.table()
  store <- payload %>%
    select(merged_at, closed_at) %>%
    mutate(
      merged_at = lubridate::ymd_hms(merged_at),
      closed_at = lubridate::ymd_hms(closed_at)
    ) %>%
    summarise(
      merged = sum(!is.na(merged_at)),
      closed = sum(is.na(merged_at) & !is.na(closed_at))
    ) %>% 
    mutate(
      ratio = merged / closed
    )
  out <- tibble(
    name = 'What Ratio of PRs are Utilised Work?',
    value = ifelse(is.nan(store$ratio), 
                   '-', 
                   store$total_lines[store$group == 'current']),
    unit_type = 'PRs',
    description = "This value demonstrates the historical ratio between PRs that are merged and those that are closed.

TO BE EDITED 
A ratio of 3 indicates for every single closed PR where no code was merged to master branch, there were 3 successful merges that utilised code changes.

Ideal ratio of 5 to 1?
Bad is less than 3 to 1?

### Above 5 ratio due to:
* Efficient review systems

### Below 1 ratio due to:
* Large dumps of redundant PRs
* ",
    # change_direction = ifelse(
    #   store$total_lines[store$group == 'current'] > store$total_lines[store$group == 'previous'],
    #   'increase',
    #   'decrease'
    # ),
    sentiment = case_when(store$ratio > 10 ~ 'positive', 
                          store$ratio < 1 ~ 'negative',
                          TRUE ~ 'neutral'),
    byline = paste0('There have been **',
                    ifelse(is.nan(store$ratio), 
                           '-**', 
                           paste0(round(store$ratio,1), '**')),
                    'successful merges for every 1 closed PR.')
    )
  return(out)
}




## TODO: create timeline of closed
## TODO: create timeline of additions and deletions
