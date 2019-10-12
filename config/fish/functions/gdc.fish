# Defined in - @ line 1
function gdc --description 'alias gdc git diff --cached'
	git diff --cached $argv;
end
