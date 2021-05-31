(mapcar 'straight-use-package
	'(
	  ;; Good package of themes
	  (doom-themes :type git :host github :commit 4199e74db170200995ee8dfbb55ffae004d6e219)

	  ;; Profile startup times
	  (esup :type git :host github :commit fa1413737b8d5173a4db8c18d8de9ac798365d53)

	  ;; Center text in writing modes
	  (olivetti :type git :host github :commit 61d26644fd9dd2d45b80b9b82f5f930ed17530d0)

	  ;; Better completion framework, search, etc.
	  (ivy :type git :host github :commit 471d644d6bdd7d5dc6ca4efb405e6a6389dff245)

	  (counsel :type git :host github :commit 471d644d6bdd7d5dc6ca4efb405e6a6389dff245)

	  ;; Better package configuration
	  (use-package :type git :host github :commit 560ea32eaf1e16ac5d673496e5d52d63dfeec23a)

	  ;; The best git frontend
	  (magit :type git :host github :commit c7364e169648f454dc73fe50596d827fbf1f0fb7)

	  ;; Better editing for .js and .jsx files
	  (web-mode :type git :host github :commit 8ef47935d638902ba35a557cae5edd6ab6ab1346)

	  ;; tab bar
	  (centaur-tabs :type git :host github :commit 9c7c936e4e1de6f4f4095d70e43c9ae738d05086)

	  ;; Project management
	  (projectile :type git :host github :commit 4126799d94b6a9a4db22976d2dd6625323221359)

	  ;; Easier hunt and pecking for command key-combos
	  (which-key :type git :host github :commit 5fb30301cb3b4fca5a0e1ce8ec1ef59290b79199)

	  ;; Format c/c++
	  (clang-format)
	  )
	)
