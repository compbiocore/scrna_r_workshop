FROM jupyter/r-notebook:4.0.3

USER root

WORKDIR /home

COPY ./packages.R /home

RUN Rscript /home/packages.R
