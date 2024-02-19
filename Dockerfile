FROM alpine:latest

RUN apk add git nodejs neovim ripgrep build-base cmake fzf

RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim

CMD ["nvim"]
