# Introduction

JumpStart (née: Astoria) is an open source Github Application to read pull requests from GitHub and build analytics on top of them. Think https://www.usehaystack.io/ but less polished and created in peoples spare time.

## Current hero numbers

- How many merged PRs in the last 30 days?
- How long until work is merged?
- How old were lost PRs?
- How old are the open PRs?
- How many PRs are open?

Most hero numbers also contain comparasions with themselves over the past 30 days or previous year to be able to build a trend.

## Current charts

- PR counts over the last year per month

# Architecture

## /server

This directory contains the main web application which uses Elixir's Phoenix Framework. The frontend is written in React and uses Relay for communication. Relay subscriptions are used to provide data in real time.

## /analysis

This directory contains a series of R scripts powered by Plumber that the Phoenix application hands PRs over for analysis. This allowed easy prototyping of various data processing functions with the intention of moving them into either Postgres or another service that could crunch the data a bit faster.

# Screenshot

![Astoria Screenshot](/screenshots/1.png?raw=true "Astoria Main Page")
