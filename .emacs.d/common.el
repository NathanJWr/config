;; https://orgmode.org/worg/org-hacks.html
(defun org-back-to-top-level-heading ()
  "Go back to the current top level heading."
  (interactive)
  (or (re-search-backward "^\* " nil t)
      (goto-char (point-min))))

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat buffer-file-name
                  "/img/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (call-process "screencapture" nil nil nil "-i" filename)
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images))

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
