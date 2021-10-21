. "$HOME/.config/fish/functions/aliases.fish"

begin
  set --local AUTOJUMP_PATH $HOME/.config/fish/functions/autojump.fish
  if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
  end
end

source (brew --prefix asdf)/asdf.fish

export NVM_DIR="$HOME/.nvm"
export ERL_AFLAGS="-kernel shell_history enabled"

fzf_key_bindings
fzf_key_bindings
