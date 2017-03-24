(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; Disable startup message
(setq inhibit-startup-message t)

;; Set Monday as the first day of week
(setq calendar-week-start-day 1)

;; Full name of file in frame title
(setq frame-title-format "%f")

;; Interact with OS clipboard
(setq x-select-enable-clepboard t)

;; Turn off scrollbar, toolbar and menubar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Turn on column number mode
(column-number-mode t)

;; Highlight brackets
(show-paren-mode t)

;; Run emacs as server
(server-start)

(desktop-save-mode 1)

(global-set-key [C-tab] 'other-window)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq transient-mark-mode nil)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-defun  'disabled nil)

(put 'set-goal-column 'disabled nil)

(setq set-mark-command-repeat-pop t)
(setq kill-do-not-save-duplicates t)

(blink-cursor-mode -1)

(defun latex-mode-hook-functions ()
  (set-fill-column 80)
  (auto-fill-mode)
  (flyspell-mode))
(add-hook 'latex-mode-hook 'latex-mode-hook-functions)

(package-initialize)
(set-fringe-style '(0 . 5))

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(elpy-enable)
(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(setq org-agenda-files (quote ("~/org/")))
(defun org-mode-hook-functions ()
  (define-key org-mode-map [(control tab)] 'other-window)
  (set-fill-column 80)
  (auto-fill-mode)
  (toggle-truncate-lines nil)
  (flyspell-mode))

(add-hook 'org-mode-hook 'org-mode-hook-functions)

(require 'dired-quick-sort)
(dired-quick-sort-setup)

(setq default-input-method "ukrainian-computer")
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map (kbd "s-n s-n") 'org-capture)

(defun python-mode-hook-functions ()
  (set-fill-column 80)
  (fci-mode t)
  )
(add-hook 'python-mode-hook 'python-mode-hook-functions)
