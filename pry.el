(defun binding-pry ()
  "binding pry line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\nrequire 'pry'; binding.pry")
    (indent-according-to-mode)
    ))

(defun binding-remote-pry ()
  "binding remote_pry line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\nrequire 'pry'; binding.remote_pry")
    (indent-according-to-mode)
    ))


(defun pry-keybindings ()
  "for use in ruby mode"
  (local-set-key (kbd "C-c C-c p") 'binding-pry)
  (local-set-key (kbd "C-c C-c r") 'binding-remote-pry))

(add-hook 'ruby-mode-hook 'pry-keybindings)
