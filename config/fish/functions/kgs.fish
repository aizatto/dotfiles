# Defined in - @ line 1
function kgs --description 'alias kgs kubectl get services'
	kubectl get services $argv;
end
