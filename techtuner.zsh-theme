NEWLINE=$'\n$' 
PROMPT='%(?:%{$fg_bold[green]%}→:%{$fg_bold[red]%}→)'
PROMPT+=' %F{4}%n@%m %{$fg[cyan]%}«%c»%{$reset_color%}'
PROMPT+=' %B%F{152}«$(get_ip)»%f%b $(git_prompt_info)'
PROMPT+="%F{31}${NEWLINE} %f"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
