# Include all ~/.bash_aliases.d/*.bash files
if [ -d ~/.bash_aliases.d ]; then
  for i in ~/.bash_aliases.d/*.bash
  do
    source $i
  done
fi
