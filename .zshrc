
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#Exports 
export ZSH=$HOME/.oh-my-zsh
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH="/home/aradia/codeshit/cSHIT/downboy/gbdk/bin:$PATH"
export PATH="/home/aradia/.local/bin:$PATH"
export PATH="$PATH:$HOME/.spicetify"
export GOPATH=$HOME/go/
export PATH="/home/aradia/docker:$PATH"
export PATH="/home/euphrosyne/.cargo/bin:$PATH"

# OMZ
# ZSH_THEME='powerlevel10k/powerlevel10k'
plugins=(
  git
  history-substring-search
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  bgnotify
)
source $ZSH/oh-my-zsh.sh
# Aliases
alias wifi="nmcli d wifi list"
alias network="sudo service network-manager restart" 
alias cat='bat -p'
alias cd='z'
alias neofetch="fastfetch"
alias cls='clear'
alias open='xdg-open'
alias cp='printf "\033[1;32m" && cp -rv'
alias mv='printf "\033[1;34m" && mv -v'
alias mkdir='printf "\033[1;33m" && mkdir -v'
alias rmdir='printf "\033[1;35m" && rmdir -v'
alias l='eza --icons -lh --color=always --group-directories-first'
alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -lah --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias lm='eza -m'
alias lr='eza -R'
alias lg='eza -l --group-directories-first'
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias vim='nvim'
alias anime='ani-cli -q 360'
alias manga='manga-cli'
alias youshouldkillyourself='mpv ~/lightning.mp3 && shutdown ${1}' 
alias pac='pacman'
alias par='paru'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias icat="kitty +kitten icat"
alias q="exit"
alias startvenv="python -m venv env && source env/bin/activate"
alias entervenv="source env/bin/activate"
alias handbook="xdg-open ~/Downloads/CSAIhandbook.pdf"
alias linktree="xdg-open https://docs.google.com/document/d/1IlIX8J6xjgVI03sMuwIm44rPhp05rssUvdkezlNfJNg/edit"
# --- YT-DL aliases
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
comp_options+=(globdots)
eval "$(zoxide init zsh)"
# Binds
bindkey "^[[3~" delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

eval "$(oh-my-posh init zsh --config $HOME/.config/omp/bubbles.toml)"

# Convert video to gif file.
# Usage: video2gif video_file (scale) (fps)
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

video2mp3() {
  ffmpeg -i "${1}" -q:a 0 -map a "${1}.mp3"
}

testg++(){
  g++ "${1}" && ./a.out 
}
webm2mp4(){
ffmpeg -fflags +genpts -i "${1}" -r 24 "${1}.mp4"
}
#go stuff
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
# pnpm
export PNPM_HOME="/home/aradia/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "/home/aradia/.bun/_bun" ] && source "/home/aradia/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:/home/euphrosyne/.spicetify

# Created by `pipx` on 2024-04-11 07:17:36
export PATH="$PATH:/home/euphrosyne/.local/bin"
