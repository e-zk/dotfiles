#!/bin/sh

# share the ssh-agent socket with windows
# requires npiperlay.exe to be in $HOME/bin
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
ss -a | grep -q $SSH_AUTH_SOCK
if [ $? -ne 0 ]; then
        rm -f $SSH_AUTH_SOCK
        ( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$HOME/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1

        # import keys under ~/.ssh
        for pubkey in $(find "$HOME/.ssh" -name '*.pub' -print); do
                key="$(cat "$pubkey" | cut -d' ' -f1,2)"
                if ! ssh-add -L | cut -d' ' -f1,2 | grep -q -- "$key"; then
                        # add the key
                        ssh-add "${pubkey%*.pub}"
                else
                        # skip, since this key is already in the agent
                        continue
                fi
        done
fi
