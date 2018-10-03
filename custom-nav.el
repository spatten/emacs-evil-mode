(defun open-leanpub ()
  (interactive)
  (find-file (expand-file-name "~/ruboss/leanpub/lpub/Gemfile")))
(defun open-overmind ()
  (interactive)
  (find-file (expand-file-name "~/ruboss/leanpub/overmind/run_ansible.sh")))
(global-set-key (kbd "C-c l") 'open-leanpub)
(global-set-key (kbd "C-c o") 'open-overmind)
