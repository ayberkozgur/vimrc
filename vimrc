"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Visual config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd													"Show commands on bottom in normal mode
set number													"Show line numbers
set showmatch												"Show matching parenthesis
set hlsearch												"Highlight search terms
set incsearch												"Show search matches when typing
set list													"Make whitespace chars visible
set listchars=tab:»\ ,trail:#,extends:>,nbsp:.				"Chars to display on whitespace chars
syntax enable												"Turn on colors
set background=dark											"Dark background option
set t_Co=256												"Turn on 256 color support
colorscheme mustang											"Set color scheme to mustang

"Override mustang colors so that tabs/spaces won't stand out
hi SpecialKey guifg=#808080 guibg=#202020 gui=none ctermfg=236 ctermbg=234

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functional config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a													"Mouse can select by clicking
set hidden													"Hide buffers instead of closing
set ignorecase												"Ignore case when searching	
set smartcase												"Ignore case when all lowercase, don't ignore otherwise
set history=1000											"1000 commands/searches remembered
set undolevels=1000											"1000 undos
set title													"Set terminal's title
set visualbell												"Flash screen instead of beep
set noerrorbells											"Don't beep
set nobackup												"No backup files
set noswapfile												"No swap files
set backspace=2												"Restore backspace functionality
filetype plugin indent on									"Turn on filetype detection, filetype dependent plugins, filetype dependent indentation
set clipboard=unnamedplus									"Use the system clipboard instead of buffer
set foldmethod=syntax										"Use folding based on file syntax
autocmd BufWinLeave *.* mkview								"Save folds when closing window
autocmd BufWinEnter *.* silent loadview 					"Load folds when opening window
set autochdir												"Current working directory is always the directory of the edited file

"Indentation
set tabstop=4												"Tab is 4 spaces
set autoindent												"Always autoindent
set copyindent												"Copy the previous indendation on autoindenting
set shiftwidth=4											"Autoindent 4 spaces
set shiftround												"Use multiple of shiftwidth when indenting '<','>'
set smarttab												"Use smart tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"F3: Clear search highlight
nnoremap <F3> :nohl<CR>

"CTRL+f: Find
nnoremap <C-f> /
inoremap <C-f> <ESC>/
vnoremap <C-f> <ESC>/

"F4: Autoindent all
nnoremap <F4> gg=G<C-o><C-o>
inoremap <F4> <ESC>gg=G<C-o><C-o>a
vnoremap <F4> <ESC>gg=G<C-o><C-o>

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

"SHIFT+TAB: Switch between c++ source and header
nnoremap <S-TAB> :AT<CR>
inoremap <S-TAB> <ESC>:AT<CR>
vnoremap <S-TAB> <ESC>:AT<CR>

"CTRL+e: Comment/uncomment selected
vnoremap <C-e> :call NERDComment(1,'toggle')<CR>

"(CTRL)+SHIFT+LEFT/RIGHT/UP/DOWN: Select text in any mode
nnoremap <C-S-RIGHT> v<C-RIGHT>
inoremap <C-S-RIGHT> <ESC>v<C-RIGHT>
vnoremap <C-S-RIGHT> <C-RIGHT>

nnoremap <C-S-LEFT> v<C-LEFT>
inoremap <C-S-LEFT> <ESC>v<C-LEFT>
vnoremap <C-S-LEFT> <C-LEFT>

nnoremap <C-S-UP> v<C-UP>
inoremap <C-S-UP> <ESC>v<C-UP>
vnoremap <C-S-UP> <C-UP>

nnoremap <C-S-DOWN> v<C-DOWN>
inoremap <C-S-DOWN> <ESC>v<C-DOWN>
vnoremap <C-S-DOWN> <C-DOWN>

nnoremap <S-RIGHT> vl
inoremap <S-RIGHT> <ESC>vl
vnoremap <S-RIGHT> l

nnoremap <S-LEFT> vh
inoremap <S-LEFT> <ESC>vh
vnoremap <S-LEFT> h

nnoremap <S-UP> vk
inoremap <S-UP> <ESC>vk
vnoremap <S-UP> k

nnoremap <S-DOWN> vj
inoremap <S-DOWN> <ESC>vj
vnoremap <S-DOWN> j

"LEFT/RIGHT/UP/DOWN: Exits the visual mode
vnoremap <RIGHT> <ESC><RIGHT>
vnoremap <LEFT> <ESC><LEFT>
vnoremap <UP> <ESC><UP>
vnoremap <DOWN> <ESC><DOWN>

"ı/İ: INSERT mode
nnoremap ı i
nnoremap İ I

"CTRL+z: Undo
nnoremap <C-z> u
inoremap <C-z> <ESC>ui
vnoremap <C-z> <ESC>u

"CTRL+y: Redo (the default CTRL+r can also be used)
nnoremap <C-y> <C-r>
inoremap <C-y> <ESC><C-r>i
vnoremap <C-y> <ESC><C-r>

"Double left click: Go to definition/declaration
map <2-LeftMouse> <ESC> :tab split<CR>:YcmCompleter GoTo<CR>

"CTRL+d: Add doxygen block to whatever is under the cursor
nnoremap <C-d> :Dox<CR>
inoremap <C-d> <ESC>:Dox<CR>

"Right click to expand/collapse fold
nnoremap <RightMouse> za
vnoremap <RightMouse> <ESC>za
inoremap <RightMouse> <ESC>za

"CTRL-c in visual mode: Copy (yank) to system clipboard
vnoremap <C-c> "*y

"CTRL-x in visual mode: Cut (just delete) to system clipboard
vnoremap <C-x> "*d

"CTRL-v: Paste (put) from system clipboard
nnoremap <C-v> "*P
inoremap <C-v> <ESC>"*pa
vnoremap <C-v> "*p

"CTRL+q: Escape
inoremap <C-q> <ESC>
vnoremap <C-q> <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"F2: Toggle NERDTreeTabs
nnoremap <F2> :NERDTreeTabsToggle<CR>:wincmd l<CR>
inoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>a
vnoremap <F2> <ESC>:NERDTreeTabsToggle<CR>:wincmd l<CR>

"F5: Refresh
let NERDTreeMapRefresh='<F5>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8											"Set encoding to utf-8
set laststatus=2											"Show 2-tall statusbar always
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim		"Enable powerline
let g:Powerline_symbols = "fancy"							"Enable fancy symbols in powerline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDComment config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDCommentWholeLinesInVMode=1							"Comment whole lines instead of just the selected part

"C,C++ comments should be //
let g:NERDCustomDelimiters = {
			\ 'c': { 'left': '//' },
			\ 'cpp': { 'left': '//' }
			\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_auto_trigger = 0									"Do not auto-trigger, it's annoying
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UltiSnips config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<TAB>"						"TAB to expand snippet
let g:UltiSnipsJumpForwardTrigger="<TAB>"					"TAB to the next placeholder
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"				"SHIFT+TAB	to the previous placeholder

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"DoxygenToolkit config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:DoxygenToolkit_authorName="Ayberk Özgür"				"Author name to be put at @author tags

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
	if filereadable(expand("%")) && match(readfile(expand("%")),"")
		return 2
	elseif line2byte(line('$') + 1) <= 0
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
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>c_cpp_header_init()

"Treat opened empty *.h and *.hpp files as new files
function! s:c_cpp_header_empty_init()
	if FileIsEmpty()
		call <SID>c_cpp_header_init()
	endif
endfunction
autocmd BufRead *.{h,hpp} call <SID>c_cpp_header_empty_init()

"Add GPL and doxygen header to new *.c and *.cpp files. For cpp files, create
"header too if doesn't exist yet.
function! s:c_source_init()
	filetype detect
	:DoxLic
	normal o
	:DoxAuthor
endfunction
autocmd BufNewFile *.c call <SID>c_source_init()

function! s:cpp_source_init()
	filetype detect
	:DoxLic
	normal o
	:DoxAuthor
	"Create header too if one doesn't exist yet
	let header_filename = expand("%:r") . ".h"
	let header_filename2 = expand("%:r") . ".hpp"
	if !filereadable(header_filename) && !filereadable(header_filename2)
		AT
		call <SID>c_cpp_header_empty_init()
	endif
endfunction
autocmd BufNewFile *.cpp call <SID>cpp_source_init()

"Treat opened empty *.c and *.cpp files as new files
function! s:c_source_empty_init()
	if FileIsEmpty()
		call <SID>c_source_init()
	endif
endfunction
autocmd BufRead *.c call <SID>c_source_empty_init()

function! s:cpp_source_empty_init()
	if FileIsEmpty()
		call <SID>cpp_source_init()
	endif
endfunction
autocmd BufRead *.cpp call <SID>cpp_source_empty_init()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabline color config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi TabLine		ctermfg=Black	ctermbg=DarkGrey	cterm=NONE
hi TabLineFill	ctermfg=Black	ctermbg=DarkGrey	cterm=NONE
hi TabLineSel	ctermfg=White	ctermbg=Red			cterm=NONE

