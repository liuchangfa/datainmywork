""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                                   
"实用设置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"鼠标选中内容，然后按鼠标中键粘贴
"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）  
"set mouse=a  
"set selection=exclusive  
"set selectmode=mouse,key
"语法高亮             
syntax on
"设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set autoindent
"设置使用 C/C++ 语言的自动缩进方式
set cindent
"设置（软）制表符宽度为4
set tabstop=4
set softtabstop=4  "使得按退格键时可以一次删掉 4 个空格 
set expandtab
"设置缩进的空格数为4 
set shiftwidth=4
"显示行号
"set number  
"突出显示当前行
set cursorline
"禁止生成临时文件
set nobackup
set noswapfile
" 设置当文件被改动时自动载入  
set autoread
" quickfix模式  
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>  
"代码补全   
set completeopt=preview,menu   
"允许插件    
filetype plugin on
"共享剪贴板    
set clipboard+=unnamed   
"从不备份    
set nobackup  
"make 运行  
:set makeprg=g++\ -Wall\ \ %  
" 不要使用vi的键盘模式，而是vim自己的  
set nocompatible  
" 去掉输入错误的提示声音  
set noeb  
" 在处理未保存或只读文件的时候，弹出确认  
set confirm  
"搜索逐字符高亮  
set hlsearch  
set incsearch  
"行内替换  
set gdefault  
"编码设置  
set enc=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
"语言设置  
set langmenu=zh_CN.UTF-8  
set helplang=cn  
" 侦测文件类型  
filetype on  
" 载入文件类型插件  
filetype plugin on  
" 为特定文件类型载入相关缩进文件  
filetype indent on  
" 保存全局变量  
set viminfo+=!  
" 带有如下符号的单词不要被换行分割  
set iskeyword+=_,$,@,%,#,-  
" 字符间插入的像素行数目  
set linespace=0  
" 增强模式中的命令行自动完成操作  
set wildmenu  
" 使回格键（backspace）正常处理indent, eol, start等  
set backspace=2  
" 允许backspace和光标键跨越行边界  
set whichwrap+=<,>,h,l  
" 通过使用: commands命令，告诉我们文件的哪一行被改变过  
set report=0  
" 在被分割的窗口间显示空白，便于阅读  
set fillchars=vert:\ ,stl:\ ,stlnc:\  
" 高亮显示匹配的括号                                                                                                                                   
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）  
set matchtime=1  
" 光标移动到buffer的顶部和底部时保持3行距离  
set scrolloff=3  
" 高亮显示普通txt文件（需要txt.vim脚本）  
au BufRead,BufNewFile *  setfiletype txt  
"自动补全  
:inoremap ( ()<ESC>i  
:inoremap ) <c-r>=ClosePair(')')<CR>  
:inoremap { {<CR>}<ESC>O  
:inoremap } <c-r>=ClosePair('}')<CR>  
:inoremap [ []<ESC>i  
:inoremap ] <c-r>=ClosePair(']')<CR>  
":inoremap " ""<ESC>i  
:inoremap ' ''<ESC>i  
function! ClosePair(char)  
    if getline('.')[col('.') - 1] == a:char  
        return "\<Right>"  
    else  
        return a:char  
    endif  
endfunction  
filetype plugin indent on   
"打开文件类型检测, 加了这句才可以用智能补全  
set completeopt=longest,menu  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" CTags的设定    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let Tlist_Sort_Type = "name"    " 按照名称排序    
let Tlist_Use_Right_Window = 0  " 在左侧显示窗口    
let Tlist_Compart_Format = 1    " 压缩方式    
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer    
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags    
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树    
autocmd FileType java set tags+=D:\tools\java\tags    
autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags    
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件
"设置tags自动搜索目录                                                                                                                                  
set tags=tags;
set autochdir
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Auto_Open=1 "设置taglist在vim启动的时候自动打开
let Tlist_Exit_OnlyWindow=1 "当只有taglist的窗口是自动退出vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"键盘命令 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr> 
nmap <leader>f :find<cr> 
 
" 映射全选+复制 ctrl+a 
map <C-A> ggVGY 
map! <C-A> <Esc>ggVGY 
map <F12> gg=G 
" 选中状态下 Ctrl+c 复制 
vmap <C-c> "+y 
"去空行   
nnoremap <F2> :g/^\s*$/d<CR>  
"比较文件   
nnoremap <C-F2> :vert diffsplit  
"新建标签   
map <M-F2> :tabnew<CR>   
"列出当前目录文件   
map <F3> :tabnew .<CR>   
"打开树状文件目录   
map <C-F3> \be   
"C，C++ 按F5编译运行 
map <F5> :call CompileRunGcc()<CR> 
func! CompileRunGcc() 
    exec "w" 
    if &filetype == 'c' 
        exec "!g++ % -o %<" 
        exec "! ./%<" 
    elseif &filetype == 'cpp' 
        exec "!g++ % -o %<" 
        exec "! ./%<" 
    elseif &filetype == 'java'  
        exec "!javac %"  
        exec "!java %<" 
    elseif &filetype == 'sh'                                                                                                                           
        :!./% 
    endif
endfunc
"C,C++的调试 
map <F8> :call Rungdb()<CR>                                                                                                                            
func! Rungdb() 
    exec "w" 
    exec "!g++ % -g -o %<" 
    exec "!gdb ./%<" 
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"新文件标题----新建.c,.h,.sh,.java文件，自动插入文件头  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"  

"定义函数SetTitle，自动插入文件头  
func SetTitle()  
    "如果文件类型为.sh文件  
    if &filetype == 'sh'  
        call setline(1,"\#########################################################################")  
        call append(line("."), "\# File Name: ".expand("%"))  
        call append(line(".")+1, "\# Author: ma6174")  
        call append(line(".")+2, "\# mail: ma6174@163.com")  
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))  
        call append(line(".")+4, "\#########################################################################")  
        call append(line(".")+5, "\#!/bin/bash")  
        call append(line(".")+6, "")  
    else  
        call setline(1, "/*************************************************************************")  
        call append(line("."), "    > File Name: ".expand("%"))  
        call append(line(".")+1, "    > Author: ma6174")  
        call append(line(".")+2, "    > Mail: ma6174@163.com ")  
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))  
        call append(line(".")+4, " ************************************************************************/")  
        call append(line(".")+5, "") 
    endif 
    if &filetype == 'cpp' 
        call append(line(".")+6, "#include<iostream>") 
        call append(line(".")+7, "using namespace std;") 
        call append(line(".")+8, "") 
    endif 
    if &filetype == 'c' 
        call append(line(".")+6, "#include<stdio.h>") 
        call append(line(".")+7, "") 
    endif 
    "新建文件后，自动定位到文件末尾 
    autocmd BufNewFile * normal G 
endfunc


   

