# Works only with BASH
load_ssh-agent()
{
  if ! agents=($(pgrep ssh-agent))
  then
    echo "No ssh-agent instance detected."
    echo "Starting one."
    eval $(ssh-agent)
    return
  else
    if [ ${#agents[@]} -gt 1 ];
    then
      echo "More than one ssh-agent instance are already running !"
      echo "Please clean-up your system manualy. Aborting ..."
      return 1
    fi
  fi

  SSH_AUTH_SOCK=$(echo /tmp/ssh-*/agent.*); export SSH_AUTH_SOCK
  SSH_AGENT_PID=$(pgrep ssh-agent); export SSH_AGENT_PID

  echo "List of active keys :"

  ssh-add -l
}
