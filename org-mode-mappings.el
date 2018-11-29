;; Make evil-join work when in a comment block
;; from https://github.com/blaenk/dots/blob/135cf050a28249deb1dc653ef149fb0d7c2c6e1b/emacs/.emacs.d/inits/conf/evil.el#L138-L167
;; linked to from this discussion: https://github.com/emacs-evil/evil/issues/606
  (evil-define-operator my-evil-join (beg end)
    "Join the selected lines."
    :motion evil-line
    (let* ((count (count-lines beg end))
           ;; we join pairs at a time
           (count (if (> count 1) (1- count) count))
           ;; the mark at the middle of the joined pair of lines
           (fixup-mark (make-marker)))
      (dotimes (var count)
        (if (and (bolp) (eolp))
            (join-line 1)
          (let* ((end (line-beginning-position 3))
                 (fill-column (1+ (- end beg))))
            ;; save the mark at the middle of the pair
            (set-marker fixup-mark (line-end-position))
            ;; join it via fill
            (fill-region-as-paragraph beg end)
            ;; jump back to the middle
            (goto-char fixup-mark)
            ;; context-dependent whitespace fixup
            (fixup-whitespace))))
      ;; remove the mark
      (set-marker fixup-mark nil)))
(evil-global-set-key 'normal "J" 'my-evil-join)
;; make S-~ surround with ~~~ in org-mode and Markdown
(add-hook 'markdown-mode-hook (lambda ()
		    (push '(?~ . ("~~~" . "~~~")) evil-surround-pairs-alist)))

(add-hook 'org-mode-hook (lambda ()
                           (push '(?~ . ("#+BEGIN_SRC sh" . "#+END_SRC")) evil-surround-pairs-alist)))
;; In normal mode, H goes to beginning of line, L to end
(evil-global-set-key 'motion' "H" 'evil-first-non-blank)
(evil-global-set-key 'motion' "L" 'evil-end-of-line)

(evil-global-set-key 'normal "gc" 'comment-line)
(evil-global-set-key 'visual "gc" 'comment-dwim)

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

;; alt-o calls insert-line-above-and-below

(defun insert-line-above-and-below ()
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)
    (end-of-line 0)
    (open-line 1)))
(eval-after-load 'evil-maps
  '(progn (define-key evil-normal-state-map (kbd "M-o") 'insert-line-above-and-below)))

;; (eval-after-load "org-mode-map"
;;   (define-key evil-normal-state-map "\C-k" nil))

(eval-after-load "org-mode-map"
  (define-key evil-motion-state-map "\C-k" nil))
;; (define-key org-mode-map (kbd "C-k") nil)
;; (define-key org-mode-map (kbd "C-j") nil)
;; ;; (with-eval-after-load 'org (define-key evil-normal-state-map (kbd "C-k") nil))
;; I'm overriding C-h to move to a different window or buffer, so make C-c C-h do it instead
(global-set-key (kbd "C-c C-h") 'help-command)
(global-set-key (kbd "C-x C-h") 'help-command)

(global-unset-key (kbd "C-h"))
(global-unset-key (kbd "C-k"))
(global-unset-key (kbd "C-l"))
(global-unset-key (kbd "C-j"))
