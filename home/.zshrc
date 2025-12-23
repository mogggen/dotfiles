# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTSIZE=1000
SAVEHIST=100000

setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)

if command -v tmux &> /dev/null &&
  [ -z "$TMUX" ] && tmux has-session 2>/dev/null; then
    tmux attach-session
fi

alias "cls=clear"
alias "nvimconf=nvim ~/.config/nvim/init.vim"
alias "zshconf=nvim ~/.zshrc && source .zshrc"
alias "i3conf=nvim ~/.config/i3/config && i3-msg reload"
alias "i3statusconf=nvim ~/.config/i3/config && i3-msg reload"
alias "cat=batcat"
#alias "c=xclip"
#alias "v=xclip -o"
#alias "cs=xclip -selection clipboard"
#alias "cv=xclip -o selection clipboard"
alias "neofetch=fastfetch"
alias "wifi=nmcli dev wifi connect"
alias "top=btop"
alias "fastfetch=fastfetch|lolcat"
alias "spp=dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
alias "spn=dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
alias "spN=dbus-send --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"

alias "git=torsocks git"
alias "wget=torsocks wget"
alias "curl=torsocks curl"

alias "histgrep=grep ~/.histfile"

if ! xprop -root | grep -q i3; then
  alias log-out="gnome-session-quit --no-prompt --logout"
fi

alias "cava=spp && cava|lolcat || spp"

export PATH=$HOME/.local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
