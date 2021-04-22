(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216 ; 16mb
          gc-cons-percentage 0.1)))
(load "~/.emacs.d/setup.el")
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/config.el")
(load "~/.emacs.d/common.el")
