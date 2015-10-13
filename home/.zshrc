
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# Just "gianu" with a different prompt so I know if I'm root
#ZSH_THEME="cdh"
# Using powerline theme from https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
#ZSH_THEME="agnoster"
ZSH_THEME="powerline"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_DETECT_SSH="true"

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
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Customize to your needs...

PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/bin

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
    POSTGRES_VERSION='94'
    export PGPORT=5${POSTGRES_VERSION}0
  #export JAVA_HOME=$(/usr/libexec/java_home)
  setjdk 1.7
  export http_proxy=http://216.70.33.26:3128
  # Mac specific paths
  PATH=/opt/local/bin:/opt/local/lib/postgresql${POSTGRES_VERSION}/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$HOME/tmp/powerline/scripts:$PATH
  plugins=(git git-flow nmap mvn osx vagrant macports tmux)
  alias ls='ls -sCFG'
  alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql${POSTGRES_VERSION}-server/postgresql${POSTGRES_VERSION}-server.wrapper start'
  alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql${POSTGRES_VERSION}-server/postgresql${POSTGRES_VERSION}-server.wrapper stop'
  # For httpie
  export NO_PROXY=localhost,enventis.com,singlelink.com,inficonn.net,hickorytech.local,216.70.33.40,ddc.local,10.63.210.13,consolidated.com,10.63.63.11
else
  export JAVA_HOME=/usr/lib/jvm/jre
  plugins=(git mvn vagrant)
  alias ls='ls -sCF --color=auto'
fi

export PATH

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source $ZSH/oh-my-zsh.sh

#export PATH=/Users/cdh/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/ant/bin:/bin:/Applications/griffon-0.9.5/bin:/usr/share/grails/bin:/Users/cdh/bin/maven/bin:/usr/share/gradle/bin:/opt/local/bin:/usr/local/git/bin:/Applications/Xcode.app/Contents/Developer/usr/bin

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
alias ls='ls -sCFG'
alias rscreen='screen -DR'
cpv() {
    pv "$1" > "$2"
}

#. ~/tmp/powerline/powerline/bindings/zsh/powerline.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/cdh/.sdkman/bin/sdkman-init.sh" && -z $(which sdkman-init.sh | grep '/sdkman-init.sh') ]] && source "/Users/cdh/.sdkman/bin/sdkman-init.sh"
