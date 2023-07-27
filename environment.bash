PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;34m\][\t]\[\e[00m\]#\[\e[01;35m\]\u\[\e[00m\]@\[\e[01;32m\]\h\[\e[00m\]:\[\e[01;36m\]\w\[\e[00m\]$ '
# If git is present on the system
# enable the advanced git version customization
if type git > /dev/null 2>&1
then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="verbose name"
  GIT_PS1_DESCRIBE_STYLE=branch
  GIT_PS1_SHOWCOLORHINTS=true
  __pc_first_time=true
  # The use of the _if_ directive and the PS1BASE variable
  # makes it possible to take into account a potential PS1 change
  # done after this scipt is called
  PROMPT_COMMAND='if $__pc_first_time; then PS1BASE=$PS1; __pc_first_time=false; fi; __git_ps1 "" "$PS1BASE" "%s\n"'
fi
if [ -d ~/bin ]
then
  PATH=$PATH:~/bin
fi
