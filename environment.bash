#PS1 or advanced git version customization
if type git > /dev/null 2>&1
then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="verbose name"
  GIT_PS1_DESCRIBE_STYLE=branch
  GIT_PS1_SHOWCOLORHINTS=true
  PROMPT_COMMAND='__git_ps1 "" "\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;34m\][\t]\[\e[00m\]#\[\e[01;35m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[01;36m\]\w\[\e[00m\]$ " "%s\n"'
else
  PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;34m\][\t]\[\e[00m\]#\[\e[01;35m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[01;36m\]\w\[\e[00m\]$ '
fi
if [ -d ~/bin ]
then
  PATH=$PATH:~/bin
fi
