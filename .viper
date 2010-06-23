(setq viper-vi-state-id (concat (propertize "<V>" 'face 'hi-blue-b) " "))
(setq viper-emacs-state-id (concat (propertize "<E>" 'face 'hi-red-b) " "))
(setq viper-insert-state-id (concat (propertize "<I>" 'face 'hi-blue-b) " "))
(setq viper-replace-state-id (concat (propertize "<R>" 'face 'hi-blue-b) " "))

;; the property `risky-local-variable' is a security measure for mode line
;; variables that have properties.
(put 'viper-mode-string 'risky-local-variable t)
