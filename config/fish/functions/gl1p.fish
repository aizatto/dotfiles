# Defined in - @ line 1
function gl1p --description 'alias gl1p git log -n1 --patch'
	git log -n1 --patch $argv;
end
