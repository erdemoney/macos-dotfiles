function xxh --wraps xxh --description 'xxh with a TERM the remote is guaranteed to understand'
    # xxh relocates HOME to ~/.xxh on the remote, so ncurses looks for
    # $HOME/.xxh/.terminfo and never finds the xterm-ghostty entry that
    # `ghostty +ssh` installs in the real ~/.terminfo. Rather than provision
    # terminfo on every new host, just ask for a type that ships everywhere.
    if not contains -- +e $argv; and not string match -qr '^\+\+env' -- $argv
        set -a argv +e TERM=xterm-256color
    end
    command xxh $argv
end
