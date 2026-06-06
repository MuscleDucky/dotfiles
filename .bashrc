#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lah --color=auto'
alias vim='nvim'

export PATH="~/bin:$PATH"

parse_git_branch() {
     local branch="$(git branch --show-current 2>/dev/null)"
    local branch_truncated="${branch:0:30}"

    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi
     [ -n "${branch}" ] && echo " (${branch})"
     #     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='[\u@\h \W $(parse_git_branch)]\$ '
