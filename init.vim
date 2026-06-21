if has('win32')
  language en_US
else
  language en_US.UTF-8
endif
lua dofile(vim.fn.stdpath('config') .. '/config.lua')
lua vim.g.go_highlight_functions = 1
lua vim.g.go_highlight_function_parameters = 1
lua vim.g.go_highlight_function_calls = 1
lua vim.g.go_highlight_fields = 1
lua vim.g.go_highlight_types = 1
lua vim.g.go_highlight_extra_types = 1
lua vim.g.go_highlight_variable_assignments = 1
lua vim.g.go_highlight_variable_declarations = 1
:set number " show line numbers
:set relativenumber " show line number on the current line relative to other lines
:set autoindent " sets newline to inherit the indentation of prev lines
:set shiftround "When shifting lines, round the indentation to the nearest multiple of shiftwidth.
:set tabstop=4 " indents using 4 spaces
:set shiftwidth=4 " sets 4 spaces indents when shifting
:set smarttab " sets tabstop number of spaces when the tab is pressed
:set softtabstop=4 " sets 4 spaces when tab or backspace is pressed
:set mouse=a " enables the mouse for scrolling and resize 
:set smartcase " set shiftround: When shifting lines, round the indentation to the nearest multiple of shiftwidth.
:set hlsearch " enable highlighting when searching
:set wrap "text wrapping
:set whichwrap+=<,>,[,]
:set laststatus=2 
:set foldmethod=indent
:set foldnestmax=3
:set history=1000

set exrc "Automatically run .nvim.lua files in the current directory. This is useful for project-specific configurations."
set secure "Forces you to confirm before executing commands in .nvim.lua. Open the file and run :trust to allow it to execute without confirmation in the future."
