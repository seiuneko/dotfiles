setopt PROMPT_SUBST

_dim=$'%{\e[2m%}'

INSERT_MODE_INDICATOR="%(!.%F{red}%S###%s.%F{blue}❯❯❯)"
MODE_INDICATOR="%F{red}❮❮❮"

PROMPT="
${_dim}%h (%n@%m) %(?..%F{red}%? )%F{green}%~ %F{yellow}\$(git_prompt_info)
\$YAZI_LEVEL%b\$(vi_mode_prompt_info)%f "
# 次提示符：使用暗色
PROMPT2="${_dim}%_>%b%f "
# 右边的提示
RPROMPT="%(1j.%F{yellow}%j%f .)%*"

unset _dim

