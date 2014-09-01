" folding.vim - Folding rules and text for c/c++

"Folds all doxygen block comments in current file, i.e /** ... */
function! s:FoldAllDoxygenFunc()
	let linenum = 1
	let numlines = line('$')
	while(linenum <= numlines)	"Traverse all lines
		let line = getline(linenum)
		
		"Only for doxygen comment block
		if(match(line,'^\s*/\*\*') >= 0)
			let beginlinenum = linenum

			"Ignore other lines until end of comment
			while(match(getline(linenum),'\*/\s*$') < 0 && linenum <= numlines)
				let linenum = linenum + 1
			endwhile

			"Since the block might be already folded, unfold completely first, then fold
			if(beginlinenum != linenum)
				exec ':' . beginlinenum . 'foldopen!'
				exec ':' . beginlinenum . 'foldclose'
			endif
		endif
		let linenum = linenum + 1
	endwhile
endfunction
command! FoldAllDoxygen call <SID>FoldAllDoxygenFunc()

"Returns the first nonempty line among the given lines after leading comment chars (*,/) are removed
function! s:GetFirstNonemptyLine(lines)
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

	"Decide on fold text based on the first line of the fold
	if match(firstline,'^\s*/\*\*') >= 0																			"Doxygen block

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
			let infotext = indentation . "/** " . s:GetFirstNonemptyLine(lines) . " */"
		endif

	elseif match(firstline,'^\s*/\*') >= 0																			"Regular comment block
		let infotext = indentation . "/* " . s:GetFirstNonemptyLine(getline(v:foldstart,v:foldend)) . " */"

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

	"elseif match(firstline,'^\s*{\s*$') >= 0																		"Line with single {
	"	let infotext = 'asdasdasd'

	else																											"Uninteresting block
		let infotext = indentation . substitute(firstline,'^\s*','','')
	endif

	"Print trailing { prettier, if any
	let infotext = substitute(infotext,'{\s*$','{ ... } ','')

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

