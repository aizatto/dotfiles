# Defined in - @ line 1
function gdn --description 'alias gdn git diff --name-only --diff-filter=AMCR'
	git diff --name-only --diff-filter=AMCR $argv;
end
