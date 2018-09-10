;; Always able to answer 'y' instead of 'yes'
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-log-done t)

(global-set-key "\C-cv" 'revert-buffer)
(global-set-key (kbd "C-x g") 'magit-status)

(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "jk")
(setq evil-want-C-i-jump nil) ;; makes tab work in org mode
(setq evil-collection-outline-bind-tab-p nil) ;; don't set shift-tab to show-all in orgmode
(setq evil-want-integration nil)
(require 'evil)
(evil-mode 1)

(evil-escape-mode 1)
(evil-collection-init)

;; (require 'evil-org)
;; (add-hook 'org-mode-hook 'evil-org-mode)
;; (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
;; (require 'evil-org-agenda)
;; (evil-org-agenda-set-keys)

(add-hook 'markdown-mode-hook 'darkroom-mode)

(require 'evil-surround)
(global-evil-surround-mode 1)

;; In normal mode, H goes to beginning of line, L to end
(evil-global-set-key 'motion' "H" 'evil-first-non-blank)
(evil-global-set-key 'motion' "L" 'evil-end-of-line)

(evil-global-set-key 'motion "L" 'evil-end-of-line)
(evil-define-key 'normal evil-org-mode-map
  (kbd "C-l") nil
  (kbd "C-h") nil
  (kbd "C-k") nil
  (kbd "C-j") nil)

;; Make C-j and C-k do the tmux thing in org mode and outline mode
(evil-define-key 'normal outline-mode-map
  (kbd "C-j") nil
  (kbd "C-k") nil)

(eval-after-load "org-mode-map"
  (define-key evil-normal-state-map "\C-k" nil))

(eval-after-load "org-mode-map"
  (define-key evil-motion-state-map "\C-k" nil))
(define-key org-mode-map (kbd "C-k") nil)
(define-key org-mode-map (kbd "C-j") nil)
;; (with-eval-after-load 'org (define-key evil-normal-state-map (kbd "C-k") nil))
;; I'm overriding C-h to move to a different window or buffer, so make C-c C-h do it instead
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key (kbd "C-x C-h") 'help-command)

(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-l"))
(global-unset-key (kbd "C-j"))

(require 'navigate)
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


;; type C-\ to go into "latin-postfix" mode. This allows you to type a" and get ä or a` => à or a' => á. C-\ to get back out
(setq default-input-method 'latin-postfix)

;; bindings for the move-text package
;; these two lines are necessary before defining meta-down or meta-up
;; https://stackoverflow.com/questions/4351044/binding-m-up-m-down-in-emacs-23-1-1
;; (define-key input-decode-map "\e\eOA" [(meta up)])
;; (define-key input-decode-map "\e\eOB" [(meta down)])
;; (global-set-key [(meta up)] 'move-text-up)
;; (global-set-key [(meta down)] 'move-text-down)
;; (global-set-key (kbd "<M-up>") 'move-text-up)
;; (global-set-key (kbd "<M-down>") 'move-text-down)

;; I think only these last two are actually required
(global-set-key (kbd "ESC <up>") 'move-text-up)
(global-set-key (kbd "ESC <down>") 'move-text-down)

(load (concat user-emacs-directory "work-logs.el"))
(load (concat user-emacs-directory "fanfic.el"))

;; make sentence motion work with single-space sentences
(setf sentence-end-double-space nil)

;; brew install aspell first
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_GB"))
;; Use M-$ to spell-check a word

(require 'darkroom)
;; (add-hook 'darkroom-mode-hook (lambda () (make-variable-buffer-local 'default-input-method) (setq default-input-method 'latin-postfix)))
;; (add-hook 'darkroom-mode-hook 'flyspell-mode)

(global-set-key (kbd "M-=") 'count-words)

;; web-mode setup
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
