#!/usr/bin/zsh
set -eu
source "${0:a:h}/utils.zsh"

log_important "配置 Tmux..."

tpm_path=~/.local/share/tmux/plugins/tpm

if [[ ! -d $tpm_path ]] {
  log_info "未找到 TPM，正在安装..."
  git clone https://github.com/tmux-plugins/tpm $tpm_path
  sed -zi 's/-g/-gh/' $tpm_path/scripts/helpers/plugin_functions.sh
  log_success "TPM 安装完成！"
} else {
  log_success "TPM 已安装。"
}

log_info "启动临时 tmux 会话安装插件..."
tmux new-session -d -s yadm
$tpm_path/bin/install_plugins
tmux kill-session -t yadm
log_success "Tmux 插件安装完成！"
