(defun clean-up-filename (filename)
  "Replaces nasty spaces and downcases all letters in a string"
  (require 's)
  (let ((new-filename filename))
    (setq new-filename (s-downcase new-filename))
    (setq new-filename (s-replace " " "_" new-filename))
    (setq new-filename (s-replace "’" "" new-filename))
    (setq new-filename (s-replace "“" "" new-filename))
    (setq new-filename (s-replace "”" "" new-filename))
    (rename-file filename new-filename)))

(defun my-dired-clean-filename (&optional arg)
  "Helper function used to call clean-up-filename from dired"
  (interactive "P")
  (dolist (file  (dired-get-marked-files nil arg))
    (clean-up-filename file))
  (revert-buffer))

(require 'dired)
(define-key dired-mode-map (kbd "C-c r") 'my-dired-clean-filename)
