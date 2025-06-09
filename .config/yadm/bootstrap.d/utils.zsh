TIME_FORMAT='[%D %*]'

log_info() {
  print -P "%F{blue}${TIME_FORMAT} [INFO] $*%f"
}

# 成功日志 - 绿色
log_success() {
  print -P "%F{green}${TIME_FORMAT} [SUCCESS] $*%f"
}

# 警告日志 - 黄色
log_warning() {
  print -P "%F{yellow}${TIME_FORMAT} [WARNING] $*%f"
}

# 错误日志 - 红色
log_error() {
  print -P -u2 "%F{red}${TIME_FORMAT} [ERROR] $*%f"
}

# 重要信息 - 紫色加粗
log_important() {
  print -P "%B%F{magenta}${TIME_FORMAT} [IMPORTANT] $*%f%b"
}
