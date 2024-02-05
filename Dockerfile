FROM alpine:latest

RUN apk add git lazygit neovim ripgrep nodejs npm alpine-sdk --update

RUN git clone https://github.com/Lenoxo/nvim-config.git ~/.config/nvim

COPY ["./context", "/root/"]

RUN mkdir /home/temp

WORKDIR /home/temp
