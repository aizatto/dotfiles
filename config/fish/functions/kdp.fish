# Defined in - @ line 1
function kdp --description 'alias kdp kubectl describe pods'
	kubectl describe pods $argv;
end
