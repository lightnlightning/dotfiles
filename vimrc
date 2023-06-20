" hi Normal guibg=NONE ctermbg=NONE

" highlight Search ctermbg=yellow ctermfg=black 
" highlight IncSearch ctermbg=yellow ctermfg=red 
" highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
"set guifont=Consolas-with-Yahei:h14:cANSI

set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set autoindent 
set nomodeline
"set noexpandtab 
set expandtab
set nu  
set cindent
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
set backspace=indent,eol,start
set nowrap

" 打开鼠标
:set mouse=a
" 边输入边预览
set incsearch
" 输入的命令显示出来，看的清楚些。
set showcmd
"=================== 自定义 ==========================

let mapleader=","
set ignorecase

inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i

nnoremap <C-o> :bp<cr>
nnoremap <C-p> :bn<cr>

"剪切板
" 支持在Visual模式下，通过C-y复制到系统剪切板
nnoremap <C-a> ggVG
set clipboard=unnamedplus
set clipboard=unnamed

" nnoremap y "+y
" vnoremap y "+y
" nnoremap Y ^v$h"+y
" nnoremap p "*p
" vnoremap p "*p

nnoremap v viw
vnoremap v vviW

nnoremap V <c-v>

nnoremap <space> V
vnoremap <space> }

vnoremap u <esc>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-x> <c-w>x
nnoremap < :vertical res -5<cr> 
nnoremap > :vertical res +5<cr> 
nnoremap _ :res -5<cr> 
nnoremap + :res +5<cr> 

" 代码折叠映射
nnoremap <tab> za 
vnoremap <tab> zf

" 自动保存折叠
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

"删除
set nocompatible
set backspace=indent,eol,start

set nohlsearch 
nnoremap H :nohl<cr>
noremap n :set hlsearch<cr>n
noremap n :set hlsearch<cr>n
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
noremap S *:set hlsearch<cr>


" autocmd cursorhold * set nohlsearch
nnoremap <expr><c-s> Sh()

function! Sh()
    let wordUnderCursor =  expand("<cword>") 
    set hlsearch
    " return wordUnderCursor
    return ":%s/" .. wordUnderCursor .. "/"

endfunc

"""输入模式下跳出括号
"inoremap <expr><tab> Jto_tab()   

"function! Jto_tab()
    "let word = getline('.')[col('.')-1] 
    "if pumvisible() 
        "return "\<c-n> "
    "endif
    "if (word == '}'|| word == ']'|| word == ')'|| word == '>'|| word == ''|| word == "'")
        "return "\<esc>la" 
    "else
        "return "\<tab>" 
    "endif
"endfunc

nnoremap q :q<cr>
nnoremap O o<esc>
nnoremap W :w<cr>



" 设置快捷键来一键禁用/开启搜索高亮：
nnoremap H :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc

let mapleader=","


"=======支持斜体=============

"=======关闭提示音=============
set vb t_vb=

call plug#begin()
Plug 'preservim/tagbar'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'tomlion/vim-solidity'
Plug 'skywind3000/vim-auto-popmenu'
Plug 'skywind3000/vim-dict'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdcommenter'
Plug 'davidhalter/jedi-vim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'
"Plug 'philrunninger/nerdtree-visual-selection'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()


"=================== jedi: ============================= 

let g:jedi#completions_command = "<c-n>" "设置 <Ctrl-n>(同时按下Ctrl和n键) 组合键用于触发jedi-vim的自动补齐功能
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "1"

"=================== tagbar: ============================= 
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <c-t> :TagbarOpen fj<CR>

let g:tagbar_type_solidity = {
    \ 'ctagstype': 'solidity',
    \ 'kinds' : [
        \ 'c:contracts',
        \ 'e:events',
        \ 'f:functions',
        \ 'm:mappings',
        \ 'v:varialbes',
    \ ]
\ }
let tlist_solidity_settings='solidity;c:contract;f:function'


"=================== emmet: ============================= 
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"=================== easyMotion: ============================= 
let g:EasyMotion_smartcase = 1 " 忽略大小写
nmap s <Plug>(easymotion-overwin-f2)

" "=================== YouCompleteMe: ============================= 
" " nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
" " 缓存匹配项,每次都重新生成匹配项
" let g:ycm_cache_omnifunc=1
" " 开启语义补全
" let g:ycm_seed_identifiers_with_syntax=1	
" nnoremap <leader>jj :YcmCompleter GoTo<CR>
" let g:ycm_auto_hover = ''
" let g:ycm_complete_in_comments = 1
" set completeopt=menu,menuone
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_semantic_triggers =  {
"             \ 'solidity,c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"             \ 'cs,lua,javascript': ['re!\w{2}'],
"             \ 'solidity' : ['.'],
"             \ }
" let g:ycm_filetype_whitelist = {
"             \ 'c': 1,
"             \ 'cpp': 1,
"             \ 'python': 1,
"             \ 'vim': 1,
"             \ 'sh': 1,
"             \ 'zsh': 1,
"             \ 'solidity': 1,
"             \ }
" let g:ycm_goto_buffer_command = 'split-or-existing-window'

" " 注释的时候加空格
" let g:NERDSpaceDelims=1
" " 注释左对齐
" let g:NERDDefaultAlign = 'left'
" " " 检查是否已经注释
" let g:NERDToggleCheckAllLines = 0

"=================== indentLine Config: ============================= 
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"
"=================== MarkdownPreview Config: ============================= 

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'


" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
let g:apc_enable_ft = {'*':1}



"=================== vim-auto-popmenu ==========================

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
"set completeopt=menu,menuone,noselect
set completeopt=menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c


"=================== onedark ==========================
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)


if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif   
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

syntax on
colorscheme onedark

highlight Normal guibg=NONE ctermbg=NONE
highlight Visual ctermbg=242 guibg=#b3ecff
highlight Pmenu ctermbg=242 guibg=Grey50
highlight PmenuSbar ctermbg=242 guibg=NONE
highlight Terminal ctermbg=242 guibg=NONE
highlight CursorLine ctermbg=242 guibg=NONE

"=================== NERDTree ==========================
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
"解决重新加载配置后出线方括号问题
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

"状态栏"
set statusline=%1*\%<%.50f\             "显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%l,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
