# Defined in - @ line 1
function kgrs --description 'alias kgrs kubectl get rs'
	kubectl get rs $argv;
end
