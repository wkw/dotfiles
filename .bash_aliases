# GIT shortcuts {{{
alias gitconf='more .git/config'
alias gs='git status'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gp='git push'
alias gau='git add -u'
alias gaa='git add -A'
alias gref='git reflog'
alias gco='git checkout'
alias gc='git commit '
alias gcm='git commit -m'
alias gcam='git commit -am'
#alias go='git checkout '
alias gl='git log --stat -c --graph --decorate' #show log w/ files included im commits
alias gw='grunt watch'

alias gdiffbranch='printf "try:\n\tgit diff --stat --color  master..branch\n\tgit diff --name-status --color master..branch\n\tOr just gitdb branch1..branch2\n"'
alias gitdb='git diff --stat --color'
alias gdifforigin='echo use syntax: git diff --stat origin/master'
#}}}
alias gitaliases='alias | grep git'

alias ll="ls -lah"
alias lbash=". ~/.bashrc&&echo '.bashrc has been reloaded'"	# re(load) bashrc
alias 404='grep "HTTP/1.[01]\" 404" access_log | awk "{print \$7 } " | sort | uniq -c | sort -n'

# lint all files in current directory recursively
alias phplint='find . -iname "*.php" -exec php -l {} \; | grep -i "Errors.parsing"'

#vagrant
alias vs="vagrant suspend"
alias vsleep="vagrant suspend"
alias vup="vagrant up"
alias vdown="vagrant halt"
alias vstat="vagrant status"
alias vgstat="vagrant global-status"

# set shell title. usage: rename_tab 'NEW NAME'
rename_tab () {
    TEXT=$1
    export PROMPT_COMMAND='echo -ne "\033]0;${TEXT}\007"'
}

#recursive grep
alias grepr="grep -r "

#
# simple http server
#
alias serveUp="python -m SimpleHTTPServer"

# PHP shortcuts {{{
alias phpl='php -l '	# lint -- syntax check only
# }}}

# numFiles: number of (non-hidden) files in current directory
alias numFiles='echo $(ls -1 | wc -l)'

# showTimes: show the modification, metadata-change, and access times of a file
showTimes () { stat -f "%N:   %m %c %a" "$@" ; }

#diff two folders
alias dirdiff='diff -arq '

# to find CPU hogs
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# diskwho: to show processes reading/writing to disk
alias diskwho='sudo iotop'

# fix web root perms
#alias setperms='find .  -type d -exec sudo chmod g+s {} \; &&  sudo chmod -R g+w *'
alias fixperms='sudo /root/emn_bin/fixperms.sh'

# WORK Stuff
alias srv='cd /srv/ && ls -al'
alias lbash=". ~/.bashrc&&echo '.bashrc has been reloaded'"	# re(load) bashrc
alias moshit="echo 'ssh aws-wp after connect' && mosh charon"

# colorize tree command
alias tree='tree -C '

# add git completion and git-prompt
if [ -f ~/.git-completion.sh ]; then
    . ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
if [ -f ~/.local/bin/bashmarks.sh ]; then
    source ~/.local/bin/bashmarks.sh
fi


#hipchat
if [ -f ~/.hipchat ]; then
    source ~/.hipchat
fi

export PS1="[\u@\h \W\$(__git_ps1 ' (%s)')]\$ "

[[ -f ${HOME}/.emn-wp-engine/include.sh ]] && source ${HOME}/.emn-wp-engine/include.sh

function theme() {
  CURDIR=`basename "$PWD"`
  #echo "$CURDIR"
  if [ "$CURDIR" = 'site' ]; then
    CURDIR="$(dirname "$PWD")"
    CURDIR=`basename "$CURDIR"`
  fi
  #echo "$CURDIR"
  if [ -d "wp-content/themes/$CURDIR" ]; then
    cd "wp-content/themes/$CURDIR"
  else
    cd "web/app/themes/$CURDIR"
  fi

  pwd
}

# bash completion for the `wp` command

_wp_complete() {
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

	if [[ "$opts" =~ \<file\>\s* ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	elif [[ $opts = "" ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) )
	else
		COMPREPLY=( ${opts[*]} )
	fi
}
complete -o nospace -F _wp_complete wp



# format a filename with timestamp, for use in exporting sql databases
# requires an argument -- the database name (or any string you want to use)
# usage: <your db export command> `dbname mydatabase`
dbname() {
  NAME="$1"
  DATE=`date +"%G%m%d_%H%M%S"`
  if [ -z "$NAME" ]
  then
    NAME="database_export"
  fi
  echo "$DATE"_"$NAME".sql
}
