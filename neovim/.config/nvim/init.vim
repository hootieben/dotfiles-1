scriptencoding utf-8
" Config file path
let g:config_path = '~/.config/nvim/'
set runtimepath+=/home/wil/.cache/dein/repos/github.com/Shougo/dein.vim

" Function for sourcing config modules
function! ConfigInc(module)
  execute 'source ' . fnameescape(g:config_path) . fnameescape(a:module)
endfunction

" Set Python host program to speed up loading
" let g:loaded_python_provider = 1
" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1
" let g:loaded_python3_provider = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" Dein config
let g:dein#install_process_timeout = 600

" Add in plugins
call ConfigInc('plugins.vim')

" Functions
call ConfigInc('functions.vim')

" Autocommands
call ConfigInc('autocmds.vim')

" Keybindings
call ConfigInc('keybindings.vim')

" Colorscheme
set termguicolors
set background=dark
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" colorscheme hybrid
colorscheme happy_hacking
" let g:two_firewatch_italics = 1
" colorscheme two-firewatch

" Haskell 
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

" Eclim 
let g:EclimCompletionMethod = 'omnifunc'

" Rainbow parens 
let g:rainbow_active = 1
let g:rainbow_conf = {
      \	'separately': {
      \		'ocaml': {
      \			'parentheses': ['start=/(\*\@!/ end=/)/ fold contains=@colorableGroup'],
      \		}
      \	}
      \}

" Airline 
let g:airline_theme = 'hybrid'
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
" " Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#alt_sep = 0
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" " ALE integration config
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:airline#extensions#ale#enabled = 1
" " Explicitly disable some extensions
let g:airline#extensions#unite#enabled = 0
let g:airline#extensions#denite#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#vimagit#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#nrrwrgn#enabled = 0
let g:airline#extensions#capslock#enabled = 0
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#windowswap#enabled = 0
let g:airline#extensions#taboo#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 0
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#neomake#enabled = 0

" Ale 
let g:ale_sign_error = '🗙'
let g:ale_sign_warning = '➤'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \ 'haskell': ['hdevtools', 'hlint'],
      \ 'cpp': ['clang', 'clangcheck', 'clangtidy', 'cppcheck', 'cpplint']
      \}
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_set_highlights = 1
let g:ale_cpp_cpplint_options = '--linelength=100'
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_linter_aliases = {'pandoc': ['markdown']}

" IndentLine 
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:indentLine_faster = 1

" Pandoc 
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#after#modules#enabled = ['ultisnips']
let g:pandoc#formatting#mode = 'haA'
let g:pandoc#formatting#textwidth = 100
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#modules#disabled = ['folding', 'commands', 'templates', 'formatting']

" Vimtex 
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_complete_enabled = 1
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_quickfix_mode = 0

" Ultisnips 
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Syntastic 
let g:syntastic_ocaml_checkers=['merlin','caml4po']

" VimFiler 
let g:vimfiler_as_default_explorer = 1

" Undotree 
if has('persistent_undo')
  set undodir=~/.undodir/
  set undofile
endif

" Tagbar 
let g:tagbar_type_haskell = {
      \ 'ctagsbin'  : 'hasktags',
      \ 'ctagsargs' : '-x -c -o-',
      \ 'kinds'     : [
      \  'm:modules:0:1',
      \  'd:data: 0:1',
      \  'd_gadt: data gadt:0:1',
      \  't:type names:0:1',
      \  'nt:new types:0:1',
      \  'c:classes:0:1',
      \  'cons:constructors:1:1',
      \  'c_gadt:constructor gadt:1:1',
      \  'c_a:constructor accessors:1:1',
      \  'ft:function types:1:1',
      \  'fi:function implementations:0:1',
      \  'o:others:0:1'
      \ ],
      \ 'sro'        : '.',
      \ 'kind2scope' : {
      \ 'm' : 'module',
      \ 'c' : 'class',
      \ 'd' : 'data',
      \ 't' : 'type'
      \ },
      \ 'scope2kind' : {
      \ 'module' : 'm',
      \ 'class'  : 'c',
      \ 'data'   : 'd',
      \ 'type'   : 't'
      \ }
      \ }

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits,traits',
      \'i:impls,trait implementations',
      \]
      \}

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records'
      \ ]
      \ }

" Racer 
let g:racer_cmd = '/usr/bin/racer'

" Gitgutter 
set updatetime=500
let g:gitgutter_sign_modified = '＊'
let g:gitgutter_sign_added = '＋'
highlight GitGutterAdd guifg = '#A3E28B'

" Vimwiki 
let g:vimwiki_list = [{'path': '$HOME/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Orgmode
let g:org_aggressive_conceal = 1
let g:org_indent = 1
let g:org_heading_shade_leading_stars = 0

" Goyo 
let g:goyo_width = 110

" Highlighting tweaks
highlight Todo cterm=bold ctermfg=0 ctermbg=3 gui=bold guifg=#3B4252 guibg=#EBCB8B | highlight Comment cterm=bold ctermfg=8 ctermbg=NONE gui=bold guifg=#B8BEC9 guibg=NONE | highlight LineNr guifg=#777777
highlight Visual guifg=NONE ctermfg=NONE guibg=#747474 ctermbg=0 gui=NONE cterm=NONE

" FZF 
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Startify 
let g:startify_list_order = [
      \ ['Update'], 'commands',
      \ ['Recent Files in Directory'], 'dir',
      \ ['Recent Files'], 'files',
      \ ['Bookmarks'], 'bookmarks',
      \ ['Sessions'], 'sessions']
let g:startify_commands = [
      \ {'u': ['Update plugins', ':Dein update']},
      \ {'c': ['Clean plugins', ':Dein clean']},
      \ {'t': ['Time startup', ':StartupTime']},
      \ {'s': ['Start Prosession', ':Prosession .']}]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []

" Vim-rooter 
" Add language-builder patterns before source control for nested projects
let g:rooter_patterns = ['.catkin_workspace', 'Cargo.toml', 'stack.yaml', '*.cabal', 'Makefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
let g:rooter_manual_only = 1
let g:rooter_change_directory_for_non_project_files = 'current'

" LanguageClient 
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'python': ['pyls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'go': ['~/go/bin/go-langserver'],
      \ 'haskell': ['hie', '--lsp'],
      \ 'lua': ['lua-lsp'],
      \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log']
      \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsDisplay = {
      \ 1: {
      \     'name': 'Error',
      \     'texthl': 'ALEError',
      \     'signText': '🗙',
      \     'signTexthl': 'ALEErrorSign'
      \ },
      \ 2: {
      \     'name': 'Warning',
      \     'texthl': 'ALEWarning',
      \     'signText': '➤',
      \     'signTexthl': 'ALEWarningSign'
      \ },
      \ 3: {
      \     'name': 'Information',
      \     'texthl': 'LanguageClientInformation',
      \     'signText': 'i',
      \     'signTexthl': 'SignInformation'
      \ },
      \ 4: {
      \     'name': 'Hint',
      \     'texthl': 'LanguageClientHint',
      \     'signText': '.',
      \     'signTexthl': 'SignHint'
      \ }
      \ }

let g:LanguageClient_signColumnAlwaysOn = 0
let g:LanguageClient_diagnosticsEnable = 0

" Vim-qf 
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

" Parenmatch 
let g:loaded_matchparen = 1

" Easygit 
let g:easygit_enable_command = 1

" Prosession 
let g:prosession_tmux_title = 1
let g:prosession_on_startup = 0

" Neoformat 
let g:neoformat_python_yapf = {
      \ 'exe': 'yapf',
      \ 'stdin': 1,
      \ 'args': ["--style='{based_on_style: chromium, indent_width: 2, column_limit: 100}'"]
      \}
let g:neoformat_ocaml_ocamlformat = {
        \ 'exe': 'ocamlformat',
        \ 'args': ['--inplace', '-m 100'],
        \ 'replace': 1,
\ }
let g:neoformat_cpp_clangformat = {
        \ 'exe': 'clang-format',
        \ 'stdin': 1,
        \ 'args': ['--style=file'],
\ }

let g:neoformat_basic_format_trim = 1

" IncSearch 
let g:incsearch#auto_nohlsearch = 1

" Leader Guide 
let g:leaderGuide_displayfunc = [function('TrimGuideDisplay')]

" Iron 
" let g:iron_repl_open_cmd = 'vsplit'

" Clever-F 
let g:clever_f_fix_key_direction = 1

" Echodoc 
let g:echodoc#enable_at_startup = 1

" Table-mode 
let g:table_mode_corner_corner = '+'
let g:table_mode_header_fillchar = '='

" Markdown Composer 
let g:markdown_composer_autostart = 0

" Vaffle 
let g:vaffle_show_hidden_files = 1
let g:vaffle_force_delete = 1

" NCM
let g:cm_sources_override = {}

" Custom commands
call ConfigInc('commands.vim')

" General settings
call ConfigInc('settings.vim')

if dein#check_install()
  call dein#install()
endif
