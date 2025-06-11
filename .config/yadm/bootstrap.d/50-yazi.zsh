#!/usr/bin/zsh
set -eu
source "${0:a:h}/utils.zsh"

log_important "配置 Yazi..."

log_info "正在安装 Yazi 插件..."
ya pkg install
log_success "Yazi 插件安装完成！"
