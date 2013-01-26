# GIT shortcuts
alias gitconf='more .git/config'
alias gs='git status'
alias gb='git branch'
alias gl='git log --stat -c --graph --decorate' #show log w/ files included im commits
alias gdiffbranch='printf "try:\n\tgit diff --stat --color  master..branch\n\tgit diff --name-status --color master..branch\n\tOr just gitdb branch1..branch2\n"'
alias gitdb='git diff --stat --color'
alias gdifforigin='echo use syntax: git diff --stat origin/master'

# PHP shortcuts
alias phpl='php -l '	# lint -- syntax check only

# numFiles: number of (non-hidden) files in current directory
alias numFiles='echo $(ls -1 | wc -l)'

# showTimes: show the modification, metadata-change, and access times of a file
showTimes () { stat -f "%N:   %m %c %a" "$@" ; }


# to find CPU hogs
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# diskwho: to show processes reading/writing to disk
alias diskwho='sudo iotop'

# fix web root perms
#alias setperms='find .  -type d -exec sudo chmod g+s {} \; &&  sudo chmod -R g+w *'
alias fixperms='sudo /root/fixperms.sh /srv/'

# WORK Stuff
alias srv='cd /srv/ && ls -al'


# colorize tree command
alias tree='tree -C '

# add git completion and git-prompt
if [ -f ~/.git-completion.sh ]; then
    . ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi