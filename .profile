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

# Non Powerline Prompt
PS1='\[$green$bold\]\u@\h\[$reset\]:\[$red$bold\]\w\[$reset\]\n\[$yellow$bold\]$(__git_ps1 "(%s)") \[$reset\]$ '
set -o vi

# Amiga-like Say function
function say { echo "$1" | festival --tts; }
export -f say

export EDITOR=nvim
export VISUAL=nvim

alias vi='nvim'
alias nv='nvim-qt'
alias t='todo.sh'
alias to='todotxt-machine'
alias sudo='sudo -E'
alias ws='jstar -text_color white+bg_blue'
alias wt='WordTsar'
export QT_QPA_PLATFORMTHEME=appmenu-qt5
JAVA_HOME=/usr/lib/jvm/default

# Ant configured to build Liferay
ANT_OPTS="-Xms4096M -Xmx4096M -XX:-UseGCOverheadLimit"

# To debug Ant tasks: 
# ANT_OPTS="-agentlib:jdwp=transport=dt_socket,address=8787,server=y,suspend=y -Xms4096M -Xmx4096M -XX:-UseGCOverheadLimit"
ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"

# Liferay function to get rid of Node modules
fixnpm() {
        git ls-files modules | grep -F package.json | xargs -I {} dirname {} | xargs -I {} rm -rf {}/node_modules
}

MAVEN_OPTS="-Xmx1024m"

IZPACK_HOME=/opt/IzPack

#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export JAVA_DEBUG="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=8000"

PATH=$PATH:$HOME/bin:$ANT_HOME/bin:$IZPACK_HOME/bin

export JAVA_HOME ANT_OPTS ANT_ARGS M2_HOME PATH ANT_HOME MAVEN_OPTS CLASSPATH

# Use archlinux-java status to see which JDK is set as default

# export JPM_PACKAGES=~/.jpm
export NPM_CONFIG_PREFIX=~/.npm-global

# Ruby Environment
if [[ -f /usr/bin/ruby ]]; then
    PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
    eval "$(rbenv init -)"
fi

export PATH=$PATH:~/jpm/bin:~/.npm-global/bin

# Integrate GTK apps with KDE
#export GTK_USE_PORTAL=1

function fineFinder() {
    find -name "*.${1:-java}" -print0 | xargs -0 grep -${3:-r} --color=auto "${2:-@review}"


echo _________________________________________________________________________________________
echo REMINDER: *fineFinder* is a function that uses find and grep. The actual command run was
echo    
echo    find -name "*.${1:-java}" -print0 \| xargs -0 grep -${3:-r} --color=auto "${2:-@review}"
echo _________________________________________________________________________________________
}

if command -v oh-my-posh &> /dev/null; then
  eval "$(oh-my-posh init bash --config ~/.dotfiles/hybrid-bash-prompt.yaml)"
fi

# Starship
if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi
