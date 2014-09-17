" For version 6.x: Quit when a syntax file was already loaded
syntax clear
let s:keepcpo= &cpo
set cpo&vim

syn case ignore
syn match cmakeEscapedOverride /\(\\\\\|\\"\|\\n\|\\t\)/ contained
syn region cmakeCommentOverride start="#" end="$" contains=@Spell,cmakeTodo
syn region cmakeRegistryOverride start=/\[/ end=/]/
            \ contained oneline contains=CONTAINED,cmakeTodo,cmakeEscaped
syn region cmakeVariableValueOverride start=/\${/ end=/}/
            \ contained oneline contains=CONTAINED,cmakeTodo
syn region cmakeEnvironmentOverride start=/\$ENV{/ end=/}/
            \ contained oneline contains=CONTAINED,cmakeTodo
syn region cmakeStringOverride start=/"/ end=/"/ 
            \ contains=CONTAINED,cmakeTodo,cmakeOperators
syn region cmakeArgumentsOverride start=/(/ end=/)/ 
            \ contains=ALLBUT,cmakeArguments,cmakeTodo
syn keyword cmakeSystemVariablesOverride
            \ WIN32 UNIX APPLE CYGWIN BORLAND MINGW MSVC MSVC_IDE MSVC60 MSVC70 MSVC71 MSVC80 MSVC90
syn keyword cmakeOperatorsOverride
            \ ABSOLUTE AND BOOL CACHE COMMAND DEFINED DOC EQUAL EXISTS EXT FALSE GREATER INTERNAL LESS MATCHES NAME NAMES NAME_WE NOT OFF ON OR PATH PATHS PROGRAM STREQUAL STRGREATER STRING STRLESS TRUE
            \ contained
syn keyword cmakeDeprecatedOverride ABSTRACT_FILES BUILD_NAME SOURCE_FILES SOURCE_FILES_REMOVE VTK_MAKE_INSTANTIATOR VTK_WRAP_JAVA VTK_WRAP_PYTHON VTK_WRAP_TCL WRAP_EXCLUDE_FILES
           \ nextgroup=cmakeArguments

" The keywords are generated as:  cmake --help-command-list | tr "\n" " "
syn keyword cmakeStatementOverride 
      \ ADD_CUSTOM_COMMAND ADD_CUSTOM_TARGET ADD_DEFINITIONS ADD_DEPENDENCIES ADD_EXECUTABLE ADD_LIBRARY ADD_SUBDIRECTORY ADD_TEST AUX_SOURCE_DIRECTORY BUILD_COMMAND BUILD_NAME CMAKE_MINIMUM_REQUIRED CONFIGURE_FILE CREATE_TEST_SOURCELIST ELSE ELSEIF ENABLE_LANGUAGE ENABLE_TESTING ENDFOREACH ENDFUNCTION ENDIF ENDMACRO ENDWHILE EXEC_PROGRAM EXECUTE_PROCESS EXPORT_LIBRARY_DEPENDENCIES FILE FIND_FILE FIND_LIBRARY FIND_PACKAGE FIND_PATH FIND_PROGRAM FLTK_WRAP_UI FOREACH FUNCTION GET_CMAKE_PROPERTY GET_DIRECTORY_PROPERTY GET_FILENAME_COMPONENT GET_SOURCE_FILE_PROPERTY GET_TARGET_PROPERTY GET_TEST_PROPERTY IF INCLUDE INCLUDE_DIRECTORIES INCLUDE_EXTERNAL_MSPROJECT INCLUDE_REGULAR_EXPRESSION INSTALL INSTALL_FILES INSTALL_PROGRAMS INSTALL_TARGETS LINK_DIRECTORIES LINK_LIBRARIES LIST LOAD_CACHE LOAD_COMMAND MACRO MAKE_DIRECTORY MARK_AS_ADVANCED MATH MESSAGE OPTION OUTPUT_REQUIRED_FILES PROJECT QT_WRAP_CPP QT_WRAP_UI REMOVE REMOVE_DEFINITIONS SEPARATE_ARGUMENTS SET SET_DIRECTORY_PROPERTIES SET_SOURCE_FILES_PROPERTIES SET_TARGET_PROPERTIES SET_TESTS_PROPERTIES SITE_NAME SOURCE_GROUP STRING SUBDIR_DEPENDS SUBDIRS TARGET_LINK_LIBRARIES TRY_COMPILE TRY_RUN UNSET USE_MANGLED_MESA UTILITY_SOURCE VARIABLE_REQUIRES VTK_MAKE_INSTANTIATOR VTK_WRAP_JAVA VTK_WRAP_PYTHON VTK_WRAP_TCL WHILE WRITE_FILE
            \ nextgroup=cmakeArguments
syn keyword cmakeTodoOverride 
            \ TODO FIXME XXX 
            \ contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cmake_syntax_inits")
  if version < 508
    let did_cmake_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cmakeStatementOverride Identifier
  HiLink cmakeCommentOverride Comment
  HiLink cmakeStringOverride String
  HiLink cmakeVariableValueOverride Type
  HiLink cmakeRegistryOverride Underlined
  HiLink cmakeArgumentsOverride Todo
  HiLink cmakeEnvironmentOverride Special
  HiLink cmakeOperatorsOverride Operator
  HiLink cmakeMacroOverride PreProc
  HiLink cmakeErrorOverride Error
  HiLink cmakeTodoOverride TODO
  HiLink cmakeEscapedOverride Special

  delcommand HiLink
endif

let b:current_syntax = "cmake"

let &cpo = s:keepcpo
unlet s:keepcpo

"EOF"
