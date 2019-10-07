(defun define-str ()
  "define string option"
  (interactive)
  (let ((var-name (read-from-minibuffer "Name:")))
    (insert (format "define(:%s, String, nil, '%s')" var-name var-name))
    (indent-according-to-mode)
    ))

(defun define-boolean ()
  "define boolean option"
  (interactive)
  (let ((var-name (read-from-minibuffer "Name:")))
    (insert (format "define(:%s, Boolean, false, '%s')" var-name var-name))
    (indent-according-to-mode)
    ))

(defun define-int ()
  "define integer option"
  (interactive)
  (let ((var-name (read-from-minibuffer "Name:")))
    (insert (format "define(:%s, Integer, 0, '%s')" var-name var-name))
    (indent-according-to-mode)
    ))

(defun define-float ()
  "define float option"
  (interactive)
  (let ((var-name (read-from-minibuffer "Name:")))
    (insert (format "define(:%s, Float, 0, '%s')" var-name var-name))
    (indent-according-to-mode)
    ))

(global-set-key (kbd "C-c C-c s") 'define-str)
(global-set-key (kbd "C-c C-c i") 'define-int)
(global-set-key (kbd "C-c C-c b") 'define-boolean)
(global-set-key (kbd "C-c C-c f") 'define-float)
