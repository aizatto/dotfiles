# Defined in - @ line 1
function kgd --description 'alias kgd kubectl get deployments'
	kubectl get deployments $argv;
end
