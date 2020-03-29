# Defined in - @ line 1
function kgp --description 'alias kgp kubectl get pods'
	kubectl get pods $argv;
end
