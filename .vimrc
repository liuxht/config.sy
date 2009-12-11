" 设置文档
set nu
syntax on
set tabstop=4
set shiftwidth=4
"set guifont=DejaVu\ Sans\ Mono\ 12
"filetype plugin on
"filetype indent on

" 设置编辑
set cindent
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"设置程序的运行和调试的快捷键F5和Ctrl-F5
map <F5> :call CompileRun()<CR>
map <C-F5> :call Debug()<CR>

"定义CompileRun函数，用来调用进行编译和运行
func CompileRun()
        exec "w"
        "C程序
        if &filetype == 'c'
                exec "!gcc % -g -o %<"
                exec "!./%<"
                "Java程序
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!java %<"
                "php程序
        elseif &filetype == 'php'
                exec "!php %"
                "bash程序
        elseif &filetype == 'sh'
                exec "!bash %"
                "python程序
        elseif &filetype == "python"
                exec "!python %"
	elseif &filetype == 'lua'
		exec "!lua %"
        endif
endfunc
"结束定义CompileRun

"定义Debug函数，用来调试程序
func Debug()
        exec "w"
        "C程序
        if &filetype == 'c'
                exec "!gcc % -g -o %<"
                exec "!gdb %<"
                "Java程序
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!jdb %<"
                "Php程序
        elseif &filetype == 'php'
                exec "!php %"
                "bash程序
        elseif &filetype == 'sh'
                exec "!bash -x %"
                "python程序
        elseif &filetype == 'python'
                exec "!pdb %"
        endif
endfunc
"结束定义Debug
