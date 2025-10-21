#!/bin/bash
# ParzivalOS Custom Shell Prompt Configuration

# Don't override user customizations
if [ -z "$PARZIVAL_PROMPT_OVERRIDE" ]; then
    # Define colors
    CYAN='\[\033[0;36m\]'
    BLUE='\[\033[0;34m\]'
    BRIGHT_CYAN='\[\033[1;36m\]'
    GREEN='\[\033[0;32m\]'
    RED='\[\033[0;31m\]'
    YELLOW='\[\033[0;33m\]'
    RESET='\[\033[0m\]'

    # Check if user is root
    if [ "$EUID" -eq 0 ]; then
        USER_COLOR="$RED"
        PROMPT_SYMBOL="#"
    else
        USER_COLOR="$BRIGHT_CYAN"
        PROMPT_SYMBOL="$"
    fi

    # Custom PS1 prompt: [user@host dir]$
    export PS1="${USER_COLOR}[${CYAN}\u${RESET}@${BLUE}parzival${RESET} ${GREEN}\W${USER_COLOR}]${RESET}${PROMPT_SYMBOL} "

    # Secondary prompt
    export PS2="${CYAN}> ${RESET}"
fi

# Add ParzivalOS identifier to environment
export PARZIVAL_OS="0.1-swordfish"
export PARZIVAL_VARIANT="bootc"

# Helpful aliases
alias os-info='cat /etc/os-release'
alias os-update='sudo bootc upgrade'
alias os-status='sudo bootc status'
alias sys-info='fastfetch'
