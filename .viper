(setq viper-toggle-key "\C-q")
(setq viper-ex-style-motion nil)
(setq viper-vi-style-in-minibuffer nil)
(viper-buffer-search-enable)

(setq viper-vi-state-id (propertize "<V>" 'face '(:foreground "green")))
(setq viper-emacs-state-id (propertize "<E>" 'face '(:foreground "red")))
(setq viper-insert-state-id (propertize "<I>" 'face '(:foreground "blue")))
(setq viper-replace-state-id (propertize "<R>" 'face '(:foreground "blue")))

;; the property `risky-local-variable' is a security measure for mode line
;; variables that have properties.
(put 'viper-mode-string 'risky-local-variable t)

;; (define-key viper-vi-global-user-map "\C-z" 'undo) ;; doesn't work

(setq viper-re-search nil) ; don't touch or else...
