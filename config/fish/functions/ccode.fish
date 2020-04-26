# Defined in - @ line 1
function ccode
    if type -q code-insiders
        code-insiders $argv
    else
        code $argv
    end
end
