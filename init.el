(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
; (package-initialize)

; (defvar my-packages '(paredit ido-ubiquitous smex textmate magit pcre2el rust-mode lorem-ipsum haml-mode ruby-mode flymake-ruby ruby-electric web-mode yaml-mode move-text writeroom-mode ruby-hash-syntax dash rubocop exec-path-from-shell))
(defvar my-packages '(use-package add-node-modules-path evil evil-collection projectile-rails org evil-org xclip rubocop ruby-mode flymake-ruby ruby-electric inf-ruby ruby-hash-syntax evil-surround markdown-mode move-text darkroom magit web-mode ag yaml-mode ripgrep lorem-ipsum haml-mode flycheck coffee-mode rjsx-mode exec-path-from-shell evil-matchit vimish-fold systemd ruby-end rspec-mode graphql-mode typescript-mode tide company go-mode go-rename haskell-mode lsp-mode lsp-ui yasnippet rust-mode flycheck-rust projectile projectile-ripgrep))

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
 '(flycheck-checker-error-threshold 1000)
 '(package-selected-packages
   '(projectile-ripgrep ivy rust-mode lsp-ui add-node-modules-path go-mode typescript-mode color-theme-sanityinc-solarized ag xclip writeroom-mode web-mode ruby-end ruby-electric rubocop org-evil move-text markdown-mode magit helm flymake-ruby evil-surround evil-rails evil-org evil-escape evil-collection darkroom evil-escape))
 '(safe-local-variable-values
   '((eval progn
           (add-to-list 'exec-path
                        (concat
                         (locate-dominating-file default-directory ".dir-locals.el")
                         "app/client/node_modules/.bin/"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-todo ((t (:background nil :foreground "red" :weight bold)))))
