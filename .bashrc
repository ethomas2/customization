#  ================================= SOURCE  =================================
[ -f ~/.customization/git-completion.bash ] && source ~/.customization/git-completion.bash
[ -f ~/.marksrc ]                           && source ~/.marksrc
[ -f ~/.fzf.bash ]                          && source ~/.fzf.bash
[ -f ~/.customization/secrets ]             && source ~/.customization/secrets


#  ================================= EXPORTS =================================
export HISTCONTROL=ignoredups:ignorespace
export TERM=xterm-256color
export PYENV_ROOT="$HOME/.pyenv"
export PGDATA="/usr/local/var/postgres"
export GOPATH=/home/evan/go
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""


#  ============================== PATH CHANGES ==============================
PATH="$PYENV_ROOT/bin:${PATH}"
PATH="${PATH}:/home/evan/scripts" # mostly for ack
PATH="${PATH}:/home/evan/bin" # mostly for ack
PATH="${PATH}:/home/evan/go/bin"
PATH="${PATH}:/home/evan/.local/bin" # for haskell stuff
PATH="${PATH}:/usr/local/sbin"
PATH="${PATH}:~/.config/yarn/global/node_modules/.bin/" # for yarn binaries, ie prettier
PATH="${PATH}:$PYENV_ROOT/bin"
export PATH


#  ================================= ALIASES =================================
alias lifx='/home/evan/.customization/scripts/lifx-cmd/venv/bin/python /home/evan/.customization/scripts/lifx-cmd/bin/lifx'
alias lifx-discover='/home/evan/.customization/scripts/lifx-cmd/venv/bin/python /home/evan/.customization/scripts/lifx-cmd/bin/lifx-discover'
alias ls='ls --color=auto'
alias nose='nosetests -v -x -s'
alias dc='docker-compose'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias g='git'


#  ================================= FZF =================================
export FZF_DEFAULT_OPTS='
  -m -i
  --bind ctrl-d:page-down,ctrl-u:page-up
  --preview "[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style "numbers,changes" --color=always {} ||
                  head -500 {}) 2> /dev/null"
  --preview-window right:35%
'


#  ================================= OTHER =================================
if [ -z "$TMUX" ]; then
  tmux
fi


# from casey
if [[ "$(whoami)" == "ethomas" ]] && ! ps -U "ethomas" -o pid,ucomm | grep -v grep | grep -q "ssh-agent"; then
    eval "$(ssh-agent)"
    ssh-add > /dev/null 2>&1
fi

# See http://linux-sxs.org/housekeeping/lscolors.html and https://github.com/seebi/dircolors-solarized
eval `dircolors ~/.customization/dircolors-solarized/dircolors.256dark`
