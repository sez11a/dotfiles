
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 4
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/sezovr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# Rich Sezov Custom Stuff
# Some of this comes from helmuthdu's Arch Ultimate Install

# Oh-My-Posh
if command -v oh-my-posh &> /dev/null; then
  eval "$(oh-my-posh init zsh --config ~/.dotfiles/hybrid-bash-prompt.yaml)"
fi

_isxrunning=false
[[ -n "$DISPLAY" ]] && _isxrunning=true

_isroot=false
[[ $UID -eq 0 ]] && _isroot=true

# PS1 CONFIG {{{
export TERM='xterm-256color'

# Amiga-like Say function
function say { echo "$1" | festival --tts; }

export EDITOR=nvim
export VISUAL=nvim

alias vi='nvim'
alias nv='nvim-qt'
alias t='todo.sh'
alias to='todotxt-machine'
alias sudo='sudo -E'
alias ws='jstar -text_color white+bg_blue'
alias wt='WordTsar'

# Ant configured to build Liferay
ANT_OPTS="-Xms4096M -Xmx4096M -XX:-UseGCOverheadLimit"
ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"

export JPM_PACKAGES=~/.jpm
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:~/.jpm/bin:~/.npm-global/bin

function fineFinder() {
    find -name "*.${1:-java}" -print0 | xargs -0 grep -${3:-r} --color=auto "${2:-@review}"


echo _________________________________________________________________________________________
echo REMINDER: *fineFinder* is a function that uses find and grep. The actual command run was
echo    
echo    find -name "*.${1:-java}" -print0 \| xargs -0 grep -${3:-r} --color=auto "${2:-@review}"
echo _________________________________________________________________________________________
}

# COLORED MANUAL PAGES {{{
# @see http://www.tuxarena.com/?p=508
# For colourful man pages (CLUG-Wiki style)
if $_isxrunning; then
	export PAGER=less
	export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
	export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
	export LESS_TERMCAP_me=$'\E[0m'           # end mode
	export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
	export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
	export LESS_TERMCAP_ue=$'\E[0m'           # end underline
	export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi
#}}}

# AUTOCOLOR {{{
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#}}}

# TOP 10 COMMANDS {{{
# copyright 2007 - 2010 Christopher Bratusek
top10() { history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head; }
#}}}
# UP {{{
# Goes up many dirs as the number passed as argument, if none goes up by 1 by default
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [[ -z "$d" ]]; then
		d=..
	fi
	cd $d
}
#}}}
# ARCHIVE EXTRACTOR {{{
extract() {
	clrstart="\033[1;34m" #color codes
	clrend="\033[0m"

	if [[ "$#" -lt 1 ]]; then
		echo -e "${clrstart}Pass a filename. Optionally a destination folder. You can also append a v for verbose output.${clrend}"
		exit 1 #not enough args
	fi

	if [[ ! -e "$1" ]]; then
		echo -e "${clrstart}File does not exist!${clrend}"
		exit 2 #file not found
	fi

	if [[ -z "$2" ]]; then
		DESTDIR="." #set destdir to current dir
	elif [[ ! -d "$2" ]]; then
		echo -e -n "${clrstart}Destination folder doesn't exist or isnt a directory. Create? (y/n): ${clrend}"
		read response
		#echo -e "\n"
		if [[ $response == y || $response == Y ]]; then
			mkdir -p "$2"
			if [ $? -eq 0 ]; then
				DESTDIR="$2"
			else
				exit 6 #Write perms error
			fi
		else
			echo -e "${clrstart}Closing.${clrend}"
			exit 3 # n/wrong response
		fi
	else
		DESTDIR="$2"
	fi

	if [[ ! -z "$3" ]]; then
		if [[ "$3" != "v" ]]; then
			echo -e "${clrstart}Wrong argument $3 !${clrend}"
			exit 4 #wrong arg 3
		fi
	fi

	filename=$(basename "$1")

	#echo "${filename##*.}" debug

	case "${filename##*.}" in
	tar)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (uncompressed tar)${clrend}"
		tar x${3}f "$1" -C "$DESTDIR"
		;;
	gz)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
		tar x${3}fz "$1" -C "$DESTDIR"
		;;
	tgz)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (gip compressed tar)${clrend}"
		tar x${3}fz "$1" -C "$DESTDIR"
		;;
	xz)
		echo -e "${clrstart}Extracting  $1 to $DESTDIR: (gip compressed tar)${clrend}"
		tar x${3}f -J "$1" -C "$DESTDIR"
		;;
	bz2)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (bzip compressed tar)${clrend}"
		tar x${3}fj "$1" -C "$DESTDIR"
		;;
	zip)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (zipp compressed file)${clrend}"
		unzip "$1" -d "$DESTDIR"
		;;
	rar)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (rar compressed file)${clrend}"
		unrar x "$1" "$DESTDIR"
		;;
	7z)
		echo -e "${clrstart}Extracting $1 to $DESTDIR: (7zip compressed file)${clrend}"
		7za e "$1" -o"$DESTDIR"
		;;
	*)
		echo -e "${clrstart}Unknown archieve format!"
		exit 5
		;;
	esac
}
#}}}
# ARCHIVE COMPRESS {{{
compress() {
	if [[ -n "$1" ]]; then
		FILE=$1
		case $FILE in
		*.tar) shift && tar cf $FILE $* ;;
		*.tar.bz2) shift && tar cjf $FILE $* ;;
		*.tar.gz) shift && tar czf $FILE $* ;;
		*.tgz) shift && tar czf $FILE $* ;;
		*.zip) shift && zip $FILE $* ;;
		*.rar) shift && rar $FILE $* ;;
		esac
	else
		echo "usage: compress <foo.tar.gz> ./foo ./bar"
	fi
}
#}}}
# CONVERT TO ISO {{{
to_iso() {
	if [[ $# == 0 || $1 == "--help" || $1 == "-h" ]]; then
		echo -e "Converts raw, bin, cue, ccd, img, mdf, nrg cd/dvd image files to ISO image file.\nUsage: to_iso file1 file2..."
	fi
	for i in $*; do
		if [[ ! -f "$i" ]]; then
			echo "'$i' is not a valid file; jumping it"
		else
			echo -n "converting $i..."
			OUT=$(echo $i | cut -d '.' -f 1)
			case $i in
			*.raw) bchunk -v $i $OUT.iso ;; #raw=bin #*.cue #*.bin
			*.bin | *.cue) bin2iso $i $OUT.iso ;;
			*.ccd | *.img) ccd2iso $i $OUT.iso ;; #Clone CD images
			*.mdf) mdf2iso $i $OUT.iso ;;         #Alcohol images
			*.nrg) nrg2iso $i $OUT.iso ;;         #nero images
			*) echo "to_iso don't know de extension of '$i'" ;;
			esac
			if [[ $? != 0 ]]; then
				echo -e "${R}ERROR!${W}"
			else
				echo -e "${G}done!${W}"
			fi
		fi
	done
}
#}}}
# REMIND ME, ITS IMPORTANT! {{{
# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
remindme() { sleep $1 && kdialog --info --text "$2" & }
#}}}
# SIMPLE CALCULATOR #{{{
# usage: calc <equation>
calc() {
	if which bc &>/dev/null; then
		echo "scale=3; $*" | bc -l
	else
		awk "BEGIN { print $* }"
	fi
}
#}}}
# FILE & STRINGS RELATED FUNCTIONS {{{
## FIND A FILE WITH A PATTERN IN NAME {{{
ff() { find . -type f -iname '*'$*'*' -ls; }
#}}}
## FIND A FILE WITH PATTERN $1 IN NAME AND EXECUTE $2 ON IT {{{
fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;; }
#}}}
## MOVE FILENAMES TO LOWERCASE {{{
lowercase() {
	for file; do
		filename=${file##*/}
		case "$filename" in
		*/*) dirname==${file%/*} ;;
		*) dirname=. ;;
		esac
		nf=$(echo $filename | tr A-Z a-z)
		newname="${dirname}/${nf}"
		if [[ "$nf" != "$filename" ]]; then
			mv "$file" "$newname"
			echo "lowercase: $file --> $newname"
		else
			echo "lowercase: $file not changed."
		fi
	done
}
#}}}
## SWAP 2 FILENAMES AROUND, IF THEY EXIST {{{
#(from Uzi's bashrc).
swap() {
	local TMPFILE=tmp.$$

	[[ $# -ne 2 ]] && echo "swap: 2 arguments needed" && return 1
	[[ ! -e $1 ]] && echo "swap: $1 does not exist" && return 1
	[[ ! -e $2 ]] && echo "swap: $2 does not exist" && return 1

	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}
#}}}
## FINDS DIRECTORY SIZES AND LISTS THEM FOR THE CURRENT DIRECTORY {{{
dirsize() {
	du -shx * .[a-zA-Z0-9_]* 2>/dev/null | egrep '^ *[0-9.]*[MG]' | sort -n >/tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm -rf /tmp/list
}
#}}}
## FIND AND REMOVED EMPTY DIRECTORIES {{{
fared() {
	read -p "Delete all empty folders recursively [y/N]: " OPT
	[[ $OPT == y ]] && find . -type d -empty -exec rm -fr {} \; &>/dev/null
}
#}}}
## FIND AND REMOVED ALL DOTFILES {{{
farad() {
	read -p "Delete all dotfiles recursively [y/N]: " OPT
	[[ $OPT == y ]] && find . -name '.*' -type f -exec rm -rf {} \;
}
#}}}
# ENTER AND LIST DIRECTORY{{{
function cd() { builtin cd -- "$@" && { [ "$PS1" = "" ] || ls -h --group-directories-first --color; }; }
#}}}

# Liferay Stuff
function cd_module() {
	local git_dir="$(git rev-parse --show-toplevel)"

	local module_dir="$(
		git -C "${git_dir}" ls-files -- \
			':!:**/src/**' \
			\
			'*.bnd' \
			'*build.xml' \
			'*pom.xml' |

			#
			# Get the directory name with sed instead of dirname because it is much faster
			#
			sed -E \
				-e 's,[^/]*$,,g' \
				\
				-e 's,/$,,g' \
				-e '/^$/d' |

			#
			# Remove duplicates because some modules have more than one *.bnd file
			#
			uniq |

			#
			# Pass the results to fzf
			#
			fzf \
				--exit-0 \
				--no-multi \
				--query "$*" \
				--select-1 \
			;
	)"

	if [ -n "${module_dir}" ]; then
		cd "${git_dir}/${module_dir}" || return 1
	fi
}

function customize_aliases {
	alias ..='cd ..'
	alias ac="ant compile"
	alias acc="ant clean compile"
	alias ad="ant deploy"
	alias af="ant format-source"
	alias afcb="ant format-source-current-branch"

	alias cdm="cd_module"
	alias cdt="cd ~/dev/projects/liferay-portal"

	alias d="docker"
	alias df='df -h'
	alias dpsqlclient="docker exec -it galatians-psql psql -U postgres"
	alias dpsqlserver="docker run --name galatians-psql --rm -d -e POSTGRES_PASSWORD=test -p 5432:5432 postgres:13"

	alias g="git"
	alias gfpr="git_fetch_pr ${1}"
	alias gg="git_grep"
	alias gi="gpr info"
	alias gpr="~/dev/projects/git-tools/git-pull-request/git-pull-request.sh"

	alias la="ls -la --group-directories-first"
}

function execute_gradlew {
	if [ -e gradlew ]; then
		./gradlew ${@}
	elif [ -e ../gradlew ]; then
		../gradlew ${@}
	elif [ -e ../../gradlew ]; then
		../../gradlew ${@}
	elif [ -e ../../../gradlew ]; then
		../../../gradlew ${@}
	elif [ -e ../../../../gradlew ]; then
		../../../../gradlew ${@}
	elif [ -e ../../../../../gradlew ]; then
		../../../../../gradlew ${@}
	elif [ -e ../../../../../../gradlew ]; then
		../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../gradlew ]; then
		../../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../../gradlew ]; then
		../../../../../../../../gradlew ${@}
	elif [ -e ../../../../../../../../../gradlew ]; then
		../../../../../../../../../gradlew ${@}
	else
		echo "Unable to find locate Gradle wrapper."
	fi
}

function git_fetch_pr {
	if [[ "${1}" != */github\.com/* ]] ||
		[[ "${1}" != */pull/* ]]; then
		echo "URL ${1} does not point to a GitHub pull request."
	else
		IFS='/' read -r -a github_pr_parts <<<"${1}"

		git fetch --no-tags git@github.com:${github_pr_parts[3]}/${github_pr_parts[4]}.git pull/${github_pr_parts[6]}/head:pr-${github_pr_parts[6]}
	fi
}

function git_grep {
	if [ ${#} -eq 1 ]; then
		git --no-pager grep --files-with-matches "${1}"
	elif [ ${#} -eq 2 ]; then
		git --no-pager grep --files-with-matches "${1}" -- "${2}"
	elif [ ${#} -eq 3 ]; then
		git --no-pager grep --files-with-matches "${1}" -- "${2}" "${3}"
	elif [ ${#} -eq 4 ]; then
		git --no-pager grep --files-with-matches "${1}" -- "${2}" "${3}" "${4}"
	fi
}

function gw {
	execute_gradlew "${@//\//:}" --daemon
}

function parse_git_branch {
	GIT_DIR_NAME=$(git rev-parse --show-toplevel)

	GIT_DIR_NAME=${GIT_DIR_NAME##*/}

	if [[ "${GIT_DIR_NAME}" =~ -ee-[0-9][^\-]*$ ]]; then
		echo "ee-${GIT_DIR_NAME##*-ee-}"
	elif [[ "${GIT_DIR_NAME}" =~ -[0-9][^\-]*$ ]]; then
		echo "${GIT_DIR_NAME##*-}"
	elif [[ "${GIT_DIR_NAME}" =~ com-liferay-osb-asah-private$ ]]; then
		echo "7.0.x"
	elif [[ "${GIT_DIR_NAME}" =~ -private$ ]]; then
		echo "${GIT_DIR_NAME}" | sed 's/.*-\([^\-]*\)-private$/\1-private/'
	else
		echo "master"
	fi
}

function parse_git_current_branch {
	git rev-parse --abbrev-ref HEAD 2>/dev/null
}

function parse_git_current_branch_with_parentheses {
	parse_git_current_branch | sed 's/.*/(&)/'
}

customize_aliases

## End of Liferay stuff
