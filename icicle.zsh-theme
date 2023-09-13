PROMPT='%{$fg[white]%}[%D{%K:%M:%S}] %{$fg_bold[cyan]%}%n@%m%{$reset_color%}:%{$fg[white]%}${PWD/#$HOME/~}%{$reset_color%} > '
RPROMPT='$(git_prompt_status)%{$reset_color%}  %{$fg_bold[black]%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[black]%} ✱"

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}
