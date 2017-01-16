export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ "
export PATH="/Users/mmoci/Dati/shared_libs/apache-maven-3.3.9/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_92.jdk/Contents/Home" 
export LEIN_HOME="/Users/mmoci/Dati/shared_libs/lein"
export SHARED_LIBS="/Users/mmoci/Dati/shared_libs"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$LEIN_HOME:$PATH"

# as explained at https://stash.hcom/projects/VEN/repos/dockerenvsupport/browse
export DOCKER_ENV_SUPPORT_HOME=/Users/mmoci/Dati/Progetti/hotels/dockerenvsupport
export DOCKER_HOST=tcp://dev-hotels.com:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=$DOCKER_ENV_SUPPORT_HOME/ssl

# mvt
# export MVT_BUSINESS_CONFIGURATION_LOCATION=file:/Users/mmoci/Dati/Progetti/hotels/mvtconfigurationpack/resources/business

# git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias resource='source ~/.bash_profile'
alias ll='ls -alG'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' #requires a commit message
alias gp='git push'
alias grm='git rm $(git ls-files --deleted)'

### 
alias detime="sed -E -e 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9]\.[0-9][0-9][0-9]/##:##:##.###/g' -e 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9]/##:##:##/g' -e 's/[0-3][0-9]-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)-20[0-9][0-9]/##-MMM-20##/g'"

# 1.7 java version
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_79`
# export JAVA_HOME=`/usr/libexec/java_home`

alias jsoncat='php /Users/mmoci/Dati/Progetti/hotels/php-utils/jsoncat.php'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mmoci/.sdkman"
[[ -s "/Users/mmoci/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mmoci/.sdkman/bin/sdkman-init.sh"
