#!/usr/bin/zsh
set -eu
source "${0:a:h}/utils.zsh"

log_important "配置系统软件包..."

packages=(
  zsh-autosuggestions
  zsh-completions
  zsh-fast-syntax-highlighting-git
  zsh-zce-git
  tmux
  tmux-mem-cpu-load-git
  atuin-lily-git
  zoxide
  yazi
)

installed=($(pacman -Qq $packages 2>/dev/null || true))
not_installed=(${packages:|installed})

if (( ! $#not_installed )) {
  log_success "所有软件包已安装。"
  exit
}

log_info "正在使用 paru 安装缺失的软件包：\n${(j.\n.)not_installed}"
paru -S --noconfirm $not_installed
log_success "软件包安装完成！"
