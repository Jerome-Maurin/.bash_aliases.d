# Works only with BASH
load_ssh-agent()
{
  set -o pipefail

# Only use the ssh-agent command (-x param), not something else (gcr-ssh-agent, etc.)
  if ! agents=("$(pgrep -x ssh-agent)")
  then
    echo "No ssh-agent instance detected."
    echo "Starting one."
    eval "$(ssh-agent || true)"
  else
    if [[ ${#agents[@]} -gt 1 ]];
    then
      echo "More than one ssh-agent instance are already running !"
      echo "Please clean-up your system manually. Aborting ..."
      return 1
    else
      if cmdlne=("$(pgrep -x ssh-agent -a | grep -- \ -a)")
      then
        for ((n=0; n<${#cmdlne[@]}; n++))
        do
          if [[ "${cmdlne[${n}]}" = "-a" ]]
          then
            if [[ ${n} -lt $((${#cmdlne[@]} - 1)) ]]
            then
              SSH_AUTH_SOCK="${cmdlne[$((n + 1))]}"
              export SSH_AUTH_SOCK
            else
              echo "Wrong parameters for ssh-agent found !"
            fi
            break
          fi
        done
      else
        if [ -z "$TMPDIR" ]
        then
# As specified in the man page of ssh-agent :
          TMPDIR="/tmp"
        fi
        if ! SSH_AUTH_SOCK=$(compgen -G $TMPDIR/ssh-*/agent.*)
        then
# In case the ssh-agent was started without $TMPDIR defined
          SSH_AUTH_SOCK=$(compgen -G /tmp/ssh-*/agent.*)
        fi
        export SSH_AUTH_SOCK
      fi
      SSH_AGENT_PID=${agents[1]}
      export SSH_AGENT_PID
      echo "List of active keys :"
    fi
  fi

  if ! ssh-add -L
  then
    echo "Adding default identity :"
    ssh-add
    ssh-add -L
  fi

  set +o pipefail
}
