
;; [[file:~/.emacs.d/starter-kit.org::*Load%20path%20etc][starter-kit-load-paths]]
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit/jabber"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))
;; starter-kit-load-paths ends here

;; [[file:~/.emacs.d/starter-kit.org::*Ubiquitous%20Packages][starter-kit-load-on-startup]]
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
;; starter-kit-load-on-startup ends here

;; [[file:~/.emacs.d/starter-kit.org::*Emacs%2022%20Backport][starter-kit-emacs-22-helper]]
(require 'dominating-file)
;; starter-kit-emacs-22-helper ends here

;; [[file:~/.emacs.d/starter-kit.org::*Function%20for%20loading%20starter%20kit][starter-kit-load]]
(defun starter-kit-load (file)
  "This function is to be used to load starter-kit-*.org files."
  (org-babel-load-file (expand-file-name file
                                         dotfiles-dir)))
;; starter-kit-load ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20Kit%20aspell][block-10]]
(starter-kit-load "starter-kit-aspell.org")
;; block-10 ends here

;; [[file:~/.emacs.d/starter-kit.org::*ELPA%20Emacs%20Lisp%20Package%20Manager][starter-kit-elpa]]
(require 'package)
(package-initialize)
(starter-kit-load "starter-kit-elpa.org")
;; starter-kit-elpa ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20Kit%20Customizations][starter-kit-customizations]]
(load custom-file 'noerror)
;; starter-kit-customizations ends here

;; [[file:~/.emacs.d/starter-kit.org::*Work%20around%20OS%20X%20bug][starter-kit-osX-workaround]]
(if (eq system-type 'darwin)
    (setq system-name (car (split-string system-name "\\."))))
;; starter-kit-osX-workaround ends here

;; [[file:~/.emacs.d/starter-kit.org::*System%20User%20specific%20customizations][starter-kit-user/system-setup]]
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      system-specific-literate-config (concat dotfiles-dir system-name ".org")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-literate-config (concat dotfiles-dir user-login-name ".org")
      user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path user-specific-dir)
;; starter-kit-user/system-setup ends here

;; [[file:~/.emacs.d/starter-kit.org::*System%20User%20specific%20customizations][starter-kit-load-elisp-dir]]
(setq elisp-source-dir (concat dotfiles-dir "src"))
(add-to-list 'load-path elisp-source-dir)
;; starter-kit-load-elisp-dir ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20defuns][block-16]]
(starter-kit-load "starter-kit-defuns.org")
;; block-16 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20bindings][block-17]]
(starter-kit-load "starter-kit-bindings.org")
;; block-17 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20misc][block-18]]
(starter-kit-load "starter-kit-misc.org")
;; block-18 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20registers][block-19]]
(starter-kit-load "starter-kit-registers.org")
;; block-19 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20yasnippet][block-20]]
(add-to-list 'load-path
             (expand-file-name  "yasnippet"
                                (expand-file-name "src"
                                                  dotfiles-dir)))
(require 'yasnippet)
(yas/initialize)
;; block-20 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20yasnippet][block-21]]
(yas/load-directory (expand-file-name "snippets" dotfiles-dir))
;; block-21 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20Org%20mode][block-22]]
(starter-kit-load "starter-kit-org.org")
;; block-22 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20eshell][block-23]]
(starter-kit-load "starter-kit-eshell.org")
;; block-23 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20lisp][block-24]]
(starter-kit-load "starter-kit-lisp.org")
;; block-24 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20Haskell][block-25]]
(starter-kit-load "starter-kit-haskell.org")
;; block-25 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20ruby][block-26]]
(starter-kit-load "starter-kit-ruby.org")
;; block-26 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20kit%20JS][block-27]]
(starter-kit-load "starter-kit-js.org")
;; block-27 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20Kit%20Perl][block-28]]
(starter-kit-load "starter-kit-perl.org")
;; block-28 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Starter%20Kit%20Latex][block-29]]
(starter-kit-load "starter-kit-latex.org")
;; block-29 ends here

;; [[file:~/.emacs.d/starter-kit.org::*Load%20User%20System%20Specific%20Files][starter-kit-load-files]]
(if (file-exists-p elisp-source-dir)
    (let ((default-directory elisp-source-dir))
      (normal-top-level-add-subdirs-to-load-path)))
(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p system-specific-literate-config)
    (org-babel-load-file system-specific-literate-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-literate-config)
    (org-babel-load-file user-specific-literate-config))
(when (file-exists-p user-specific-dir)
  (let ((default-directory user-specific-dir))
    (mapc #'load (directory-files user-specific-dir nil ".*el$"))
    (mapc #'org-babel-load-file (directory-files user-specific-dir nil ".*org$"))))
;; starter-kit-load-files ends here
