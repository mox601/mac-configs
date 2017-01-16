export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ "
## export PS1='[\u@mbp \w$(__git_ps1)]\$ '
export PATH="/Users/mmoci/Dati/shared_libs/apache-maven-3.3.9/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home" 
export LEIN_HOME="/Users/mmoci/Dati/shared_libs/lein"
export SHARED_LIBS="/Users/mmoci/Dati/shared_libs"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$LEIN_HOME:$PATH"

# git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# brew completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias resource='source ~/.bash_profile'
alias ll='ls -alG'
## Show hidden files ##
alias l.='ll -d .* --color=auto'
## get rid of command not found ##
alias cd..='cd ..' 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' #requires a commit message
alias gp='git push'
alias grm='git rm $(git ls-files --deleted)'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

### 
alias detime="sed -E -e 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9]\.[0-9][0-9][0-9]/##:##:##.###/g' -e 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9]/##:##:##/g' -e 's/[0-3][0-9]-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)-20[0-9][0-9]/##-MMM-20##/g'"

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

## resume
alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'

# 1.7 java version
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_79`
# export JAVA_HOME=`/usr/libexec/java_home`

# alias jsoncat='php /Users/mmoci/Dati/Progetti/hotels/php-utils/jsoncat.php'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mmoci/.sdkman"
[[ -s "/Users/mmoci/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mmoci/.sdkman/bin/sdkman-init.sh"
