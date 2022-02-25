" Plugins
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"Startify settings
let g:startify_custom_header = [
\ '      ___           ___           ___                                    ___     ',
\ '     /__/\         /  /\         /  /\          ___        ___          /__/\    ',
\ '     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ',
\ '      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ',
\ '  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ',
\ ' /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\',
\ ' \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/',
\ '  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ',
\ '   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ',
\ '    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ',
\ '     \__\/         \__\/         \__\/           ~~~~                   \__\/    ',
\ ]

"General Vim Settings
set showmatch               " Show matching brackets.
set expandtab               " Insert spaces when TAB is pressed.
set tabstop=4               " Render TABs using this many spaces.
set shiftwidth=4            " Indentation amount for < and > commands.
set title                   " Show current file as window title
set clipboard=unnamedplus   " Share vim clipboard and system clipboard
set rtp+=/usr/local/opt/fzf

"Keybindings
map <C-p>	  :Files<CR>						
map <C-f>	  :Rg<CR>						

