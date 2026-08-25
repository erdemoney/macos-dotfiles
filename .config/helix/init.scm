;; init.scm — runs at the top level after helix.scm is required.
;; The editor context is bound to *helix.cx*.
;;
;; Note: editor options stay in config.toml to avoid two sources of truth.

(require "helix/configuration.scm")

;; Bring :evalp and :eval-buffer to the top level for interactive plugin dev.
(require (only-in "helix/ext.scm" evalp eval-buffer))
(provide evalp eval-buffer)

;; Wire up the Steel LSP so editing .scm files gets completion and docs.
(define-lsp "steel-language-server"
            (command "steel-language-server")
            (args '()))

(define-language "scheme"
                 (language-servers '("steel-language-server")))

;; --- plugins -------------------------------------------------------------

;; forest.hx — file tree (replaces the helix-config file-tree cog)
(require "helix/keymaps.scm")

(require "forest/forest.scm")
(forest-configure! 'left #:ignore (list ".git" "target" "__pycache__" ".venv" ".ruff_cache"))
(forest-set-style! 'mini)

;; scooter.hx — native search & replace (replaces the scooter TUI shellout)
(require "scooter/scooter.scm")

;; recent files, from github.com/mattwparas/helix-config (vendored in ./cogs)
(require (only-in "cogs/recentf.scm" recentf-snapshot))

;; Start the recent-files loop (re-enqueues itself every 2 minutes).
(recentf-snapshot)

;; helix-file-watcher — watch changes in open files
(require "helix-file-watcher/file-watcher.scm")

;; Start the watcher on the current directory
(spawn-watcher)

;; --- keybindings for plugin commands -------------------------------------
;; Defined here rather than config.toml so Helix can resolve their ;;@doc
;; strings at runtime; TOML-parsed bindings show "Undocumented plugin command".

(keymap (global)
        (normal (space (e ":forest-open"))
                ("," (r ":scooter")
                     (R ":scooter-new")
                     (g ":lazygit")
                     (a ":agent")
                     (n ":notes")
                     (b ":browse-notes"))))
