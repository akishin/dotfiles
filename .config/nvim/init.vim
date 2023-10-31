" let g:python_host_prog = '~/.asdf/installs/python/neovim2/bin/python'
let g:python3_host_prog = '~/.asdf/installs/python/neovim3/bin/python'
" let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
" let g:node_host_prog = '/usr/local/bin/neovim-node-host'
" let g:perl_host_prog = '/path/to/perl'

" let g:loaded_python3_provider = 0
" let g:loaded_ruby_provider = 0
" let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

if filereadable(expand("~/dotfiles/.config/nvim/settings.vim"))
    source ~/dotfiles/.config/nvim/settings.vim
endif

if filereadable(expand("~/dotfiles/.config/nvim/mapping.vim"))
    source ~/dotfiles/.config/nvim/mapping.vim
endif

if filereadable(expand("~/dotfiles/.config/nvim/dein.vim"))
    source ~/dotfiles/.config/nvim/dein.vim
endif

