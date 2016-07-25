"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Visual config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cursorline                                              "Highlight the current line
set showcmd                                                 "Show commands on bottom in normal mode
set number                                                  "Show line numbers
set showmatch                                               "Show matching parenthesis
set hlsearch                                                "Highlight search terms
set incsearch                                               "Show search matches when typing
set list                                                    "Make whitespace chars visible
set listchars=tab:>\ ,trail:#,extends:>,nbsp:.              "Chars to display on whitespace chars
syntax enable                                               "Turn on colors
set background=light                                        "Light background theme
set t_Co=256                                                "Turn on 256 color support
let g:solarized_termcolors=256                              "Turn on 256 color mode fore solarized
colorscheme solarized                                       "Set color scheme to solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functional config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a                                                 "Mouse can select by clicking
set hidden                                                  "Hide buffers instead of closing
set ignorecase                                              "Ignore case when searching
set smartcase                                               "Ignore case when all lowercase, don't ignore otherwise
set history=1000                                            "1000 commands/searches remembered
set undolevels=1000                                         "1000 undos
set title                                                   "Set terminal's title
set noerrorbells                                            "Don't beep
set nobackup                                                "No backup files
set noswapfile                                              "No swap files
set backspace=2                                             "Restore backspace functionality
filetype plugin indent on                                   "Turn on filetype detection, filetype dependent plugins, filetype dependent indentation
set clipboard=unnamedplus                                   "Use the system clipboard instead of buffer
set autochdir                                               "Current working directory is always the directory of the edited file
set ttyfast                                                 "Fast terminal connection
set lazyredraw                                              "Postpone drawing of the screen
set wrap                                                    "Soft wrap
set linebreak                                               "Only break at brk characters

"Indentation
set tabstop=4                                               "Tab is 4 spaces
set autoindent                                              "Always autoindent
set copyindent                                              "Copy the previous indendation on autoindenting
set shiftwidth=4                                            "Autoindent 4 spaces
set shiftround                                              "Use multiple of shiftwidth when indenting '<','>'
set smarttab                                                "Use smart tabs
set expandtab                                               "Use spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"F2: Toggle NERDTreeTabs
nnoremap <F2> :NERDTreeTabsToggle<CR>:wincmd l<CR>
inoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>a
vnoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>

"F3: Clear search highlight
nnoremap <F3> :nohl<CR>

"F5: Refresh
let NERDTreeMapRefresh='<F5>'

"F6: Unfold one level from top
nnoremap <F6> :%foldo<CR>
inoremap <F6> <ESC>:%foldo<CR>a
vnoremap <F6> <ESC>:%foldo<CR>

"F7: Fold one level from top
nnoremap <F7> :%foldc<CR>
inoremap <F7> <ESC>:%foldc<CR>a
vnoremap <F7> <ESC>:%foldc<CR>

"F9: Hard wrap paragraph to 120 characters
nnoremap <F9> :setlocal textwidth=120<CR>gqip:setlocal textwidth=0<CR>
inoremap <F9> <ESC>:setlocal textwidth=120<CR>gqip:setlocal textwidth=0<CR>i
vnoremap <F9> <ESC>:setlocal textwidth=120<CR>gqip:setlocal textwidth=0<CR>v

"CTRL-x in normal mode: Go to insert mode
nnoremap <C-x> i

"CTRL+z: Undo
nnoremap <C-z> u
inoremap <C-z> <ESC>ui
vnoremap <C-z> <ESC>u

"CTRL+y: Redo (the default CTRL+r can also be used)
nnoremap <C-y> <C-r>
inoremap <C-y> <ESC><C-r>i
vnoremap <C-y> <ESC><C-r>

"CTRL-c in visual mode: Copy (yank) to system clipboard
vnoremap <C-c> "+y

"CTRL-x in visual mode: Cut (just delete) to system clipboard
vnoremap <C-x> "+d

"CTRL-v: Paste (put) from system clipboard
nnoremap <C-v> "*P
inoremap <C-v> <ESC>"*pa
vnoremap <C-v> "_d"*p

"CTRL+f: Find
nnoremap <C-f> /
inoremap <C-f> <ESC>/
vnoremap <C-f> <ESC>/

"CTRL+s: Save
nnoremap <C-s> :write<CR>
inoremap <C-s> <ESC>:write<CR>a
vnoremap <C-s> <ESC>:write<CR>

"CTRL+w: Quit
nnoremap <C-w> :quit<CR>
inoremap <C-w> <ESC>:quit<CR>
vnoremap <C-w> <ESC>:quit<CR>

"CTRL+t: Open new tab
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>
vnoremap <C-t> <ESC>:tabnew<CR>

"CTRL+a: Select all
nnoremap <C-a> ggvG
inoremap <C-a> <ESC>ggvG
vnoremap <C-a> <ESC>ggvG

"(CTRL)+SHIFT+LEFT/RIGHT/UP/DOWN: Select text in any mode (with movement in visual line instead of real line)
nnoremap <C-S-RIGHT> v<C-RIGHT>
inoremap <C-S-RIGHT> <ESC>v<C-RIGHT>
vnoremap <C-S-RIGHT> <C-RIGHT>

nnoremap <C-S-LEFT> v<C-LEFT>
inoremap <C-S-LEFT> <ESC>v<C-LEFT>
vnoremap <C-S-LEFT> <C-LEFT>

nnoremap <C-S-UP> vk
inoremap <C-S-UP> <ESC>vk
vnoremap <C-S-UP> k

nnoremap <C-S-DOWN> vj
inoremap <C-S-DOWN> <ESC>vj
vnoremap <C-S-DOWN> j

nnoremap <S-RIGHT> vl
inoremap <S-RIGHT> <ESC>vl
vnoremap <S-RIGHT> l

nnoremap <S-LEFT> vh
inoremap <S-LEFT> <ESC>vh
vnoremap <S-LEFT> h

nnoremap <S-UP> vgk
inoremap <S-UP> <ESC>vgk
vnoremap <S-UP> gk

nnoremap <S-DOWN> vgj
inoremap <S-DOWN> <ESC>vgj
vnoremap <S-DOWN> gj

"LEFT/RIGHT/UP/DOWN: Exits the visual mode if in it and moves normally (with movement in visible line instead of real line)
"nnoremap <RIGHT> l "No effect
"inoremap <RIGHT> l "No effect
vnoremap <RIGHT> <ESC>l

"nnoremap <LEFT> <LEFT> "No effect
"inoremap <LEFT> <LEFT> "No effect
vnoremap <LEFT> <ESC>h

nnoremap <UP> gk
inoremap <UP> <ESC>gki
vnoremap <UP> <ESC>gk

nnoremap <DOWN> gj
inoremap <DOWN> <ESC>gji
vnoremap <DOWN> <ESC>gj

"ı/İ: INSERT mode
nnoremap ı i
nnoremap İ I

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8                                          "Set encoding to utf-8
set laststatus=2                                            "Show 2-tall statusbar always
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim     "Enable powerline
let g:Powerline_symbols = "fancy"                           "Enable fancy symbols in powerline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabline color config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi TabLine      ctermfg=Black   ctermbg=DarkGrey    cterm=NONE
hi TabLineFill  ctermfg=Black   ctermbg=DarkGrey    cterm=NONE
hi TabLineSel   ctermfg=White   ctermbg=Red         cterm=NONE
