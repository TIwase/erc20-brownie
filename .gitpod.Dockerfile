FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install python3

RUN apt update \
#    && apt install nodejs npm
