if [[ -f /usr/bin/aws_zsh_completer.sh ]]; then 
  source /usr/bin/aws_zsh_completer.sh
fi

function mfa {
  op item get AWS --vault Work --otp
}

function ar {
  awsume --session-name "ldeutz" --mfa-token "$(mfa)" $@
}
alias unar='awsume --unset'

alias aws-get-id='aws sts get-caller-identity | jq .'
alias aws-whoami='aws sts get-caller-identity | jq .'
alias aws-roles='awk '\''/\[profile [a-z]/ { print $2 }'\'' $HOME/.aws/config |tr -d \]'
