# temp-nvim

Dockerized Neovim setup with lazyvim and pre-installed plugins based on Alpine Linux.

<!--toc:start-->
- [temp-nvim](#temp-nvim)
  - [Prerequisites](#prerequisites)
  - [How to Use](#how-to-use)
  - [How to Build](#how-to-build)
  - [License](#license)
  - [Author](#author)
<!--toc:end-->

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed on your machine.

## How to Use

In the directory you want to test this config use: `sudo docker run -it --rm -v=$PWD:/home/temp/hostfiles lenoxo/nvimdocker:latest nvim`

## How to Build

1. Place the `.local` and `.npm` folders with the cache inside `./context/` after installing plugins in another container.
   - In my case, I did it the first time with a bind mount in the current working directory, like this:
     ```bash
     cd ./context/
     mkdir .local .npm
     sudo docker run -d -v=$PWD/.npm:/root/.npm -v=$PWD/.local:/root/.local --name alpvim alpine:latest tail -f /dev/null
     ```
   - After that, install dependencies, clone the config, and open Neovim to install plugins with lazyvim:
     ```bash
     apk add git lazygit neovim ripgrep nodejs npm alpine-sdk --update
     git clone https://github.com/Lenoxo/nvim-config.git ~/.config/nvim
     nvim
     ```
   - Now you can stop the container, and the cache is saved in `.local` and `.npm` within `context/`.
2. Run `sudo docker build -t nvimdocker .` to build the image using the cache in `context/`.
3. Lastly, you can use `sudo docker run -it --rm -v=$PWD:/home/temp/hostfiles nvimdocker:latest nvim` to run Neovim.

## License
This project is under the [MIT License](LICENSE).

## Author
Emanuel Padilla ([Lenoxo](https://github.com/Lenoxo))
