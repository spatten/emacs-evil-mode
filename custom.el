;; Always able to answer 'y' instead of 'yes'
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default evil-escape-key-sequence "jk")

(require 'evil)
(evil-mode 1)
(evil-escape-mode 1)
