;; Some basic stuff
(setq inhibit-splash-screen t ;; No default splash screen
      inhibit-startup-message t ;; No default startup message
      )

(tool-bar-mode -1) ;; Don't show the toolbar
(scroll-bar-mode -1) ;; Don't show the scroll bar

;; Replace the startup message with logging the initialization time
(defun display-startup-echo-area-message ()
  (message (concat "Init time: " (emacs-init-time))))

;; Evil mode
(setq evil-want-keybinding nil
      evil-undo-system 'undo-fu)
(evil-mode 1)
(evil-collection-init) ;; Break this out into specific onloads later if necessary


;; Load a default theme
(load-theme 'doom-gruvbox-light t)

;; Ivy
(use-package ivy
	     :init
	     (ivy-mode)
	     :config
	     (setq ivy-use-virtual-buffers t)
	     (setq enable-recursive-minibuffers t))

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
	      ("C-h f"  .  counsel-describe-function)
	      ("C-h v"  .  counsel-describe-variable)
	      ("<f1> l"  . counsel-find-library)
	      ("<f2> i"  . counsel-info-lookup-symbol)
	      ("<f2> u"  . counsel-unicode-char)
	      ("C-c C-r" . ivy-resume)))     ; Resume last Ivy-based completion

