# Commands to run in interactive sessions can go here
if status is-interactive
    fish_vi_key_bindings
    atuin init fish | source
    direnv hook fish | source
end

# Trust the corporate Zscaler TLS-inspection root CA in tools that use their
# own CA store instead of the macOS keychain (Python urllib/ssl, requests,
# pip, pre-commit's golang toolchain download, etc.). Bundle built by
# concatenating certifi's defaults with the exported Zscaler chain.
if test -f "$HOME/.config/certs/ca-bundle.pem"
    set -gx SSL_CERT_FILE "$HOME/.config/certs/ca-bundle.pem"
    set -gx REQUESTS_CA_BUNDLE "$HOME/.config/certs/ca-bundle.pem"
end

# add ~/.local/bin to $PATH
set PATH $PATH /Users/edemoney/.local/bin
