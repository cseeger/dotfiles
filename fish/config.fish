. "$HOME/.config/fish/functions/aliases.fish"

begin
  set --local AUTOJUMP_PATH $HOME/.config/fish/functions/autojump.fish
  if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
  end
end

source (brew --prefix asdf)/asdf.fish

fzf_key_bindings

export NVM_DIR="$HOME/.nvm"
fzf_key_bindings