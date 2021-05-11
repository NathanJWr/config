;; Some basic stuff
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq inhibit-splash-screen t    ;; No default splash screen
      inhibit-startup-message t) ;; No default startup message

(tool-bar-mode -1)   ;; Don't show the toolbar
(scroll-bar-mode -1) ;; Don't show the scroll bar

(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 150)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono" :height 150)
(set-face-attribute 'variable-pitch nil :family "Spectral" :height 180)


;; Replace the startup message with logging the initialization time
(defun display-startup-echo-area-message ()
  (message (concat "Init time: " (emacs-init-time))))

;; Load up gpg credentials for file decrypting/encrypting when
;; the extension is '.gpg'
(require 'epa-file)
(epa-file-enable)
(setf epa-pinentry-mode 'loopback)
(setf epa-file-encrypt-to '("nathan@nathanielwright.xyz"))
(make-variable-buffer-local 'epa-file-encrypt-to)

;; Put all backup files in one place
(setq backup-directory-alist `(("." . "~/.saves")))
;; Always make backup files by copying
(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6 ;; Keep 6 new versions when a new numbered backup is made
      kept-old-versions 2 ;; Keep 2 old versions when a new numbered backup is made
      version-control t)  ;; Make numeric backup versions

;; Load a default theme
(load-theme 'doom-gruvbox-light t)

;; Set up vim-like keybindings. We need to set evil-want-keybinding to
;; nil for evil-collection integration. We also want to set the undo
;; system so that u and r in normal mode actually do someting.
;; (use-package evil
;;   :init
;;   (setq evil-want-keybinding nil
;; 	evil-undo-system 'undo-fu)
;;   :config
;;   (evil-mode 1))

;; ;; For now we're just initializing the whole of evil-collection for
;; ;; better vim integration with the rest of emacs.
;; (use-package evil-collection
;;   :init
;;   (evil-collection-init))

;; Ivy completion framework
(use-package ivy
  :init
  (ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;; Replace a lot of the default bindings with counsel specific
;; commands. With this we get completion buffers on basic stuff like
;; find-file which is awesome!
(use-package counsel
  :bind* ; load when pressed
  (("M-x"     . counsel-M-x)
   ("C-s"     . swiper)
   ("C-x C-f" . counsel-find-file)
   ("C-x C-r" . counsel-recentf)  ; search for recently edited
   ("C-c g"   . counsel-git)      ; search for files in git repo
   ("C-c j"   . counsel-git-grep) ; search for regexp in git repo
   ("C-c /"   . counsel-ag)       ; Use ag for regexp
   ("C-x l"   . counsel-locate)
   ("C-x C-f" . counsel-find-file)
   ("C-h f"   . counsel-describe-function)
   ("C-h v"   . counsel-describe-variable)
   ("<f1> l"  . counsel-find-library)
   ("<f2> i"  . counsel-info-lookup-symbol)
   ("<f2> u"  . counsel-unicode-char)
   ("C-c C-r" . ivy-resume)))     ; Resume last Ivy-based completion

(defun my-prog-mode-config ()
  (setq show-trailing-whitespace t)
  (display-line-numbers-mode))
(add-hook 'prog-mode-hook #'my-prog-mode-config)

(use-package org
  :defer t
  :config
  (set-face-attribute 'org-headline-done nil :strike-through t)
  (setq org-startup-with-inline-images t))

(use-package web-mode
  :mode "\\.jsx?$"
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (setq web-mode-markup-indent-offset 4))

(use-package ispell
  :config
  (setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
  (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))
