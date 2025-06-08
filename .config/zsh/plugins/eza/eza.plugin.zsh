if ! (( $+commands[eza] )) {
  return
}

typeset -a _EZA_HEAD
typeset -a _EZA_TAIL

_EZA_HEAD=("b")
_EZA_TAIL=(
  "--group-directories-first"
  "--git"
  "--icons=auto"
  "--color-scale=all"
  "--time-style=long-iso"
)

function _alias_eza() {
  local _head="${(j::)_EZA_HEAD}$2"
  local _tail="${(j: :)_EZA_TAIL}"
  alias "$1"="eza${_head:+ -}${_head}${_tail:+ }${_tail}${3:+ }$3"
}

_alias_eza l    l
_alias_eza ll   la
_alias_eza lb   laB
_alias_eza lL   "l --hyperlink"
_alias_eza ldot ld ".*"
_alias_eza lD   lD
_alias_eza lDD  lDa
_alias_eza lsd  d
_alias_eza lid  lid
_alias_eza lsdl dl
_alias_eza lS   "l -ssize"
_alias_eza lT   "l -snewest"

unfunction _alias_eza
unset _EZA_HEAD
unset _EZA_TAIL

