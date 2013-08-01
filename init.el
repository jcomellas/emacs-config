; Path to load custom Emacs modules
(add-to-list 'load-path "~/.emacs.d")

; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;; check if the packages are installed; if not, install them.
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package))))
 '(dired+ magit rainbow-mode git-gutter-fringe auto-complete minimap
   solarized-theme monokai-theme zenburn-theme pastels-on-dark-theme soothe-theme subatomic-theme
   color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow))

(setq debug-on-error t)                             ; Provide a useful error trace if loading this .emacs fails.
(setq frame-title-format "Emacs - %f")              ; Format the title-bar to always include the buffer name
(setq inhibit-startup-message t)                    ; Don't show the GNU splash screen
(setq line-number-mode t)                           ; Show line number
(setq column-number-mode t)                         ; Show column number
(setq size-indication-mode t)                       ; Show file size
(setq indicate-empty-lines t)                       ; Like vim's tildes
(setq visible-bell t)                               ; Beeping software sucks
(setq tool-bar-mode nil)                            ; Toolbars suck
(setq transient-mark-mode t)                        ; show selected regions
(show-paren-mode)                                   ; Show parens
(which-function-mode)                               ; Which function are we in?
(blink-cursor-mode nil)                             ; Use a non-blinking cursor
(bar-cursor-mode)                                   ; Show the cursor as a bar instead of as a block
(tabbar-mode)                                       ; Show tab bars at the top of the windows with the list of open buffers
(setq-default indent-tabs-mode nil)                 ; Prevent extraneous tabs (only in buffers that have their own local value)
(setq require-final-newline t)                      ; Text files supposedly end in new lines. Or they should.
(global-font-lock-mode t)                           ; Syntax highlighting
(setq desktop-enable t)                             ; Save desktop
(setq scroll-step 1)                                ; Scroll only one line at the end of the text
(setq next-line-add-newlines nil)                   ; Don't insert new lines when scrolling
(setq scroll-preserve-screen-position t)            ; Keep relative column position when scrolling
(setq save-place t)                                 ; Remember the last position in a buffer
(setq make-backup-files nil)                        ; No backup files
(fset 'yes-or-no-p 'y-or-n-p)                       ; Prompts as y/n
(mouse-avoidance-mode 'exile)                       ; Push the mouse out of the way when the cursor approaches.
(setq-default font-menu-ignore-scaled-fonts t)      ; Use scalable (TrueType) fonts
(setq default-major-mode 'text-mode)                ; Change default major mode to 'text' from 'Fundamental'
(set-scroll-bar-mode 'right)                        ; Disable scrollbar
(delete-selection-mode 1)                           ; Overwrite selected regions

(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      erc-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      gnus-group-mode
                                      gnus-summary-mode
                                      gnus-article-mode))
;; line numbers
(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))
(ad-activate 'linum-on)
(setq linum-format "%6d ")
(global-linum-mode 1)                               ; Show line numbers

(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
(setq-default left-fringe-width  0)
(setq-default right-fringe-width 15)

;(global-git-gutter-mode t)                          ; Enable git gutter

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-safe-themes (quote ("3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "3c708b84612872e720796ea1b069cf3c8b3e909a2e1da04131f40e307605b7f9" default)))
 '(foreground-color "#839496")
 '(safe-local-variable-values (quote ((erlang-indent-level . 4))))
 '(save-place t nil (saveplace)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Add the path to files with the same name so that the buffer name is unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; Remove trailing whitespace when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun my-resize-frame (height width)
   (progn
     (set-frame-height (selected-frame) height)
     (set-frame-width (selected-frame) width)))

(cond (window-system
       ;; Use the 'sunburst' color theme
       ;; (require 'color-theme)
       ;; (load-library "color-theme-sunburst.el")
       ;; (color-theme-sunburst)
       ;; Use the 'solarized' color theme
       ;; (require 'color-theme)
       (load-theme 'solarized-dark t)
       ;; (setq solarized-termcolors 256)
       (setq solarized-bold t)
       (setq solarized-underline t)
       (setq solarized-italic t)
       ;; Highlight the current text line
       (require 'highlight-current-line)
       (highlight-current-line-on t)        ; Switch highlighting on for the current line
       (highlight-current-line-set-bg-color "#073642")
       (highlight-current-line-minor-mode)
       ;; Enable mouse wheel
       (mwheel-install)
       ;; Disable toolbar
       (tool-bar-mode 0)
       ;; Set default font
       ;; (set-default-font "DejaVu Sans Mono:pixelsize=14:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
       (set-default-font "Monospace:pixelsize=14:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
       ;; (set-default-font "Ubuntu Mono:pixelsize=16:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
       ;; (modify-frame-parameters nil '((wait-for-wm . nil)))
       ;; Resize frame
       (my-resize-frame 60 140)
      ))

; (global-unset-key [up])
; (global-unset-key [down])
; (global-unset-key [left])
; (global-unset-key [right])

;; use M-f and M-b instead
; (global-unset-key [M-left])
; (global-unset-key [M-right])

;; Custom keybindings
(global-set-key "\M-g" 'goto-line)                     ; M-g: goto a line number
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [C-prior] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
(global-set-key [C-next] 'tabbar-forward-tab)
(global-set-key [C-right] 'my-forward-word)            ; C-right moves to *beginning* of next word
; (put 'my-forward-word 'CUA 'move)
(global-set-key [C-left] 'my-backward-word)            ; C-left moves to *beginning* of previous word
; (put 'my-backward-word 'CUA 'move)
(global-set-key "\C-a" 'my-beginning-of-line)          ; Ctrl+a and Home toggle between the start of line and
(global-set-key [home] 'my-beginning-of-line)          ; the first non-space char of line
(put 'my-beginning-of-line 'CUA 'move)
; (global-set-key (kbd "C-c i") 'insert-date-string)   ; C-c i calls insert-date-string
(global-set-key "\C-c\C-h" 'erlang-man-function)       ; map Ctrl-c Ctrl-h to the command that provides the help text for a function
(global-set-key "\C-c\C-z" 'erl-shell-with-flags)      ; map Ctrl-c Ctrl-z to the new function
(global-set-key "\C-c\C-p" 'flymake-goto-prev-error)   ; map Ctrl-c Ctrl-p to the previous error detected by Flymake
(global-set-key "\C-c p" 'flymake-goto-prev-error)     ; map Ctrl-c Ctrl-p to the previous error detected by Flymake
(global-set-key "\C-c\C-n" 'flymake-goto-prev-error)   ; map Ctrl-c Ctrl-p to the previous error detected by Flymake
(global-set-key "\C-c n" 'flymake-goto-prev-error)     ; map Ctrl-c Ctrl-p to the previous error detected by Flymake


;; Indent using spaces instead of tabs
(setq c-mode-hook
    (function (lambda ()
		;; Set the C/C++ style using braces in separate lines
		(c-set-style "stroustrup")
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq objc-mode-hook
      (function (lambda ()
		  ;; Set the C/C++ style using braces in separate lines
		(c-set-style "stroustrup")
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq c++-mode-hook
    (function (lambda ()
		;; Set the C/C++ style using braces in separate lines
                (c-set-style "stroustrup")
		(setq indent-tabs-mode nil)
                (setq c-indent-level 4))))


;; IDO mode for better file open and minibuffer
(require 'ido)
(ido-mode t)

;; Provide some dired goodies and dired-jump at C-x C-j
(load "dired-x")

;; Erlang mode
; (setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.7/emacs" load-path))
(setq erlang-root-dir "/usr/lib/erlang")            ; Set the location of the man page hierarchy
(setq erlang-man-root-dir "/usr/lib/erlang")        ; Set the location of the man page hierarchy
(setq exec-path (cons "/usr/lib/bin" exec-path))    ; Add the home of the Erlang binaries to the exec-path
(require 'erlang-start)                             ; Load and eval the erlang-start package to set up everything else
;; Some Erlang customizations
(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, default in the node name
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "Functions")
          ))

;; File extensions that use the Erlang syntax highlighting rules
(add-to-list 'auto-mode-alist '("\\.app?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.app.src?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.config?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.escript?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\Emakefile" . erlang-mode))

;; Distel
(let ((distel-dir "/usr/local/share/distel/elisp")) ; Add distel-dir to the end of load-path
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
;; (add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)

(require 'erlang-flymake)                           ; Automatic compilation of Erlang code
(erlang-flymake-only-on-save)                       ; Only run flymake after saving a file

;; Wrangler -- disable Distel if you enable it
; (let ((wrangler-dir "/usr/local/lib/erlang/lib/wrangler-1.0/elisp")) ; Add wrangler-dir to the end of load-path
;   (unless (member wrangler-dir load-path)
;     (setq load-path (append load-path (list wrangler-dir)))))
; (require 'wrangler)

;; Ignore compiled Erlang files (*.beam).
(push ".beam" completion-ignored-extensions)
;; Nitrogen
;; (require 'nitrogen-mode)


(defun erl-shell-with-flags (flags)
  "Start an erlang shell with flags"
  (interactive (list (read-string "Flags: ")))
  (set 'inferior-erlang-machine-options (split-string flags))
  (erlang-shell))

;; Move to the beginning of a line
(defun my-boltp ()
  "Return the point of beginning-of-line-text."
  (interactive)
  (save-excursion
    (beginning-of-line-text)
    (point)))

(defun my-beginning-of-line ()
  "Toggle between beginning-of-line and beginning-of-line-text."
  (interactive)
  (let ((b (my-boltp)))
    (if (equal b (point))
        (beginning-of-line)
      (beginning-of-line-text))))

;; Modify the forward-word and backward-word behavior
;; From http://geosoft.no/development/emacs.html
(defun my-forward-word ()
  ;; Move one word forward. Leave the pointer at start of word
  ;; instead of emacs default end of word. Treat _ as part of word
  (interactive)
  (forward-char 1)
  (backward-word 1)
  (forward-word 2)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (forward-char 1) (my-forward-word))
        (t (forward-char 1))))

(defun my-backward-word ()
  ;; Move one word backward. Leave the pointer at start of word
  ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (my-backward-word))
        (t (forward-char 1))))

;;; Use "Ctrl-]" to jump to the matching parenthesis.
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert the character typed."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t                    (self-insert-command (or arg 1))) ))
(global-set-key "\C-]" `goto-match-paren)

;; Convert DOS/Windows (^M) end of line to Unix end of line  (and viceversa)
(defun dos2unix()
  (interactive)
  (goto-char(point-min))
  (while (search-forward "\r" nil t)
    (replace-match "")
    )
  )

(defun unix2dos()
  (interactive)
  (goto-char(point-min))
  (while (search-forward "\n" nil t)
    (replace-match "\r\n")
    )
  )

;; ;; the frame setup for all my computers
;; (defun setup-frame-for (name height width)
;;   (if (equal system-name name)
;;       (progn
;;         (set-frame-height (selected-frame) height)
;;         (set-frame-width (selected-frame) width))))

;; (defun frame-setup (list)
;;   (when window-system
;;     (dolist (conf list)
;;       (setup-frame-for (car conf) (cadr conf) (caddr conf)))))

;; To reload the desktop as it was when we close Emacs the last time
(desktop-load-default)
(desktop-read)

(put 'downcase-region 'disabled nil)

;; To integrate Flymake with rebar; these functions look for th topmost rebar.config
(defun ebm-find-rebar-top-recr (dirname)
  (let* ((project-dir (locate-dominating-file dirname "rebar.config")))
    (if project-dir
        (let* ((parent-dir (file-name-directory (directory-file-name project-dir)))
               (top-project-dir (if (and parent-dir (not (string= parent-dir "/")))
                                    (ebm-find-rebar-top-recr parent-dir)
                                  nil)))
          (if top-project-dir
              top-project-dir
            project-dir))
      project-dir)))

(defun ebm-find-rebar-top ()
  (interactive)
  (let* ((dirname (file-name-directory (buffer-file-name)))
         (project-dir (ebm-find-rebar-top-recr dirname)))
    (if project-dir
        project-dir
      (erlang-flymake-get-app-dir))))

(defun ebm-directory-dirs (dir name)
  "Find all directories in DIR."
  (unless (file-directory-p dir)
    (error "Not a directory `%s'" dir))
  (let ((dir (directory-file-name dir))
        (dirs '())
        (files (directory-files dir nil nil t)))
    (dolist (file files)
      (unless (member file '("." ".."))
        (let ((absolute-path (expand-file-name (concat dir "/" file))))
          (when (file-directory-p absolute-path)
            (if (string= file name)
                (setq dirs (append (cons absolute-path
                                         (ebm-directory-dirs absolute-path name))
                                   dirs))
              (setq dirs (append
                          (ebm-directory-dirs absolute-path name)
                          dirs)))))))
    dirs))

(defun ebm-get-deps-code-path-dirs ()
  (ebm-directory-dirs (ebm-find-rebar-top) "ebin"))

(defun ebm-get-deps-include-dirs ()
  (ebm-directory-dirs (ebm-find-rebar-top) "include"))

(fset 'erlang-flymake-get-code-path-dirs 'ebm-get-deps-code-path-dirs)
(fset 'erlang-flymake-get-include-dirs-function 'ebm-get-deps-include-dirs)
