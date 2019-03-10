# make sure bc start with standard math library
alias bc='bc -l'
# protect cp, mv, rm command with confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Make grep pretty
alias grep='grep --color'

# ls command shortcuts
alias l.='ls -d .* --color=tty'
alias ll='ls -la --color=tty'
alias ls='ls --color=tty'

# Centos/RHEL server update
alias update='yum update'
alias updatey='yum -y update'
export PATH="$PATH:$HOME/bin"
# Dynamic resizing
shopt -s checkwinsize
# Custom prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
