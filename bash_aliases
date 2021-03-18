# Include all ~/.bash_aliases.d/*.bash files
if [ -d ~/.bash_aliases.d ]
then
#load general .bash files
  for i in ~/.bash_aliases.d/*.bash
  do
    source $i
  done
#Load host-specific .bash files
  if [ -d  ~/.bash_aliases.d/$HOSTNAME ]
  then
    for j in ~/.bash_aliases.d/$HOSTNAME/*.bash
    do
      source $j
    done
  fi
else
  echo "Missing ~/.bash_aliases.d folder !!!"
fi
