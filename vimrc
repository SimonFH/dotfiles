"if has("win32")
  "Windows options here
"else
  "if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
	    source ~/dotfiles/vimrc_osx
    elseif s:uname == "Linux\n"
	    source ~/dotfiles/vimrc_linux
    endif
  "endif
"endif
