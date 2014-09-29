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
set listchars=tab:»\ ,trail:#,extends:>,nbsp:.              "Chars to display on whitespace chars
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
set foldmethod=syntax                                       "Use folding based on file syntax
autocmd BufWinLeave *.* mkview                              "Save folds when closing window
autocmd BufWinEnter *.* silent loadview                     "Load folds when opening window
set autochdir                                               "Current working directory is always the directory of the edited file
set ttyfast                                                 "Fast terminal connection
set lazyredraw                                              "Postpone drawing of the screen

"Indentation
set tabstop=4                                               "Tab is 4 spaces
set autoindent                                              "Always autoindent
set copyindent                                              "Copy the previous indendation on autoindenting
set shiftwidth=4                                            "Autoindent 4 spaces
set shiftround                                              "Use multiple of shiftwidth when indenting '<','>'
set smarttab                                                "Use smart tabs
set expandtab                                               "Use spaces
set cino=N-s                                                "Do not indent namespaces in c++ code

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"F1: Vertical split
nnoremap <F1> :vsplit<CR>
inoremap <F1> <ESC>:vsplit<CR>
vnoremap <F1> <ESC>:vsplit<CR>

"F2: Toggle NERDTreeTabs
nnoremap <F2> :NERDTreeTabsToggle<CR>:wincmd l<CR>
inoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>a
vnoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>

"F3: Clear search highlight
nnoremap <F3> :nohl<CR>

"F4: Autoindent all and clean trailing whitespaces
nnoremap <F4> gg=G:silent! %s/\s\+$//<CR><C-o><C-o>
inoremap <F4> <ESC>gg=G:silent! %s/\s\+$//<CR><C-o><C-o>a
vnoremap <F4> <ESC>gg=G:silent! %s/\s\+$//<CR><C-o><C-o>

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

"F8: Fold all doxygen comment blocks
nnoremap <F8> :FoldAllDoxygen<CR>"
inoremap <F8> <ESC>:FoldAllDoxygen<CR>i"
vnoremap <F8> <ESC>:FoldAllDoxygen<CR>v"

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

"CTRL+q: Escape
nnoremap <C-q> <ESC>
inoremap <C-q> <ESC>
vnoremap <C-q> <ESC>

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

"CTRL+d: Add doxygen block to whatever is under the cursor
nnoremap <C-d> :Dox<CR>
inoremap <C-d> <ESC>:Dox<CR>

"CTRL+e: Comment/uncomment selected
vnoremap <C-e> :call NERDComment(1,'toggle')<CR>

"CTRL+a: Select all
nnoremap <C-a> ggvG
inoremap <C-a> <ESC>ggvG
vnoremap <C-a> <ESC>ggvG

"SHIFT+TAB: Switch between c++ source and header
nnoremap <S-TAB> :AV<CR>
inoremap <S-TAB> <ESC>:AV<CR>
vnoremap <S-TAB> <ESC>:AV<CR>

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
inoremap <UP> <C-o>gk
vnoremap <UP> <ESC>gk

nnoremap <DOWN> gj
inoremap <DOWN> <C-o>gj
vnoremap <DOWN> <ESC>gj

"ı/İ: INSERT mode
nnoremap ı i
nnoremap İ I

"Double left click: Go to definition/declaration
map <2-LeftMouse> <ESC> :tab split<CR>:YcmCompleter GoTo<CR>

"Right click to expand/collapse fold
nnoremap <RightMouse> za
vnoremap <RightMouse> <ESC>za
inoremap <RightMouse> <ESC>za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Continuous vsplit mode on single file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"!!!This doesn't work with wrapping, there seems to be no way of using
"scrollbind with wrapped text
function! VsplitContinuous()
    let last_visible_line = line("w$")
    set scrollbind
    :vsplit

    "Go to newly split window and disable scrollbind for now
    exec "wincmd l"
    set scrollbind!

    "Scroll to the continuation of the left window in the right window
    exec "normal " . (last_visible_line + 1) . "ggzt"

    set scrollbind
    exec "wincmd h"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8                                          "Set encoding to utf-8
set laststatus=2                                            "Show 2-tall statusbar always
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim     "Enable powerline
let g:Powerline_symbols = "fancy"                           "Enable fancy symbols in powerline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDComment config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDCommentWholeLinesInVMode=1                          "Comment whole lines instead of just the selected part

"C,C++ comments should be //
let g:NERDCustomDelimiters = {
            \ 'c': { 'left': '//' },
            \ 'cpp': { 'left': '//' }
            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_auto_trigger = 0                                 "Do not auto-trigger, it's annoying
let g:ycm_key_list_select_completion = ['<PAGEDOWN>']
let g:ycm_key_list_previous_completion = ['<PAGEUP>']
let g:ycm_confirm_extra_conf = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<TAB>"                        "TAB to expand snippet
let g:UltiSnipsJumpForwardTrigger="<TAB>"                   "TAB to the next placeholder
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"                "SHIFT+TAB  to the previous placeholder

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"DoxygenToolkit config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:DoxygenToolkit_authorName="Ayberk Özgür"              "Author name to be put at @author tags

"License text
let g:DoxygenToolkit_licenseTag="\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "Copyright (C) " . strftime("%Y") . " " . g:DoxygenToolkit_authorName . "\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "This program is free software: you can redistribute it and/or modify\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "it under the terms of the GNU General Public License as published by\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "the Free Software Foundation, either version 3 of the License, or\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "(at your option) any later version.\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "This program is distributed in the hope that it will be useful,\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "but WITHOUT ANY WARRANTY; without even the implied warranty of\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "GNU General Public License for more details.\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "You should have received a copy of the GNU General Public License\<ENTER>"
let g:DoxygenToolkit_licenseTag=g:DoxygenToolkit_licenseTag . "along with this program.  If not, see http://www.gnu.org/licenses/."

"Highlight doxygen comments (not part of DoxygenToolkit)
let g:load_doxygen_syntax=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Creation of new *.c/*.cpp/*.h/*.hpp files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Returns 1 if current file/buffer is empty, 0 otherwise
function! FileIsEmpty()
    if filereadable(expand("%")) && match(readfile(expand("%")),"") "Check file
        return 1
    elseif line2byte(line('$') + 1) <= 0 "Check buffer, may not be associated with file yet
        return 1
    else
        return 0
    endif
endfunction

"Add GPL, doxygen header and headerguards to new *.h and *.hpp files
function! s:c_cpp_header_init()
    filetype detect
    :HeaderguardAdd
    normal ggO
    :DoxLic
    normal o
    :DoxAuthor
    :%s/\s\+$// "Clean trailing whitespaces
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>c_cpp_header_init()

"Treat opened empty *.h and *.hpp files as new files
function! s:c_cpp_header_empty_init()
    if FileIsEmpty()
        call <SID>c_cpp_header_init()
    endif
endfunction
autocmd BufRead *.{h,hpp} call <SID>c_cpp_header_empty_init()

"Add GPL and doxygen header to new *.c files
function! s:c_source_init()
    filetype detect
    :DoxLic
    normal o
    :DoxAuthor
    :%s/\s\+$// "Clean trailing whitespaces
endfunction
autocmd BufNewFile *.c call <SID>c_source_init()

"Add GPL and doxygen header to new *.cpp files, create header file too if it doesn't exist yet
function! s:cpp_source_init()

    "Put license text and file summary
    filetype detect
    :DoxLic
    normal o
    :DoxAuthor
    normal Go

    "Create header
    let header_filename = expand("%:r") . ".h"
    let header_filename2 = expand("%:r") . ".hpp"
    exec "normal A#include\"" . header_filename . "\""
    normal o
    normal o
    :%s/\s\+$// "Clean trailing whitespaces
    if !filereadable(header_filename) && !filereadable(header_filename2)
        AT
        call <SID>c_cpp_header_empty_init()
    endif
endfunction
autocmd BufNewFile *.cpp call <SID>cpp_source_init()

"Treat opened empty *.c files as new
function! s:c_source_empty_init()
    if FileIsEmpty()
        call <SID>c_source_init()
    endif
endfunction
autocmd BufRead *.c call <SID>c_source_empty_init()

"Treat opened empty *.cpp files as new
function! s:cpp_source_empty_init()
    if FileIsEmpty()
        call <SID>cpp_source_init()
    endif
endfunction
autocmd BufRead *.cpp call <SID>cpp_source_empty_init()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabline color config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi TabLine      ctermfg=Black   ctermbg=DarkGrey    cterm=NONE
hi TabLineFill  ctermfg=Black   ctermbg=DarkGrey    cterm=NONE
hi TabLineSel   ctermfg=White   ctermbg=Red         cterm=NONE

