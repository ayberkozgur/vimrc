"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Visual
set showcmd													"Show commands on bottom in normal mode
set number													"Show line numbers
set showmatch												"Show matching parenthesis
set hlsearch												"Highlight search terms
set incsearch												"Show search matches when typing
set list													"Make whitespace chars visible
set listchars=tab:»\ ,trail:.,extends:#,nbsp:.				"Chars to display on whitespace chars
syntax enable												"Turn on colorsl
set background=dark											"Dark background option for Solarized
set t_Co=256												"Turn on 256 color support
colorscheme mustang											"Set color scheme to mustang

"Mouse related
set mouse=a													"Mouse can select by clicking

"Functional
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
set clipboard+=unnamed										"Use the system clipboard instead of buffer

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

"F4: Autoindent all
nnoremap <F4> gg=G<C-o><C-o>

"CTRL+s: Save
noremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>a

"CTRL+w: Quit
noremap <C-w> :quit<CR>
inoremap <C-w> <ESC>:quit<CR>

"CTRL+t: Open new tab
noremap <C-t> :tabnew<CR>
inoremap <C-t> <ESC>:tabnew<CR>

"CTRL+q: Switch between c++ source and header
noremap <C-q> :AT<CR>
inoremap <C-q> <ESC>:AT<CR>

"CTRL+c: Comment/uncomment selected
vnoremap <C-c> :call NERDComment(1,'toggle')<CR>

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

nnoremap <S-RIGHT> v<RIGHT>
inoremap <S-RIGHT> <ESC>v<RIGHT>
vnoremap <S-RIGHT> <RIGHT>

nnoremap <S-LEFT> v<LEFT>
inoremap <S-LEFT> <ESC>v<LEFT>
vnoremap <S-LEFT> <LEFT>

nnoremap <S-UP> v<UP>
inoremap <S-UP> <ESC>v<UP>
vnoremap <S-UP> <UP>

nnoremap <S-DOWN> v<DOWN>
inoremap <S-DOWN> <ESC>v<DOWN>
vnoremap <S-DOWN> <DOWN>

"ı/İ: INSERT mode
nnoremap ı i
nnoremap İ I

"CTRL+z: Undo
map <C-z> u
imap <C-z> <ESC>ui
vnoremap <C-z> <ESC>u

"CTRL+y: Redo
nnoremap <C-y> <C-r>
inoremap <C-y> <ESC><C-r>i
vnoremap <C-y> <ESC><C-r>

"CTRL+g: Go to definition/declaration
map <C-G> <ESC> :tab split<CR>:YcmCompleter GoTo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F2> :NERDTreeTabsToggle<CR>						"Press F2 to toggle NERDTreeTabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8											"Set encoding to utf-8
set laststatus=2											"Show 2-tall statusbar always
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim		"Enable powerline
let g:Powerline_symbols = "fancy"							"Enable fancy symbols in powerline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Syntastic config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_cpp_check_header = 1						"Check c++ includes
let g:syntastic_c_check_header = 1							"Check c includes
let g:syntastic_cpp_auto_refresh_includes = 1				"Refresh c++ includes at every save
let g:syntastic_c_auto_refresh_includes = 1					"Refresh c includes at every save

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
let g:ycm_auto_trigger = 0									"Do not auto-trigger, it's annoying

