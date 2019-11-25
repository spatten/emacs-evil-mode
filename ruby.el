;; takes the current region, makes newlines after every comma and then re-indents.
;; The reverse is done by S-j on a selected region.
(defun split-on-commas (beg end)
  "splits the current region on commas"
  (interactive "r")
  (setq current-region-string (buffer-substring-no-properties beg end))
  (save-excursion
    (delete-region beg end)
    (insert (mapconcat 'identity
                       (split-string current-region-string ", ") ",\n")))
  (evil-indent beg end))

(defun split-on-spaces (beg end)
  "splits the current region on spaces"
  (interactive "r")
  (setq current-region-string (buffer-substring-no-properties beg end))
  (save-excursion
    (delete-region beg end)
    (insert (mapconcat 'identity
                       (split-string current-region-string " ") "\n")))
  (evil-indent beg end))

(defun frozen-string-comment ()
  "makes a frozen_string_literal: true comment"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (insert "# frozen_string_literal: true\n\n"))
  )


(defun ruby-keybindings ()
  "for use in ruby mode"
  (local-set-key (kbd "C-c C-c f") 'frozen-string-comment))

(add-hook 'ruby-mode-hook 'ruby-keybindings)

;; send selected text to your Rails console
(evil-global-set-key 'visual "gr" 'ruby-send-region)
(evil-global-set-key 'visual "gR" 'ruby-send-region-and-go)
(evil-global-set-key 'normal "gr" 'ruby-send-line)
(evil-global-set-key 'normal "gR" 'ruby-send-line-and-go)
