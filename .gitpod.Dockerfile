FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && apt-get install python3 python3-venv

RUN apt update \
    && apt install nodejs npm
