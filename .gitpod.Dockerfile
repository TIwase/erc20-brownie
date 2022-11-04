FROM gitpod/workspace-full:latest

USER root

RUN apt-get update \
    && python -m venv venvERC20

# RUN apt update \
#    && yes | apt install nodejs \
#    && yes | apt install npm \
#    && python -V \
#    && echo "Nodejs Version: " && nodejs -v \
#    && echo "npm Version: " && npm --version
