source /usr/share/git/completion/git-prompt.sh

#PS1='\[\e[0;37m\][\[\e[0;31m\]\u@\h\[\e[0;33m\]$(__git_ps1 " (%s)") \[\e[0;32m\]\W\[\e[0;37m\]]\$\[\e[m\] '
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[35m\u@\h\e[0m'; else echo '\e[35m\u@\h\e[0m' ; fi\`:\e[0;31m\$PWD\e[0m\[\e[m\]\n\e[0;33m\$(__git_ps1 '(%s)')\e[0;30m$\e[0m\[\e[m\] "

TERM=xterm-256color

red=$(tput setaf 1)
purple=$(tput setaf 5)
green=$(tput setaf 2)
blue=$(tput setaf 4)
yellow=$(tput setaf 3)
black=$(tput setaf 0)
white=$(tput setaf 7)
bold=$(tput bold)
reset=$(tput sgr0)
PS1='\[$green$bold\]\u@\h\[$reset\]:\[$red$bold\]\w\[$reset\]\n\[$yellow$bold\]$(__git_ps1 "(%s)") \[$reset\]$ '


#if [ -f ~/.dir_colors]; then
#    eval `dircolors ~/.dir_colors`
#fi

alias vi='nvim'
alias t='todo.sh'
alias to='todotxt-machine'
#complete -F _todo t
alias sudo='sudo -E'
alias ws='jstar -text_color white+bg_blue'
alias gitpr='~/Documents/code/git-tools/git-pull-request/git-pull-request.sh'
fixnpm() {
        git ls-files modules | grep -F package.json | xargs -I {} dirname {} | xargs -I {} rm -rf {}/node_modules
}
function say { echo "$1" | festival --tts; }
export -f say
export QT_QPA_PLATFORMTHEME=appmenu-qt5
#JAVA_HOME=/usr/lib64/jvm/java-8-jdk
ANT_HOME=/apps/apache-ant-1.9.6
ANT_OPTS="-Xms4096M -Xmx4096M -XX:MaxPermSize=1024M -XX:-UseGCOverheadLimit"
ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"

#M3_HOME=/apps/apache-maven-3.0.3
#M3=$M3_HOME/bin
M2_HOME=/opt/maven
MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=1024m"

IZPACK_HOME=/apps/IzPack

#ANDROID_HOME=/java/android-sdk-linux_86
GRINDERPATH=/apps/grinder-3.4
GRINDERPROPERTIES=/apps/grinder-3.4/grinder.properties
CLASSPATH=$GRINDERPATH/lib/grinder.jar:$CLASSPATH

# Fun with Eclipse
#export SWT_GTK3=0

export EDITOR=nvim
export VISUAL=nvim
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# Experimenting with jayatana
# experiment over; it doesn't work
#export JAVA_TOOL_OPTIONS="-javaagent:/usr/share/java/jayatanaag.jar $JAVA_TOOL_OPTIONS"

PATH=$PATH:$HOME/bin:$ANT_HOME/bin:$IZPACK_HOME/bin

export ANT_OPTS ANT_ARGS M2_HOME PATH ANT_HOME MAVEN_OPTS GRINDERPATH CLASSPATH

# Use archlinux-java status to see which JDK is set as default
# Use archlinux-java java-7-openjdk or archlinux-java java-8-jdk to set

JPM_PACKAGES=/home/sezovr/jpm
NPM_PACKAGES=/home/sezovr/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules"
PATH="$PATH:$JPM_PACKAGES/bin:$NPM_PACKAGES/bin"

# Fix global menu support for Slack and Skype
export ELECTRON_FORCE_WINDOW_MENU_BAR=1

export JPM_PACKAGES NPM_PACKAGES NODE_PATH

export PATH="$PATH:/home/sezovr/jpm/bin"
