
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
[ -e /usr/local/Cellar/fzf/0.21.1/shell/key-bindings.fish ]; and source /usr/local/Cellar/fzf/0.21.1/shell/key-bindings.fish
[ -e /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish ] ; and source /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /Users/aizat/.nvm/versions/node/v10.16.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -gx PATH /usr/local/bin $PATH
