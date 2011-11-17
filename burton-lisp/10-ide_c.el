;; -*- c/c++ ide配置 -*-

;; (add-to-list 'load-path "~/burton_emacs/extend-lisp/xcscope")
;; (require 'xcscope) ;;加载xcscope
;; 或者，你希望只在打开c/c++文件的时候才加载xcscope，可以加入
;; (add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))

;; (load-file "~/burton_emacs/extend-lisp/cedet/common/cedet.el")
(require 'cedet) ;;加载cedet
(require 'ecb) ;;加载ecb
(require 'session) ;;加载session
(add-hook 'after-init-hook 'session-initialize) ;; 启动时初始化session
(require 'doxymacs) ;; 加载doxymacs
;; (add-hook 'c-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode
;; (add-hook 'c++-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode
;;(desktop-load-default) ;;读取默认desktop设置
;;(desktop-read) ;;读取当前目录保存的desktop设置
;;(set-face-background 'default "LightCyan3") ;;设置背景色为 浅青色3
(set-face-font 'default "-outline-新宋体-normal-r-normal-normal-*-*-96-96-c-*-iso8859-1") ;;设置字体为新宋体 ( Only for windows )
;;-v-:F2 在当前行设置或取消书签 C-F2 查找下一个书签 S-F2 查找上一个书签  C-S-F2 清空当前文件的所有书签 
(enable-visual-studio-bookmarks) ;; 启动VS书签子程序
;;(setq semanticdb-project-roots (list "d:/work")) ;; 设置cemanticdb的扫描根目录
(add-hook 'c-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;设置C语言默认格式
(add-hook 'c++-mode-common-hook ( lambda() ( c-set-style "k&r" ) ) ) ;;设置C++语言默认格式

;;;################### 各种插件启用与配置 ###################

;;;------------------- cedet -------------------
;;;------------------- semantic -------------------
;;这些函数会自动帮你enable某些semantic的minor mode
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;;semantic不能自动查找include-path，那就告诉semantic，办法是调用semantic-add-system-include函数，这个函数会根据mode把路径加入到semantic-dependency-system-include-path里去。
;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
		"../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
		"C:/MinGW/include/c++/3.4.5"
		"C:/MinGW/include/c++/3.4.5/mingw32"
		"C:/MinGW/include/c++/3.4.5/backward"
		"C:/MinGW/lib/gcc/mingw32/3.4.5/include"
		"C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
	(setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
		  (semantic-add-system-include dir 'c++-mode)
		  (semantic-add-system-include dir 'c-mode))
		include-dirs))

;;代码折叠semantic-tag-folding 
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)



;;;------------------- /semantic -------------------
;;-v-:eassist-switch-h-cpp有个BUG：它是通过文件扩展名来匹配的(通过eassist-header-switches可配置)，默认它能识别h/hpp/cpp/c/C/H/cc这几个扩展名的文件；但是C++的扩展名还可能会有别的，比如c++,cxx等，对一个扩展名为cxx的文件调用eassist-switch-h-cpp的话，它会创建一个新buffer显示错误信息。所以我把eassist-header- switches配置为： 
(setq eassist-header-switches
	  '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
		("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
		("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
		("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
		("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
		("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
		("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
		("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
		("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
		("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
		("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
		("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
		("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
		("c" . ("h"))
		("m" . ("h"))
		("mm" . ("h"))))
;;;------------------- ede -------------------
;;开启ede
(global-ede-mode t)
;;;------------------- /ede -------------------
;;;------------------- /cedet -------------------

;;;------------------- ecb -------------------
;;自动启动ecb，并且不显示每日提示
;(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)
;;;------------------- /ecb -------------------


;;;------------------- cscope -------------------
;;是否每次查询时更新数据库
(setq cscope-do-not-update-database t)
;;;------------------- /cscope -------------------

;;;################### /各种插件启用与配置 ###################


;;;################### 定义各种连招 ###################

;;;------------------- semantic -------------------
;;执行M-x semantic-ia-fast-jump，马上就跳转到函数的定义上去，绑定到f12
(global-set-key [f12] 'semantic-ia-fast-jump)
;;-^-:在打开mru-bookmark-mode的情况下，按[C-x B]，emacs会提示你跳回到哪个地方，一般默认的就是上一次semantic-ia-fast-jump的位置，所以回车就可以回去了。
;;跳转后马上跳回来，要按[C-x B] [RET]这么多键有点麻烦，所以这个函数不提示直接就跳回上次的位置，并把它绑定到shift+f12上了
(global-set-key [S-f12]
				(lambda ()
				  (interactive)
				  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
					  (error "Semantic Bookmark ring is currently empty"))
				  (let* ((ring (oref semantic-mru-bookmark-ring ring))
						 (alist (semantic-mrub-ring-to-assoc-list ring))
						 (first (cdr (car alist))))
					(if (semantic-equivalent-tag-p (oref first tag)
												   (semantic-current-tag))
						(setq first (cdr (car (cdr alist)))))
					(semantic-mrub-switch-tags first))))
;;cedet还有个功能在函数和声明和实现间跳转，一般的，函数声明放在h文件中，函数的实现放在cpp文件中，光标在函数体的时候通过M-x semantic-analyze-proto-impl-toggle可以跳到函数声明去，在声明处再执行的话就会再跳回函数体，我把它绑定到M-S- F12上了
(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)
;;-^-:不是这个功能不是十分准确，一般在cpp中函数实现处想跳到函数声明处正常，但是从声明处跳到实现处的话cedet不一定能找到cpp文件的位置。
;;senator-complete-symbol和semantic-ia-complete-symbol这两个函数是新开一个buffer提示可能的补全内容；而senator-completion-menu-popup和semantic-ia-complete-symbol-menu会弹出一个补全菜单。
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
;;把按键绑定到了[C-c , -]和[C-c , +]上(绑定这么复杂的按键主要是为了和senator兼容，后面会讲到senator实现代码折叠)： 
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
;;同时它还提供了两个函数可以同时打开和折叠整个buffer的所有代码，分别是semantic-tag-folding-fold-all和semantic-tag-folding-show-all，我把它们绑定到了[C-_]和[C-+]上： 
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)
;;打开semantic-tag-folding-mode后，用gdb调试时不能点左侧的fringe切换断点了，所以我把C-?定义为semantic-tag-folding-mode的切换键，在gdb调试时临时把semantic-tag-folding关掉： 
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
;;终端下semantic-tag-folding在函数前面加了个“+”或“-”号,虽然功能不受影响(除了不能用鼠标操作外，快捷键和GUI下是一样的)，不过代码不能对齐了还是令我有些不爽，所以终端下我是禁用semantic-tag-folding的，最终我的配置如下,需要注意的是，semantic-tag-folding依赖于语法解析，也就是说必须等semantic解析完文件之后才能使用。如果找开文件在fringe处找不到空心三角，可以[Force Tag Refresh]下，或者检查下semantic是否配置正确。 
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

;;;------------------- /semantic -------------------

;;;------------------- ecb -------------------
(global-set-key [f12] 'ecb-activate) ;;定义F12键为激活ecb
(global-set-key [C-f12] 'ecb-deactivate) ;;定义Ctrl+F12为停止ecb
(global-set-key [f11] 'delete-other-windows) ;;设置F11为删除其它窗口
(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu) ;;设置Alt+Enter为自动补全菜单
(global-set-key [C-\;] 'ecb-goto-window-edit-last) ;;切换到编辑窗口
(global-set-key [C-\'] 'ecb-goto-window-methods) ;;切换到函数窗口
;;;; 各窗口间切换  
(global-set-key [M-left] 'windmove-left)  
(global-set-key [M-right] 'windmove-right)  
(global-set-key [M-up] 'windmove-up)  
(global-set-key [M-down] 'windmove-down)   
;;;; 隐藏和显示ecb窗口
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)
(define-key global-map [(control f2)] 'ecb-show-ecb-windows)
;;;; 使某一ecb窗口最大化
(define-key global-map (kbd "C-c 1") 'ecb-maximize-window-directories)
(define-key global-map (kbd "C-c 2") 'ecb-maximize-window-sources)
(define-key global-map (kbd "C-c 3") 'ecb-maximize-window-methods)
(define-key global-map (kbd "C-c 4") 'ecb-maximize-window-history)
;;;; 恢复原始窗口布局
(define-key global-map (kbd "C-c `") 'ecb-restore-default-window-sizes)
;;;------------------- /ecb -------------------

;;;------------------- cscope -------------------
(global-set-key [C-.] 'cscope-find-global-definition) ;;搜索定义
(global-set-key [C-,] 'cscope-pop-mark) ;; 跳出转向
;;;------------------- /cscope -------------------

;;;################### /定义各种连招 ###################


;;处于c-mode，就用gcc -Wall编译，如果是c++-mode就用 g++ -Wall编译" 
(require 'smart-compile) ;;加载smart-compile
(add-to-list 'smart-compile-alist
		 '(muse-mode . (call-interactively 'muse-project-publish)))
(global-set-key (kbd "<f7>") 'smart-compile)