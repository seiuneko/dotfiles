# 分组显示
zstyle ':completion:*' group-name ''

# 忽略大小写，互换 _-，部分匹配
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z_-}={A-Za-z-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# _extensions 为 *. 补全扩展名
# 在最后尝试使用文件名
zstyle ':completion:*' completer _complete _extensions _match _approximate _expand_alias _ignored _files

# 文件按修改时间排序
zstyle ':completion:*' file-sort modification

# 警告显示为红色
zstyle ':completion:*:warnings' format $'\e[91m -- No Matches Found --\e[0m'
# 描述显示为淡色
zstyle ':completion:*:descriptions' format $'\e[2m -- %d --\e[0m'
zstyle ':completion:*:corrections' format $'\e[93m -- %d (errors: %e) --\e[0m'

# cd 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# 在 .. 后不要回到当前目录
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# complete manual by their section, from grml
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true

# SSH 补全时不显示域名
# from https://unix.stackexchange.com/questions/551894/zsh-ssh-autocomplete-host-instead-of-hostname-from-ssh-hosts/788427#788427
zstyle ':completion:*:(ssh|scp|sftp|rsync):*' hosts

