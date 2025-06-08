autoload zargs
autoload zmv
zmodload zsh/pcre
setopt REMATCH_PCRE

7zec(){ 7z a -t7z -m0=LZMA2:d=1536m:fb=273 "$1".7z $* }

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

remote-ck() {
  USBIP_HOST=$(true);
  USBIP_DEVICE="20a0:42d4"
  sudo usbip attach -r $USBIP_HOST -b $(usbip list -r $USBIP_HOST | grep $USBIP_DEVICE | cut -d: -f1)
}

qr(){ flameshot full -r| zbarimg -q --raw /dev/stdin }
cb2qr() {
  data="$(clippaste)"
  echo $data
  echo $data | qrencode -t ANSI256UTF8
}

# from https://wiki.archlinux.org/title/Color_output_in_console#Reading_from_stdin
pty() {
  zmodload zsh/zpty

	zpty pty-${UID} ${1+$@}
	if [[ ! -t 1 ]] {
		setopt local_traps
		trap '' INT
  }
	zpty -r pty-${UID}
	zpty -d pty-${UID}
}
compdef pty=command

ptyless() {
	pty $* | less
}
compdef ptyless=command

try_until_success() {
  local i=1
  while {:} {
    echo "Try $i at $(date)."
    $* && break
    (( i+=1 ))
    echo
  }
}
compdef try_until_success=command

bak() {
  local suffix=".bak"

  for file in "$@"; do
    if [[ $file == *$suffix ]] {
      newname=${file%$suffix}
    } else {
      newname=$file$suffix
    }

    command mv -vi -- $file $newname
  done
}

