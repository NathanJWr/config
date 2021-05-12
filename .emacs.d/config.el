;; Some basic stuff
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq inhibit-splash-screen t    ;; No default splash screen
      inhibit-startup-message t) ;; No default startup message

(tool-bar-mode -1)   ;; Don't show the toolbar
(scroll-bar-mode -1) ;; Don't show the scroll bar

;; Set fonts
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 150)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono" :height 150) ;; Set the monospace font
(set-face-attribute 'variable-pitch nil :family "Spectral" :height 180)      ;; Set the serif font


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

(use-package centaur-tabs
  :demand ;; Load this package at startup
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
