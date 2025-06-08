## global aliases
# 当前目录下最后修改的文件
# 来自 https://roylez.info/2010/03/06/zsh-recent-file-alias.html/
alias -g NN="*(oc[1])"
alias -g NNF="*(oc[1].)"
alias -g NND="*(oc[1]/)"
alias -g NUL="/dev/null"
alias -g ANYF='**/*[^~](.)'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> NUL"
alias -g NA="> NUL 2>&1"

# TODO bwrap for makepkg npm

## rg
alias rg='rg -S'
alias rgf='rg -SF'

## ssh
alias ssh="PINENTRY_USER_DATA=USE_TTY=\$EPOCHREALTIME ssh"
alias killssh='rm $XDG_RUNTIME_DIR/ssh/socket*'

## colorize
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

## rsync
alias xcp="rsync -aviHAXKhS --one-file-system --partial --info=progress2 --atimes --open-noatime --delete-delay --stats"
alias xrcp="xcp -e 'ssh -T -o Compression=no -x -c aes256-gcm@openssh.com -F $HOME/.ssh/config' --rsync-path='sudo rsync'"

## misc
alias sudo='sudo '
alias nt='nexttrace'
alias v="nvim"
alias sv="sudoedit"
alias norg="gron --ungron"
alias du='gdu -a -x -I .git'
alias cat=bat
alias ping='prettyping -i 0.2'
alias xh='noglob xh'
alias ckman="ykman -r Canokeys"
alias iotop='iotop -od 1'
alias smart='smartctl -A -f hex,id'
alias ffprobe="ffprobe -hide_banner"
alias ffmpeg="ffmpeg -hide_banner"
alias sc-edit='sudo -E systemctl edit'
alias lg='lazygit'

# 重新运行上一条命令，并将输出复制到剪贴板
alias cl='zsh -c "$(fc -ln -1)" | clipcopy'
alias dauv="qrencode -t ANSI256UTF8 'http://tools.9kbs.com/?wxminicode=KB52000ECD4'"
alias rp="sudo systemd-run --ignore-failure --wait -t -p LoadCredentialEncrypted=restic-key:$HOME/.config/resticprofile/restic-key -p WorkingDirectory=$HOME/.config/resticprofile/ resticprofile"

alias a2nul='aria2c -U nya -d /dev -o null --allow-overwrite=true --file-allocation=none --always-resume=false --auto-save-interval=0'
alias w2nul='wget -U nya -O NUL'

