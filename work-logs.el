(defun open-latest-log ()
  (interactive)
  (let ((latest-log (car (reverse (directory-files "~/Dropbox/work-logs" nil "^[0-9][0-9][0-9][0-9]\-[0-9][0-9]\-[0-9][0-9]\.org$")))))
    (find-file (expand-file-name (concat "~/Dropbox/work-logs/" latest-log)))))

(defun start-new-log ()
  (interactive)
  (let ((daily-name (format-time-string "%Y-%m-%d")))
    (find-file (expand-file-name (concat "~/Dropbox/work-logs/" daily-name ".org")))))

(global-set-key (kbd "C-c w") 'open-latest-log)
(global-set-key (kbd "C-c n") 'start-new-log)
