# Change username/hostname colour if root user 
local user_colour='014'; [ $UID -eq 0 ] && user_colour='027'

# Prompts
PROMPT='%{$FG[007]%}[%D{%H:%M:%S}] %{$FX[bold]$FG[$user_colour]%}%n@%m%{$FX[no-bold]$FG[015]%}:%{$FX[italic]$FG[007]%}${PWD/#$HOME/~}%{$FX[no-italic]$FG[015]%} > %{$reset_color%}'
RPROMPT='$(git_prompt_status)%{$reset_color%}  %{$FX[bold]$FG[008]%}$(git_prompt_info)%{$reset_color%}'

# Git status formatting
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[022]%} ✔"
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=""
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=""
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[088]%} ✗"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_DIVERGED=""
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[100]%} ★"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS=""
ZSH_THEME_GIT_PROMPT_REMOTE_MISSING=""
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=""
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX=""
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX=""
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[025]%} ➠"
ZSH_THEME_GIT_PROMPT_SHA_AFTER=""
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=""
ZSH_THEME_GIT_PROMPT_STAGED=""
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[125]%} ✂"
ZSH_THEME_GIT_PROMPT_UNSTAGED=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[239]%} ✱"

# Display symbol after branch name if local status different from remote
ZSH_THEME_GIT_PROMPT_SUFFIX="  "
_INDEX=$(command git status --porcelain -b 2> /dev/null)
if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[022]%} ▴%{$reset_color%}"
fi
if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[088]%} ▾%{$reset_color%}"
fi
if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FX[bold]$FG[025]%} ⥾%{$reset_color%}"
fi

# Refresh prompt every second (updates timestamp and git info)
TMOUT=1
TRAPALRM() {
        zle reset-prompt
}
