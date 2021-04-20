(setq ;; Stope emacs from loading packages with package.el. Needed in emacs >= 27
      package-enable-at-startup nil
      straight-check-for-modifications nil
      ;; Some packages break when shallow cloned (like magit and org),
      ;; but we'll deal with that elsewhere.
      straight-vc-git-default-clone-depth 1
      ;; Prefix declarations are unneeded bulk added to our autoloads file. Best
      ;; we don't have to deal with them at all.
      autoload-compute-prefixes nil)


;; Setup for straight.el package management
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
