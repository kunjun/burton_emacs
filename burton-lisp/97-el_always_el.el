;; -*- 一些自己各种搜到来的代码，很重要的才放里面 -*-

;;下面函数来进行加载并且绑定到C-x f5:
(defun update-emacs-configuration ()
(interactive)
(save-excursion
(load-file "~/.emacs")
)
)
(global-set-key (kbd "C-x <f5>") 'update-emacs-configuration)

;;;################### 粘贴剪贴板中文乱码解决 ###################
;;没有下面这句话，下下边的修改会对从firefox向emacs复制的字符现乱码
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; 或 (set-selection-coding-system 'euc-cn) ;; ps:gbk-unix > euc-cn
(set-selection-coding-system 'gbk-unix)
;;;################### /粘贴剪贴板中文乱码解决 ###################

;;tabbar mode
(require 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)

(require 'redo)
;;设置F10为撤销
(global-set-key [f10] 'undo)
(global-set-key [C-f10] 'redo)

;; Function to copy lines
;; "C-c w" copy one line, "C-u 5 C-c w" copy 5 lines
(defun copy-lines(&optional arg)
(interactive "p")
(save-excursion
(beginning-of-line)
(set-mark (point))
(if arg
(next-line (- arg 1)))
(end-of-line)
(kill-ring-save (mark) (point))
)
)
;; set key
(global-set-key (kbd "C-c w") 'copy-lines)

(setq c-mode-hook 'turn-on-font-lock)

;;Unicad 可以帮助 Emacs 在打开文件的时候猜测语言编码，用正确的编码系统打开文件，避免乱码现象。
(require 'unicad)
;;如果文件夹是中文名，文件夹中的文件可能不能正常打开，以下设置是解决
(setq file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8-dos)
(set-default-coding-systems 'utf-8-dos) 

;;
;; prefer-coding-system 用于微调编码优先级，上面的命令将coding优先级调为utf8, gbk顺序。命令 M-x describe-coding-system 仔细观察一下结果里面的内容
;; (prefer-coding-system 'utf-8)
;; (prefer-coding-system 'chinese-gbk)
;; (prefer-coding-system 'chinese-iso-8bit)

;;;################### 在Emacs title bar显示路径 ###################
;;;Emacs title bar to reflect file name
(defun frame-title-string ()
   "Return the file name of current buffer, using ~ if under home directory"
   (let
	  ((fname (or
				 (buffer-file-name (current-buffer))
				 (buffer-name))))
	  ;;let body
	  (when (string-match (getenv "HOME") fname)
		(setq fname (replace-match "~" t t fname))        )
	  fname))
	  
;;; Title = 'system-name File: foo.bar'
(setq frame-title-format '("" system-name "  File: "(:eval (frame-title-string))))
;;;################### /在Emacs title bar显示路径 ###################

(setq backup-inhibited t);; 不产生备份
(setq auto-save-default nil) ; stop creating those #autosave# files

;;自动reload 文件 M-x revert-buffer
(global-auto-revert-mode)

(global-set-key [(f4)] 'speedbar-get-focus)  

;;;################### etags ###################
(setq tags-file-name "{/SOURCE/CODE/PATH}/TAGS")
 (global-set-key [(f7)] 'visit-tags-table)         ; visit tags table  
 (global-set-key [C-f7] 'sucha-generate-tag-table) ; generate tag table  
 (global-set-key [(control .)] '(lambda () (interactive) (lev/find-tag t)))  
 (global-set-key [(control ,)] 'sucha-release-small-tag-window)  
 (global-set-key [(meta .)] 'lev/find-tag)  
 (global-set-key [(meta ,)] 'pop-tag-mark)  
 (global-set-key (kbd "C-M-,") 'find-tag)  
 (define-key lisp-mode-shared-map [(shift tab)] 'complete-tag)  
 (add-hook 'c-mode-common-hook      ; both c and c++ mode  
		   (lambda ()  
			 (define-key c-mode-base-map [(shift tab)] 'complete-tag)))  
			 
			 (defun lev/find-tag (&optional show-only)  
  "Show tag in other window with no prompt in minibuf."  
  (interactive)  
  (let ((default (funcall (or find-tag-default-function  
							  (get major-mode 'find-tag-default-function)  
							  'find-tag-default))))  
	(if show-only  
		(progn (find-tag-other-window default)  
			   (shrink-window (- (window-height) 12)) ;; 限制为 12 行  
			   (recenter 1)  
			   (other-window 1))  
	  (find-tag default))))  
  
(defun sucha-generate-tag-table ()  
  "Generate tag tables under current directory(Linux)."  
  (interactive)  
  (let   
	  ((exp "")  
	   (dir ""))  
	(setq dir  
		  (read-from-minibuffer "generate tags in: " default-directory)  
		  exp  
		  (read-from-minibuffer "suffix: "))  
	(with-temp-buffer  
	  (shell-command  
	   (concat "find " dir " -name /"" exp "/" | xargs etags ")  
	   (buffer-name)))))  
  
(defun sucha-release-small-tag-window ()  
  "Kill other window also pop tag mark."  
  (interactive)  
  (delete-other-windows)  
  (ignore-errors  
	(pop-tag-mark)))
;;;################### /etags ###################