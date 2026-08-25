;; helix.scm — loaded first. Anything `provide`d here becomes a `:typed` command.
;; Functions annotated with ;;@doc show their docs in the command prompt.

(require "helix/editor.scm")
(require (prefix-in helix. "helix/commands.scm"))
(require (prefix-in helix.static. "helix/static.scm"))
(require "helix/misc.scm")

;; Plugins from github.com/mattwparas/helix-config (vendored in ./cogs)
(require (only-in "cogs/recentf.scm" recentf-open-files recentf-snapshot))
(require (only-in "cogs/git-status-picker.scm" create-gs-picker))
(require (only-in "forest/forest.scm" forest-open))

(provide shell
         git-add
         git-blame-line
         open-helix-scm
         open-init-scm
         ;; re-exported so they are available as :typed commands
         recentf-open-files
         create-gs-picker
         lazygit
         agent
         notes
         browse-notes)

(define (current-path)
  (let* ([focus (editor-focus)]
         [focus-doc-id (editor->doc-id focus)])
    (editor-document->path focus-doc-id)))

;;@doc
;; Run a shell command where % is replaced by the current file path
(define (shell . args)
  (helix.run-shell-command
   (string-join
    (map (lambda (x) (if (equal? x "%") (current-path) x)) args)
    " ")))

;;@doc
;; git add the current file
(define (git-add)
  (shell "git" "add" "%"))

;;@doc
;; git blame the current file
(define (git-blame-line)
  (shell "git" "blame" "%"))

;;@doc
;; Open helix.scm
(define (open-helix-scm)
  (helix.open (helix.static.get-helix-scm-path)))

;;@doc
;; Open init.scm
(define (open-init-scm)
  (helix.open (helix.static.get-init-scm-path)))

;; --- terminal handoff helpers --------------------------------------------
;; :insert-output joins its args and runs them through the shell, so the whole
;; command line is passed as a single string. Note %{workspace_directory} is
;; NOT expanded when a typed command is called from Steel, hence
;; (helix-find-workspace).

(define (with-tty-app cmd)
  (helix.new)
  (helix.insert-output cmd)
  (helix.buffer-close!)
  ;; toggle mouse so the child TUI releases/regains the terminal cleanly
  (helix.set-option "mouse" "false")
  (helix.set-option "mouse" "true")
  (helix.redraw))

;;@doc
;; Open lazygit for the current workspace
(define (lazygit)
  (helix.write-all)
  (with-tty-app "lazygit")
  (helix.reload-all))

;;@doc
;; Open opencode, resuming the last session
(define (agent)
  (helix.write-all)
  (with-tty-app
   (string-append "script -q /dev/null opencode -c "
                  (helix-find-workspace)
                  " < /dev/tty > /dev/tty"))
  (helix.reload-all))

;;@doc
;; Browse the nb notes directory in the file tree
(define (notes)
  (helix.change-current-directory (string-append (env-var "HOME") "/.nb/home"))
  (forest-open))

;;@doc
;; Browse notes with nb + w3m
(define (browse-notes)
  (with-tty-app "script -q /dev/null nb browse < /dev/tty > /dev/tty"))
