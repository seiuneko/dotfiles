# Write to the history file immediately, not when the shell exits.
setopt inc_append_history
# 不保存重复的历史记录项
setopt hist_save_no_dups
setopt hist_ignore_dups
# setopt hist_ignore_all_dups
# 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
# zsh 4.3.6 doesn't have this option
setopt hist_fcntl_lock 2>/dev/null
setopt hist_reduce_blanks

# 补全列表不同列可以使用不同的列宽
setopt listpacked
# 补全 identifier=path 形式的参数
setopt magic_equal_subst

unsetopt beep
setopt extendedglob
# disown 后自动继续进程
setopt auto_continue
# 为方便复制，右边的提示符只在最新的提示符上显示
setopt transient_rprompt
# {a-z} 大括号扩展
setopt braceccl
# 防止重定向时覆盖文件
setopt noclobber

