(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
; (package-initialize)

; (defvar my-packages '(paredit color-theme-solarized ido-ubiquitous smex textmate magit pcre2el rust-mode lorem-ipsum haml-mode ruby-mode flymake-ruby ruby-electric web-mode yaml-mode move-text writeroom-mode ruby-hash-syntax dash rubocop exec-path-from-shell))
(defvar my-packages '(use-package evil color-theme-solarized navigate evil-collection projectile-rails org xclip rubocop ruby-mode flymake-ruby ruby-electric inf-ruby ruby-hash-syntax evil-surround markdown-mode move-text darkroom magit web-mode ag yaml-mode ripgrep lorem-ipsum haml-mode flycheck coffee-mode rjsx-mode exec-path-from-shell ruby-block evil-matchit vimish-fold systemd ruby-end rspec-mode graphql-mode))

;; TODO

;; To Try
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/custom.el")))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized ag xclip writeroom-mode web-mode ruby-end ruby-electric rubocop org-evil navigate move-text markdown-mode magit helm flymake-ruby evil-surround evil-rails evil-org evil-escape evil-collection darkroom evil-escape)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "app/client/node_modules/.bin/")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-todo ((t (:background nil :foreground "red" :weight bold)))))
