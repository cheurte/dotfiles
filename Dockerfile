FROM alpine:latest

RUN apk add git nodejs neovim ripgrep build-base cmake fzf

RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim

RUN git clone https://github.com/cheurte/dotfiles ~/.config/dotfiles

# RUN cp -r ~/.config/dotfiles/nvim/lua/custom/ ~/.config/nvim/lua/

CMD ["nvim"]
