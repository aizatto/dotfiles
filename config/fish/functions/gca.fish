# Defined in - @ line 1
function gca --description 'alias gca git commit --amend --no-edit'
	git commit --amend --no-edit $argv;
end
