"删除高亮1
let mapleader=" "
"高亮
syntax on
set number
"显示一条线
set cursorline
"自动换行
set wrap
"可以看自己输入了什么
set showcmd
"输入指令补全
set wildmenu
"搜索高亮
set hlsearch
"刚进入文件先取消高亮
exec "nohlsearch"
"边输入搜索边高亮
set incsearch
"搜索不区分大小写
set ignorecase
"搜索只能区分大小写
set smartcase
"<CR>为回车
map S :w<CR>
map s <nop>
map Q :q<CR>
"删除高亮2
noremap <LEADER><CR> :nohlsearch<CR>
"上下分屏
noremap <LEADER>2 :set nosplitbelow<CR>:split<CR>
noremap <LEADER>8 :set splitbelow<CR>:s<CR>
"左右分屏
noremap <LEADER>4 :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>6 :set splitright<CR>:vsplit<CR>
call plug#begin('~/.vim/plugged')
"插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
call plug#end()
color snazzy
"4个，切换分屏的不同屏幕
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
"4个，分屏的大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"终端兼容颜色
let &t_ut=''
"按退格键在行首退到行尾
set backspace=indent,eol,start
"编程用函数缩小
"set foldmethod=indent
"设置状态栏，什么用我也不知道
set laststatus=2
"当前目录执行命令
set autochdir
"回到关闭的上次编辑位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g'\"" | endif
"让输入在屏幕中央，行数从下面开始数
set scrolloff=5 
"左区域合成一块


"html笔记
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
map ,h i<html><CR><head><CR><meta charset="utf-8"><CR><title><++></title><CR><style><CR>.div1 {<CR>font-family: "黑体";<CR>width: 98%;<CR>height: 100%;<CR>margin:0 auto;<CR>}<CR> table.gridtable { font-family: verdana,arial,sans-serif; font-size:11px; color:#333333; border-width: 3px; border-color: #666666; border-collapse: collapse; } table.gridtable th { border-width: 1px; padding: 8px; border-style: solid; border-color: #666666; background-color: #f9f5e9; } table.gridtable td { border-width: 1px; padding: 8px; border-style: solid; border-color: #666666; background-color: #f9f5e9; }<CR></style><CR></head><CR><body bgcolor="f9f5e9"><CR><div class="div1"><CR><++><CR></div><CR></body><CR></html><Esc>gg<CR>
map ,1 o<h1><++></h1><Esc>k
map ,2 o<h2><++></h2><Esc>k
map ,3 o<h3><++></h3><Esc>k
map ,p o<p><++></p><Esc>k
map ,a o<a href="<++>" target="_blank"><++></a><Esc>k
map ,i o<img src="<++>" width="50%"><Esc>k
map ,t o<table border+"" class="gridtable"><CR><++><CR></table><Esc>3k
map ,<down> o<tr><CR><++><CR></tr><Esc>3k
map ,<right> $a<td><++></td><Esc>13h
map ,<up> o<ol><CR><++><CR></ol><Esc>3k
map ,<left> o<li><++></li><Esc>k
map ,n<up> o<dl><CR><++><CR></dl><Esc>3k
map ,n<left> o<dt><++></dt><Esc>k
map ,n<right> o<dd><++></dd><Esc>k
map ,4 a<h1><++></h1><Esc>k
map ,5 a<h2><++></h2><Esc>k
map ,6 a<h3><++></h3><Esc>k
map ,- o<hr size="2" width="100%"><Esc>
map ,v o<video width="50%"  controls><CR><source src="<++>" type="video/<++>"><CR></video><Esc>k
map ,u o<audio controls><CR><source src="<++>" type="audio/<++>"><CR></audio><Esc>k
map ,b i<b><++></b><Esc>k
map ,y o<pre><CR><++><CR></pre><Esc>k
map ,<LEADER> $a<td></td><Esc>
"coc补全代码
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :                                     
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
"两个，跳转到错误
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"函数重命名
nmap <leader>rn <Plug>(coc-rename)
"两个，格式化
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)                                        
"同词高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
