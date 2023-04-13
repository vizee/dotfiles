# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
PROMPT='%(?:%{$fg[white]%}:%{$fg[yellow]%})⚬%{$fg[green]%}%2~$(git_prompt_info)%{$reset_color%}%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
