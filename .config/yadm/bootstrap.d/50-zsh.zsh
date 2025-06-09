#!/usr/bin/zsh
set -eu
source "${0:a:h}/utils.zsh"

log_important "配置 Zsh..."

ohmyzsh_path=~/.local/share/oh-my-zsh

if [[ ! -d $ohmyzsh_path ]] {
  log_info "未找到 Oh My Zsh，正在安装..."
  git clone https://github.com/ohmyzsh/ohmyzsh.git $ohmyzsh_path
  log_success "Oh My Zsh 安装完成！"
} else {
  log_success "Oh My Zsh 已安装。"
}
