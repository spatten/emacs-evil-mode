(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
; (package-initialize)

; (defvar my-packages '(paredit color-theme-solarized ido-ubiquitous smex textmate magit pcre2el rust-mode lorem-ipsum haml-mode ruby-mode flymake-ruby ruby-electric web-mode yaml-mode move-text writeroom-mode ruby-hash-syntax dash rubocop exec-path-from-shell))
(defvar my-packages '(evil evil-escape navigate evil-collection projectile-rails org xclip rubocop ruby-mode flymake-ruby ruby-electric evil-surround markdown-mode move-text darkroom magit web-mode ag ripgrep))

;; TODO

;; To Try


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/custom.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ag xclip writeroom-mode web-mode ruby-end ruby-electric rubocop org-evil navigate move-text markdown-mode magit helm flymake-ruby evil-surround evil-rails evil-org evil-escape evil-collection darkroom))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
