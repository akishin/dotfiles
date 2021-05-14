let g:python_host_prog = '~/.anyenv/envs/pyenv/versions/neovim2/bin/python' 
let g:python3_host_prog = '~/.anyenv/envs/pyenv/versions/neovim3/bin/python'

if filereadable(expand("~/dotfiles/.config/nvim/settings.vim"))
    source ~/dotfiles/.config/nvim/settings.vim
endif

if filereadable(expand("~/dotfiles/.config/nvim/mapping.vim"))
    source ~/dotfiles/.config/nvim/mapping.vim
endif

