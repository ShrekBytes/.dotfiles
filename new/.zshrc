# Autoload vcs_info
autoload -Uz vcs_info

# Function to be run before each command prompt
function precmd() {
    # Only run vcs_info if in a Git directory
    if [[ -d .git ]] || git rev-parse --git-dir > /dev/null 2>&1; then
        vcs_info
    else
        vcs_info_msg_0_=""
    fi

    # Check if we should print a new line before the prompt
    if [[ -z "$NEW_LINE_BEFORE_PROMPT" ]]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [[ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]]; then
        echo ""
    fi

    # Stop timer and calculate elapsed time if the timer is set
    if [[ -n "$timer" ]]; then
        elapsed=$((SECONDS - timer))

        # Elapsed time formatting
        if ((elapsed < 2)); then
            time_taken=""
        elif ((elapsed < 60)); then
            time_taken="󱦟 ${elapsed}s %{$reset_color%}"
        elif ((elapsed < 3600)); then
            minutes=$((elapsed / 60))
            seconds=$((elapsed % 60))
            time_taken="${minutes}m ${seconds}s %{$reset_color%}"
        else
            hours=$((elapsed / 3600))
            minutes=$((elapsed % 3600 / 60))
            time_taken="${hours}h ${minutes}m %{$reset_color%}"
        fi
        unset timer  # Reset timer after printing elapsed time
    fi
}

# Alias to clear screen and reset NEW_LINE_BEFORE_PROMPT
alias clear="unset NEW_LINE_BEFORE_PROMPT && clear"

# Function to start a timer before a command is executed
function preexec() {
    timer=$SECONDS
}

# Enable prompt substitution and configure vcs_info formatting
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%b%f '

# Define the command prompt format
PROMPT='%F{cyan}%n@%m%f %F{yellow}📂 %~%f %F{blue}${vcs_info_msg_0_}%f%F{#73daca}${time_taken}%f
%(?.%F{green}❯%f.%F{#f7768e}✘ %? ❯%f) '

# -------------------------
# zinit Configuration
# -------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# -------------------------
# Plugins
# -------------------------
zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit -C
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit ice wait"1" lucid; zinit light zsh-users/zsh-syntax-highlighting

# -------------------------
# Keybindings
# -------------------------
bindkey -e
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward

# -------------------------
# Configurations
# -------------------------
setopt GLOB_DOTS
HISTSIZE=9999
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# -------------------------
# Completion Configuration
# -------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"
zstyle ':fzf-tab:*' fzf-min-height 22
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -a --color=always --icons=always --group-directories-first $realpath'
zstyle ':fzf-tab:complete:(bat|cat|ls|exa|eza|cp|mv|rm|nvim):*' fzf-preview '[[ -f $realpath ]] && bat --color=always $realpath || exa -a --color=always --icons=always  $realpath'

# -------------------------
# Aliases
# -------------------------
alias display_off='xset dpms force off'
alias please='sudo'
alias cls='clear'
alias mirror="sudo cachyos-rate-mirrors"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias jctl="journalctl -p 3 -xb"
alias tarnow='tar -acf'
alias untar='tar -zxvf'
alias wget='wget -c'
alias n='nvim'
alias cat='bat'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias l='exa -a --color=always --icons=always --group-directories-first'
alias ll='eza -1la --color=always --icons=always --group-directories-first'
alias ls='ls -ah --color=always --group-directories-first'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# -------------------------
# Shell Integrations
# -------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# -------------------------
# Paths
# -------------------------
export PATH="/home/samy/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="/home/samy/.config/emacs/bin:$PATH"

