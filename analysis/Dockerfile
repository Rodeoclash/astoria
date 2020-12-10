FROM rstudio/plumber

ENV APP_HOME=/usr/src/app

WORKDIR $APP_HOME

RUN R -e "install.packages('devtools')"
RUN R -e "devtools::install_version('jsonlite', version='1.7.1')"
RUN R -e "devtools::install_version('dplyr', version='1.0.2')"
RUN R -e "devtools::install_version('data.table', version='1.13.0')"
RUN R -e "devtools::install_version('lubridate', version='1.7.9')"
RUN R -e "devtools::install_version('anytime', version='0.3.9')"

COPY ./ $APP_HOME

CMD ["/usr/src/app/plumber_run.R"]
