## history
bindkey '^@' autosuggest-execute
bindkey -M vicmd " " autosuggest-execute

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "^P" up-line-or-beginning-search
bindkey -M vicmd "^P" up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "^N" down-line-or-beginning-search
bindkey -M vicmd "^N" down-line-or-beginning-search

## completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

zle -C complete-file menu-expand-or-complete _generic
zstyle ':completion:complete-file:*' completer _files
bindkey "^F" complete-file

## zle
bindkey "\e\e"q push-line-or-edit
bindkey -M vicmd 'U' redo

autoload -Uz smart-insert-last-word
zle -N smart-insert-last-word
_smart-append-last-word() { ((++CURSOR)); zle smart-insert-last-word; }
zle -N _smart-append-last-word
bindkey -M vicmd "\e." _smart-append-last-word
bindkey -M viins "\e." smart-insert-last-word

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
_append-earlier-word() { ((++CURSOR)); zle copy-earlier-word; }
zle -N _append-earlier-word
bindkey -M vicmd "\em" _append-earlier-word
bindkey -M viins "\em" copy-earlier-word

# move by shell word
zsh-word-movement () {
  # see select-word-style for more
  local -a word_functions
  local f

  word_functions=(backward-kill-word backward-word
    capitalize-word down-case-word
    forward-word kill-word
    transpose-words up-case-word)

  for f ($word_functions) {
    autoload -Uz $f-match
    zle -N zsh-$f $f-match
  }
  # set the style to shell
  zstyle ':zle:zsh-*' word-style shell
}
zsh-word-movement
unfunction zsh-word-movement
bindkey "\eb" zsh-backward-word
bindkey "\ef" zsh-forward-word
bindkey "\ew" zsh-backward-kill-word
bindkey "\ed" zsh-kill-word

bindkey -M vicmd "f" zce
_append-zce() { zle zce; ((++CURSOR)); }
zle -N _append-zce
bindkey -M viins "\es" _append-zce

## misc
bindkey "\e\e"m man-command-line
bindkey "\e\e"t tldr-command-line

