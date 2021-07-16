(mapcar 'straight-use-package
	'(
	  ;; Good package of themes
	  (doom-themes
	   :type git
	   :host github)


	  ;; Make the modeline pretty
	  (doom-modeline
	   :type git
	   :host github)

	  ;; Profile startup times
	  (esup
	   :type git
	   :host github)

	  ;; Center text in writing modes
	  (olivetti
	   :type git
	   :host github)

	  ;; Better completion framework, search, etc.
	  (ivy
	   :type git
	   :host github)

	  (counsel
	   :type git
	   :host github)

	  ;; Better package configuration
	  (use-package
	    :type git
	    :host github)

	  ;; The best git frontend
	  (magit
	   :type git
	   :host github)

	  ;; Better editing for .js and .jsx files
	  (web-mode
	   :type git
	   :host github)

	  ;; tab bar like in vscode
	  (centaur-tabs
	   :type git
	   :host github)

	  ;; Project management
	  (projectile
	   :type git
	   :host github)

	  ;; Easier hunt and pecking for command key-combos
	  (which-key
	   :type git
	   :host github)

	  ;; Format c/c++
	  (clang-format)

	  (olivetti
	   :type git
	   :host github)

	  (php-mode
	   :type git
	   :host github)))
