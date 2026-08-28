function nb
    if test (count $argv) -eq 0
        command nb files
    else
        command nb $argv
    end
end
