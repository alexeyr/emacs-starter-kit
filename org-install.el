;; This file allows you to install org-mode without "make".
;; Taken from http://orgmode.org/worg/org-hacks.php#compiling-org-without-make

(defvar my/org-lisp-directory "~/.emacs.d/org/lisp"
  "Directory where your org-mode files live.")

(defvar my/org-compile-sources t
  "If `nil', never compile org-sources. `my/compile-org' will only create
the autoloads file `org-install.el' then. If `t', compile the sources, too.")

;; Customize:
(setq my/org-lisp-directory "~/.emacs.d/org/lisp")

;; Customize:
(setq  my/org-compile-sources t)

(defun my/compile-org(&optional directory)
  "Compile all *.el files that come with org-mode."
  (interactive)
  (setq directory (concat
                   (file-truename
                    (or directory my/org-lisp-directory)) "/"))

  (add-to-list 'load-path directory)

  (let ((list-of-org-files (file-expand-wildcards (concat directory "*.el"))))

    ;; create the org-install file
    (require 'autoload)
    (setq esf/org-install-file (concat directory "org-install.el"))
    (find-file esf/org-install-file)
    (erase-buffer)
    (mapc (lambda (x)
            (generate-file-autoloads x))
          list-of-org-files)
    (insert "\n(provide (quote org-install))\n")
    (save-buffer)
    (kill-buffer)
    (byte-compile-file esf/org-install-file t)

    (dolist (f list-of-org-files)
      (if (file-exists-p (concat f "c")) ; delete compiled files
          (delete-file (concat f "c")))
      (if my/org-compile-sources     ; Compile, if `my/org-compile-sources' is t
          (byte-compile-file f)))))

