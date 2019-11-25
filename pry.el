(defun binding-pry ()
  "binding pry line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\nrequire 'pry-byebug'; binding.pry")
    (indent-according-to-mode)
    ))

(defun binding-remote-pry ()
  "binding remote_pry line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\nrequire 'pry-byebug'; binding.remote_pry")
    (indent-according-to-mode)
    ))


(defun pry-keybindings ()
  "for use in ruby mode"
  (local-set-key (kbd "C-c C-c p") 'binding-pry)
  (local-set-key (kbd "C-c C-c r") 'binding-remote-pry))

(add-hook 'ruby-mode-hook 'pry-keybindings)

(defun python-debugger ()
  "python debugger line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\nimport pdb; pdb.set_trace()")
    (indent-according-to-mode)
    ))
(defun python-debugger-keybindings ()
  "for use in Python mode"
  (local-set-key (kbd "C-c C-c p") 'python-debugger))
(add-hook 'python-mode-hook 'python-debugger-keybindings)

(defun javascript-debugger ()
  "javascript debugger line"
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\ndebugger")
    (indent-according-to-mode)
    ))
(defun javascript-debugger-keybindings ()
  "for use in Javascript mode"
  (local-set-key (kbd "C-c C-c p") 'javascript-debugger))
(add-hook 'js2-mode-hook 'javascript-debugger-keybindings)
