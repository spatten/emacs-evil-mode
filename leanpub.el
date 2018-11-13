;; Make M-r j search for jobs/<stuff you type>_job.rb
(defun projectile-rails-find-job ()
  "Find a job."
  (interactive)
  (projectile-rails-find-resource
   "job: "
   '(("jobs/" "\\(.+?\\)\\(_job\\)?\\.rb$"))
   "jobs/${filename}_job.rb"))

(define-key projectile-rails-command-map (kbd "j") 'projectile-rails-find-job)
