# Defined in - @ line 1
function kru --description 'alias kru kubectl rollout undo'
	kubectl rollout undo $argv;
end
