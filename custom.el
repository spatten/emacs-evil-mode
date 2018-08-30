;; Always able to answer 'y' instead of 'yes'
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(define-key org-mode-map (kbd "backtab") 'org-global-cycle)

(setq-default evil-escape-key-sequence "jk")
(setq evil-want-C-i-jump nil) ;; makes tab work in org mode
(setq evil-collection-outline-bind-tab-p nil) ;; don't set shift-tab to show-all in orgmode
(setq evil-want-integration nil)
(require 'navigate)
(require 'evil)
(evil-mode 1)

(evil-escape-mode 1)
(evil-collection-init)
(evil-define-key 'normal org-mode-map (kbd "<S-tab>") #'org-global-cycle)

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'projectile-rails)
(projectile-rails-global-mode)

;; line-wrapping everywhere
(global-visual-line-mode t)

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; rubocop
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; Use OS X copy/paste buffers
(xclip-mode 1)

;; turn off beeping
(setq ring-bell-function 'ignore)
;; Make backup (foo~) files in ~/.emacs-saves
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
;; Slow but safe
(setq backup-by-copying t)
;; keep more than one backup of each file
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; turn off icons and menu at the top of the window
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

;; enable electric-pair-mode in all buffers, and
;; turn on pairing for double-quotes and back-ticks
;; to turn on single-quotes, add this line:
;; (?\"' . ?\')
(electric-pair-mode t)
(setq electric-pair-pairs '(
                            (?` . ?`)
                            (?\" . ?\")
                            ) )

(require 'evil-surround)
(global-evil-surround-mode 1)

(evil-global-set-key 'motion' "H" 'evil-beginning-of-line)
(evil-global-set-key 'motion' "L" 'evil-end-of-line)
(global-set-key [f1] 'help-command)
(global-set-key (kbd "C-x C-h") 'help-command)
