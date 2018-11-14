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
