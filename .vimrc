set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
"   is a fast, as-you-type, fuzzy-search code completion engine for Vim, 
"   it provide a Jedi-based completion engine for Python. 
Plugin 'Valloric/YouCompleteMe'

" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim. Based
" on the default htmlcomplete.vim
Plugin 'othree/html5.vim'

" vim-javascript
" JavaScript bundle for vim, this bundle provides syntax highlighting and
" improved indentation.
Plugin 'pangloss/vim-javascript'

" SimpylFold
Plugin 'tmhedberg/SimpylFold'

" indentpython
Plugin 'vim-scripts/indentpython.vim'

" ALE - Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Enable GIT support
Plugin 'tpope/vim-fugitive'
" Shows signs for added, modified, and removed lines.
Plugin 'airblade/vim-gitgutter'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-virtualenv
Plugin 'jmcantrell/vim-virtualenv'

" vim-auto-save
Plugin '907th/vim-auto-save'

" Better JSON for VIM
Plugin 'elzr/vim-json'

" Track the engine
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" The NERDTree is a file system explorer for the Vim editor
Plugin 'scrooloose/nerdtree'
" NERDTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
"     Powerline, Unite, vim-startify and more 
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line 

autocmd FileType kivy set sw=4
autocmd FileType kivy set ts=4
autocmd FileType kivy set sts=4
autocmd FileType kivy set smarttab
autocmd FileType kivy set expandtab

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set smarttab
autocmd FileType python set expandtab

autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set smarttab
autocmd FileType html set expandtab

autocmd FileType htmldjango set sw=2
autocmd FileType htmldjango set ts=2
autocmd FileType htmldjango set sts=2
autocmd FileType htmldjango set smarttab
autocmd FileType htmldjango set expandtab

autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set smarttab
autocmd FileType javascript set expandtab

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> <C-W><C-W>


" YouCompleteMe settings
"let g:ycm_server_python_interpreter = '/usr/bin/python2' 
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion=1

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
" Enable folding with the spacebar
nnoremap <space> za

" Syntax highligthing
let python_highlight_all=1
syntax on

" Color schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set t_Co=256
  colorscheme zenburn
endif
call togglebg#map("<F5>")

" Vim-Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
set noshowmode
let g:airline_skip_empty_sections = 1

" Other settings
" set nu        " number of line

" ALE
"let g:ale_sign_warning = '♪'
let g:ale_sign_warning = 'W'
let g:ale_sign_error = 'E'
highlight ALEWarningSign ctermfg=185 ctermbg=235 cterm=bold
highlight ALEErrorSign ctermfg=172 ctermbg=235 cterm=bold
"highlight link ALEWarningSign LineNr
"highlight link ALEErrorSign Title
nmap ]l :ALENextWrap<CR>
nmap [l :ALEPreviousWrap<CR>

let g:airline#extensions#ale#enabled = 1

" GitGutter
" Change styling and updatetime
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'
set updatetime=250

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

" SNIPPETS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F1>"

" The NERDTree
nmap <C-n> :NERDTreeToggle<CR>

