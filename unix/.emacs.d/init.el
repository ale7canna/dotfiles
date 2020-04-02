(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; install and configure use-package
(unless (package-installed-p 'use-package)
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)
    (package-install 'diminish)))
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
(setq use-package-always-ensure t)

;; appearance
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'deeper-blue)
(set-face-attribute 'default (selected-frame) :height 150)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)

;; libraries
;; ivy
(use-package ivy)
(use-package counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;; projectile
(use-package projectile)
(bind-key "M-p f" 'project-find-file)

;; magit
(use-package magit)

;; switch-window
(use-package switch-window)
(setq switch-window-shortcut-style 'qwerty)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x O") 'switch-window-then-kill-buffer)

;;js2-mode
(use-package js2-mode)
(use-package js2-refactor)
(use-package xref-js2)
(use-package npm-mode)
(setq js2-strict-missing-semi-warning nil)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; which-key
(use-package which-key)
(setq which-key-idle-delay 1.0)
(which-key-mode)

;; ace-jump
(use-package ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-word-mode)

;; undo-tree
(use-package undo-tree)
(global-undo-tree-mode)

;; customization
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

(global-set-key (kbd "C-c l") 'load-file)
(global-set-key (kbd "M-g s") 'magit)
(global-set-key (kbd "M-g b") 'magit-log-buffer-file)
(global-set-key (kbd "C-c d") 'avy-copy-region)
(global-set-key (kbd "C-c r") 'revert-buffer-no-confirm)
(global-set-key (kbd "C-c J") 'vc-git-grep)

;; haskell
(use-package haskell-mode)

;; ag
(use-package ag)

(setq backup-directory-alist `(("." . "~/.saves")))

;; always prefer y-n over yes-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Kill buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; set tabs to 4 spaces
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; save Custom settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
     (load custom-file))

(put 'dired-find-alternate-file 'disabled nil)

(use-package markdown-mode)

(use-package multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package ivy-prescient
  :config
  (ivy-prescient-mode 1))

(use-package avy-zap)
(global-set-key (kbd "M-Z") 'avy-zap-to-char-dwim)
(global-set-key (kbd "M-z") 'avy-zap-up-to-char-dwim)
