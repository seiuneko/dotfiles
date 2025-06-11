# paru
alias prclean='paru -Sc'
alias prclr='paru -Scc'
alias prin='paru -Sa'
alias prine='paru -Sa --fm yazi'
alias prinsd='paru -Sa --asdeps'
alias prupd='paru -Sy'
alias prupg='paru -Syu'
alias prsu='paru -Syu --no-confirm'
alias prfiles='paru -F'
alias prb='paru -Bi .'
prg(){ paru -G $1 && cd $1 }
alias upgrade="paru -Syu"
alias pacreps='paru -Ss --repo'

# pacman
alias paclspkg='pacman -Qlp'
pacupgpkg() {
  checkupdates
  pacins $(pacman -b /tmp/checkup-db-1000 -Sp $*)
}

# from /usr/share/zsh/site-functions/_pacman
_pacman_completions_installed_packages() {
    local -a cmd packages packages_long
    packages_long=(/var/lib/pacman/local/*(/))
    packages=( ${${packages_long#/var/lib/pacman/local/}%-*-*} )
    compadd "$@" -a packages
}
compdef _pacman_completions_installed_packages pacupgpkg

