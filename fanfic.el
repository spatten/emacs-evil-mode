(defun convert-to-fanfic ()
  (interactive)
  (shell-command (format "%s %s" (expand-file-name "~/Dropbox/hermione/conv") (shell-quote-argument (buffer-file-name)))))

(add-hook 'darkroom-mode-hook (lambda () (local-set-key (kbd "C-c f c") 'convert-to-fanfic)))

(defun open-fanfic-html ()
  (interactive)
  (shell-command (format "open output/%s.html" (shell-quote-argument (file-name-base)))))


(add-hook 'darkroom-mode-hook (lambda () (local-set-key (kbd "C-c f o") 'open-fanfic-html)))
