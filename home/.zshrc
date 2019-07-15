
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gianu"
ZSH_THEME="michelebologna"
# Using powerline theme from https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
#ZSH_THEME="powerline"
#POWERLINE_HIDE_HOST_NAME="true"
#POWERLINE_DETECT_SSH="true"
#POWERLINE_RIGHT_A="exit-status-on-fail"
#POWERLINE_PATH="short"

setopt auto_cd
cdpath=($HOME $HOME/projects)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Customize to your needs...

PATH=$PATH:${HOME}/bin:${HOME}/.local/bin:${HOME}/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin

# Set the JVM, http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
#
function setjdk() {  
  if [ $# -ne 0 ]; then  
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
    if [ -n "${JAVA_HOME+x}" ]; then  
      removeFromPath $JAVA_HOME  
    fi  
    export JAVA_HOME=`/usr/libexec/java_home -v $@`  
    export PATH=$JAVA_HOME/bin:$PATH  
  fi  
}  

function removeFromPath() {  
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
} 

if [ `uname -s` = 'Darwin' ]; then
  if [ -x /usr/libexec/path_helper ]; then
      eval `/usr/libexec/path_helper -s`
  fi

  export LC_ALL=en_US.UTF-8
  POSTGRES_VERSION='10'
  export PGPORT=54${POSTGRES_VERSION}0
  setjdk 1.8
  #export http_proxy=http://216.70.33.26:3128
  export VIRTUALENVWRAPPER_PYTHON='/opt/local/bin/python3.7'
  export VIRTUALENVWRAPPER_VIRTUALENV='/opt/local/bin/virtualenv-3.7'
  export VIRTUALENVWRAPPER_VIRTUALENV_CLONE='/opt/local/bin/virtualenv-clone-3.7'
  source /opt/local/bin/virtualenvwrapper.sh-3.7
  export WORKON_HOME=$HOME/.virtualenvs
  # Mac specific paths
  PATH=/opt/local/bin:/opt/local/libexec/gnubin:/opt/local/lib/postgresql${POSTGRES_VERSION}/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/Users/cdh/dev/flutter/bin:/Users/cdh/Library/Android/sdk/build-tools/23.0.2:$PATH
  plugins=(git git-flow nmap mvn osx vagrant macports tmux python gradle rsync httpie docker golang gradle)
  alias ls='ls -sCFG --color=auto'
  alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql${POSTGRES_VERSION}-server/postgresql${POSTGRES_VERSION}-server.wrapper start'
  alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql${POSTGRES_VERSION}-server/postgresql${POSTGRES_VERSION}-server.wrapper stop'
  # For httpie
  export NO_PROXY=localhost,enventis.com,singlelink.com,inficonn.net,hickorytech.local,216.70.33.40,ddc.local,10.63.210.13,consolidated.com,enventis.com,10.63.63.11,10.63.210.16,10.63.208.2,127.0.0.1,pfm
else
    if [ -d /usr/lib/jvm/jre ]; then
        export JAVA_HOME=/usr/lib/jvm/jre
    fi
  plugins=(git mvn httpie golang tmux python)
fi

export PATH

[[ -s "$HOME/.homesick/repos/homeshick/homeshick.sh" ]] && source "$HOME/.homesick/repos/homeshick/homeshick.sh"
[[ -s $HOME/.homesick/repos/homeshick/completions ]] && fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
[[ -s $HOME/.completions ]] && fpath=($HOME/.completions $fpath)
[[ -s $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

alias rmall='/bin/rm -rf'
alias f1='fg %1'
alias f2='fg %2'
alias f3='fg %3'
alias f4='fg %4'
alias f5='fg %5'
alias md='mkdir'
alias rd='rmdir'
alias ssh='ssh -C'
alias j='jobs'
alias ls='ls -sCFG --color=auto'
alias rscreen='screen -DR'
cpv() {
    pv "$1" > "$2"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" && -z $(which sdkman-init.sh | grep '/sdkman-init.sh') ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
