" folding.vim - Sets the fold text to a sensible thing, especially for c/c++

"Returns the first nonempty line among the given lines after leading comment chars (*,/) are removed
function! GetFirstNonemptyLine(lines)
	for line in a:lines
		let stripped = substitute(line,'^\s*/*\**/*\s*','','') "Remove comment chars
		if stripped !=# ''
			return stripped
		endif
	endfor
	return ''
endfunction

"Returns the folding text
function! SensibleFoldText()
	if &foldmethod !=# 'syntax'
		return foldtext()
	endif

	"First line tells us so many things about the folded block...
	let firstline = getline(v:foldstart)
	let indentation = substitute(matchstr(firstline,'^\s*'),'\t',repeat(' ',&tabstop),'g')

	"c/c++ source/header
	if &filetype ==# 'cpp' || &filetype ==# 'c'

		if match(firstline,'^\s*/\*\*') >= 0																				"Doxygen block

			"Try to get @brief line to display, display first nonempty line if
			"there is no @brief
			let lines = getline(v:foldstart,v:foldend)
			for line in lines
				let stripped = substitute(line,'^\s*/*\**/*\s*','','') "Remove comment chars
				if match(stripped,'^@brief') >= 0
					let infotext = indentation . "/** " . stripped . " */"
					break
				endif
			endfor
			if !exists("infotext")
				let infotext = indentation . "/** " . GetFirstNonemptyLine(lines) . " */"
			endif

		elseif match(firstline,'^\s*/\*') >= 0																			"Regular comment block
			let infotext = indentation . "/* " . GetFirstNonemptyLine(getline(v:foldstart,v:foldend)) . " */"

		elseif match(firstline,'(.*)') >= 0 																			"Function block

			"Get function name
			let functionname = matchstr(firstline,'operator\s*[=+\-*/%!<>&|~^,\[\]]*\s*(.*)') "Check for operator overloads
			if(functionname ==# '')
				let functionname = matchstr(firstline,'\s*[A-Za-z0-9_~]\+\s*(.*)')
			endif
			let functionname = substitute(functionname,'(.*)','','')	"Get rid of parentheses and arguments
			let functionname = substitute(functionname,'^\s*','','')	"Get rid of leading whitespace
			let functionname = substitute(functionname,'\s*$','','')	"Get rid of trailing whitespace

			"Catch function name imposters
			if functionname ==# 'for' || functionname ==# 'while' || functionname ==# 'if' || functionname ==#'switch' || functionname ==# 'catch'
				let infotext = indentation . substitute(firstline,'^\s*','','')
			else
				let functionindicator = functionname . '(...) ++ '
				let infotext = indentation . strpart(functionindicator . indentation,0,max([strlen(indentation),strlen(functionindicator)])) . substitute(firstline,'^\s*','','')
			endif
	
		elseif match(firstline,'^\s*\{\s*$') >= 0																		"Line with single {
			let infotext = 'asdasdasd'

		else																											"Uninteresting block
			let infotext = indentation . substitute(firstline,'^\s*','','')
		endif

		"Print trailing { prettier, if any
		let infotext = substitute(infotext,'{\s*$','{ ... } ','')

	else "File type that we don't care about from folding point of view
		let infotext = firstline
	endif

	"Add line count and percentage texts
	let filelinecount = line('$')
	let linecount = v:foldend - v:foldstart + 1
	let linecounttext = '[ ' . printf("%" . strlen(filelinecount) . "d lines - %4.1f%%", linecount, 100.0*linecount/filelinecount) . ' ]'
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let foldtextstart = strpart(infotext, 0, (winwidth(0)*2)/3)
	let foldtextend = linecounttext . repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend

endfunction
set foldtext=SensibleFoldText()

