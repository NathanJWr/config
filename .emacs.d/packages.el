(mapcar 'straight-use-package
	'(
	  ;; Evil mode! Vim keybindings
	  (evil :type git :host github :commit 1b3db6349d04adfc68f707b0edd800f5ab3cb374)

	  ;; Undo package used for evil mode's C-r (redo)
	  (undo-fu :type git :host gitlab :commit e0ad06b5)

	  ;; Evil bindings for a larger subset of applications like the calendar
	  (evil-collection :type git :host github :commit b6025cf)

	  ;; Good package of themes
	  (doom-themes :type git :host github :commit 4199e74db170200995ee8dfbb55ffae004d6e219)

	  ;; Profile startup times
	  (esup :type git :host github :commit fa1413737b8d5173a4db8c18d8de9ac798365d53)

	  ;; Center text in writing modes
	  (olivetti :type git :host github :commit 61d26644fd9dd2d45b80b9b82f5f930ed17530d0)
	  )
	)
