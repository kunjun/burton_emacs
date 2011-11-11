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