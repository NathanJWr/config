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
