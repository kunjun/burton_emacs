;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq load-start     (time-to-seconds))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;location of additional packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq burton-emacs-path "~/burton_emacs")  ;;设置 burton-emacs-path 的路径
(setq extend-lisp-path (concat burton-emacs-path "/extend-lisp")) ;;  设置路径， concat 为连接意思
(setq extend-lisp-subdirs-file (concat extend-lisp-path "/subdirs.el"))
(load extend-lisp-subdirs-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;load all my settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq burton-lisp-path (concat burton-emacs-path "/burton-lisp"))
(setq burton-lisp-path-files (mapc 'load (directory-files burton-lisp-path t "^[a-zA-Z0-9]*?-.*?\.el$")))

(setq load-stop     (time-to-seconds))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;输出加载时间
(add-hook 'emacs-startup-hook 
			'(lambda ()
			   (message "load %d elisp file , spend %g seconds ; startup spend %g seconds" 
						(length burton-lisp-path-files) 
						(- load-stop load-start) 
						(- (time-to-seconds) load-start))))
