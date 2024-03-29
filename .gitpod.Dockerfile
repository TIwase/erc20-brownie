FROM gitpod/workspace-full-vnc:latest
SHELL ["/bin/bash", "-c"]
USER gitpod
RUN python -m venv ~/venvERC20 \
    && source ~/venvERC20/bin/activate \
    && python -m pip install --upgrade pip \
    && pip install eth-brownie \
    && npm install -g ganache-cli \
    && echo "source ~/venvERC20/bin/activate" >> ~/.bashrc

# RUN apt update \
#    && yes | apt install nodejs \
#    && yes | apt install npm \
#    && python -V \
#    && echo "Nodejs Version: " && nodejs -v \
#    && echo "npm Version: " && npm --version
