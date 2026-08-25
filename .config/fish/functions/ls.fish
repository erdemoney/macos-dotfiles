function ls --wraps='exa --icons -s type' --description 'alias ls=exa --icons -s type'
    eza --icons -s type $argv
end
