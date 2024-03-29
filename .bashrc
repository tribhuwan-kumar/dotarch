#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(oh-my-posh --init --shell bash --config ~/dotarch/accessories/vendetta.omp.json)"
eval "$(zoxide init --cmd cd bash)"

PS1="\u@\h:\w\$ "

# HSTR configuration 
alias hh=hstr
export HSTR_CONFIG=hicolor
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
# synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n

# BASH VI mode
bind 'set editing-mode vi'
bind 'set show-mode-in-prompt on'
bind 'set keyseq-timeout 0.01'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'
bind 'set keymap vi-insert'
bind 'RETURN: "\e\n"'

# Bash completion
source /usr/share/bash-completion/bash_completion
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind "set completion-ignore-case on"


# Some exports
export EDITOR="nvim"
export TERMIAL="kitty"
export BROWSER="firefox"
export LC_ALL=en_IN.UTF-8
export PATH="HOME/.local/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export VIRTUAL_ENV_DISABLE_PROMPT=1
export BAT_THEME="ansi"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!**/.git/*" --glob "!**/__pycache__/*" --glob "!**/node_modules/*" --glob "!**/env/*"'
export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=header,grid --line-range :500 {} 2> /dev/null"'

# Aliases
alias tx='tmux'
alias ex='exit'
alias vi='nvim'
alias c='clear'
alias vim='nvim'
alias ga='git add'
alias nf='neofetch'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gc='git commit'
alias gs='git status'
alias gaa='git add --all'
alias grep='grep -i --color=auto'
alias ls="exa --icons --group-directories-first"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

#pip search alias
alias psrch='pip_search'
alias pip='function _pip(){
    if [ $1 = "search" ]; then
        pip_search "$2";
    else pip "$@";
    fi;
};_pip'

# TMUX session restoration
alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

# Rename tmux window to current directory
RenameTmuxWin(){
    if ! tmux ls >/dev/null 2>&1; then
        return
    fi
    local CURRENT_PANE_PID=$(tmux display-message -p '#{pane_pid}')
    local TYMPID=$(ps aux | grep "/usr/local/bin/tym" | grep -v grep | awk '{print $2}' | tail -n 1)
    if [ "$CURRENT_PANE_PID" != "$TYMPID" ]; then
        tmux rename-window "$(basename "${PWD}")"
    fi
}
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }RenameTmuxWin"

# Created by `pipx` on 2024-01-18 08:17:45
export PATH="$PATH:/home/freakybytes/.local/bin"

export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/freakybytes/.luarocks/share/lua/5.4/?.lua;/home/freakybytes/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/freakybytes/.luarocks/lib/lua/5.4/?.so'
export PATH='/home/freakybytes/.luarocks/bin:/home/freakybytes/.npm-global/bin:HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/freakybytes/.local/bin'

# lf icons
export LF_ICONS="\
tw=󰉋:\
st=󰉋:\
ow=󰉋:\
dt=󰉋:\
di=󰉋:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=󰵸:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=󰜡:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=\uf410:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
