;;; Emacs for the jaded vimmer
;;
;; Author: Henrik Lissner <henrik@lissner>
;; URL: https://github.com/hlissner/emacs.d
;;
;;; Description:
;;
;; My emacs.d, which sets out to rustle emacs users' jimmies by making
;; emacs as vim-like as possible.
;;
;; Naming conventions:
;;    * my--<defun-name>  ; interal defuns, meant for use via elisp
;;    * my-<defun-name>   ; interactive command, can be used via M-x
;;    * my.<defun-name>   ; commands with buffer side-effects (for keybinds)
;;    * my:<defun-name>   ; defuns meant to be used from Ex mode
;;    * *<defun/var-name> ; for altering the visual state
;;
;;; Code:

(defconst DEBUG-MODE nil)

(defconst my-dir           user-emacs-directory)
(defconst my-core-dir      (concat my-dir "core/"))
(defconst my-modules-dir   (concat my-dir "init/"))
(defconst my-elisp-dir     (concat my-dir "elisp/"))
(defconst my-themes-dir    (concat my-dir "themes/"))
(defconst my-snippets-dir  (concat my-dir "snippets/"))
(defconst my-tmp-dir       (concat my-dir ".cache/"))

(defconst *dark-theme   'v0)
(defconst *light-theme  'github) ; wtb better light theme...

(defconst *fonts `(("Terminus (TTF)" 12 nil 0.1)
                   ("Ubuntu Mono" 16 t 0)
                   ("Inconsolata" 22 t 0)))

(add-to-list 'load-path my-core-dir)
(add-to-list 'load-path my-modules-dir)
(add-to-list 'load-path my-elisp-dir)

;; Add elisp dirs to load-path
(let ((default-directory my-elisp-dir))
  (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Just the... bear necessities...
(mapc 'require
      ;; ls init/{init,my}* | xargs basename | sed -e 's/\..*$//'
      '(core

        ;; init-auto-complete
        init-auto-insert       ; for the lazy typis
        init-company           ; see above
        init-cc                ; C/C++/Obj-C madness
        ;; init-d              ; D - It's C, but better!
        ;; init-cscope
        init-csharp
        init-dev               ; general dev tools/settings
        init-lisp              ; all things lisp; elisp, clojure
        ;; init-erlang
        ;; init-eshell
        ;; init-floobits       ; when I'm feeling lonely
        init-fly               ; fly(check|spell)
        init-git               ; git-gutter + modes
        ;; init-go
        init-helm              ; a search engine for your life
        init-ido               ; a search engine for your car keys
        init-java              ; the poster child for carpal tunnel syndome
        init-js                ; alert("not java, javascript!")
        init-lua               ; zero-based indices? Zero-based indices.
        init-org               ; for fearless leader (who is organized)
        init-php               ; making php less painful to work with
        init-project           ; project tools - dired, perspective, neotree
        init-projectile        ; when you forget where you put your house
        init-python            ; beautiful is better than ugly
        init-regex             ; /^[^\s](meaning)[^\n]*/
        init-ruby              ; <3
        init-scss              ; @include magic;
        init-smalltalk         ; nice weather we're having
        init-sh                ; #!/bin/bash_your_head_in
        init-swift             ; yay, emoji variables!
        init-text              ; I got nothing...
        init-tmux
        ;; init-rust
        ;; init-vala
        init-web
        init-yasnippet         ; type for me

        my-bindings
        my-settings
        ))

;; I've created a monster!
