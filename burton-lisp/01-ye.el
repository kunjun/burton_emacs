;; -*- 这个也不知道从哪里搞到的，反正很好用的！目前很需要。 -*-

;;------------语言环境字符集设置(utf-8)-------------

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
;;处理shell-mode乱码,好像没作用

;;------语言环境字符集设置结束------------

;;--------------窗口界面设置------------------

(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color "gold1")
(set-mouse-color "gold1")

(set-scroll-bar-mode nil)
;;取消滚动栏

;;(customize-set-variable 'scroll-bar-mode 'right))
;;设置滚动栏在窗口右侧，而默认是在左侧

(tool-bar-mode nil)
;;取消工具栏

;;启动设置
(setq default-frame-alist
			 '((vertical-scroll-bars)
			   (top . 25)
			   (left . 45)
			   (width . 120)
			   (height . 40)
			   (background-color . "black")
			   (foreground-color . "grey")
			   (cursor-color . "gold1")
			   (mouse-color . "gold1")
			   (tool-bar-lines . 0)
			   (menu-bar-lines . 1)
			   (right-fringe)
			   (left-fringe)))

;;启动自动最大化(数据自己调整，注意格式，如(top . 0)，圆点前后都要留有空格)
;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 142) (height . 49)))


;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;------------窗口界面设置结束-----------------

;;------------显示时间设置------------------------------

(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;;------------显示时间设置结束--------------

;;------------定制操作习惯--------------------

;;设置打开文件的缺省路径
(setq default-directory "~/")

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

(setq ido-save-directory-list-file nil)
;;ido模式中不保存目录列表,解决退出Emacs时ido要询问编码的问题。

(setq visible-bell t)
;;关闭烦人的出错时的提示声

;;(setq inhibit-startup-message t)
;;关闭emacs启动时的画面

;;(setq gnus-inhibit-startup-message t)
;;关闭gnus启动时的画面

(fset 'yes-or-no-p 'y-or-n-p)
;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。

(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
;; 语法高亮。除 shell-mode 和 text-mode 之外的模式中使用语法高亮。

(setq column-number-mode t)
(setq line-number-mode t)
;;显示行列号
(global-linum-mode t)
(setq mouse-yank-at-point t)
;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。

(setq kill-ring-max 200)
;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西

(setq-default auto-fill-function 'do-auto-fill)
 ; Autofill in all modes;;
(setq default-fill-column 120)
;;把 fill-column 设为 60. 这样的文字更好读

(setq-default indent-tabs-mode nil)
(setq default-tab-width 8);;tab键为8个字符宽度
(setq tab-stop-list ())
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

(setq enable-recursive-minibuffers t)
;;可以递归的使用 minibuffer

(setq scroll-margin 3 scroll-conservatively 10000)
;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode

(show-paren-mode t)
;;打开括号匹配显示模式

(setq show-paren-style 'parenthesis)
;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。

(mouse-avoidance-mode 'animate)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。

(setq frame-title-format "emacs@%b")
;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。

(setq uniquify-buffer-name-style 'forward);;好像没起作用
;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。

(setq auto-image-file-mode t)
;;让 Emacs 可以直接打开和显示图片。

;(auto-compression-mode 1)
;打开压缩文件时自动解压缩。

(setq global-font-lock-mode t)
;;进行语法加亮。

(setq-default kill-whole-line t)
;; 在行首 C-k 时，同时删除该行。

(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt)
;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码

;;(setq version-control t);;启用版本控制，即可以备份多次
;; (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
;; (setq kept-new-versions 1);;备份最新的版本1次，理解同上
;; (setq delete-old-versions t);;删掉不属于以上3中版本的版本
;; (setq backup-directory-alist '(("." . "~/backups")));;设置备份文件的路径
;; (setq backup-by-copying t);;备份设置方法，直接拷贝
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的1个版本。并且备份的时候，备份文件是复本，而不是原件。

(setq make-backup-files nil)
;; 设定不产生备份文件

;;(setq auto-save-mode nil)
;;自动保存模式

(setq-default make-backup-files nil)
;; 不生成临时文件

(put 'scroll-left 'disabled nil) ;允许屏幕左移
(put 'scroll-right 'disabled nil) ;允许屏幕右移
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;把这些缺省禁用的功能打开。

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;(setq mouse-yank-at-point t)
;;使用鼠标中键可以粘贴

(setq user-full-name "BurtonQ")
(setq user-mail-address "yourmail@gmail.com")
;;设置有用的个人信息,这在很多地方有用。

(setq require-final-newline t)
;; 自动的在文件末增加一新行

(setq-default transient-mark-mode t)
;;Non-nil if Transient-Mark mode is enabled.

(setq track-eol t)
;; 当光标在行尾上下移动的时候，始终保持在行尾。

(setq Man-notify-method 'pushy)
;; 当浏览 man page 时，直接跳转到 man buffer。

;;(setq next-line-add-newlines nil)
;;Emacs 21 中已经是缺省设置。按 C-n 或向下键时不添加新行。

(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;;设置home键指向buffer开头，end键指向buffer结尾


(global-set-key (kbd "C-,") 'scroll-left)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-.") 'scroll-right)
;; "C-."设为屏幕右移命令

(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;(global-set-key [f2] 'emacs-wiki-find-file)
;;打开wiki

;;(global-set-key [f3] 'repeat-complex-command)

;;(global-set-key [f4] 'other-window)
;; 跳转到 Emacs 的另一个buffer窗口

(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  (global-set-key [C-f5] 'compile)
  (global-set-key [f5] 'du-onekey-compile)
;; C-f5, 设置编译命令; f5, 保存所有文件然后编译当前窗口文件

(global-set-key [f6] 'gdb)
;;F6设置为在Emacs中调用gdb

(global-set-key [C-f7] 'previous-error)
(global-set-key [f7] 'next-error)

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'eshell)
;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell

(setq speedbar-show-unknown-files t);;可以显示所有目录以及文件
(setq dframe-update-speed nil);;不自动刷新，手动 g 刷新
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil);;不使用 image 的方式
(setq speedbar-verbosity-level 0)

(global-set-key [f9] 'speedbar)
;;设置f9调用speedbar命令
;;使用 n 和 p 可以上下移动，
;; + 展开目录或文件进行浏览，- 收缩，RET 访问目录或文件，g 更新 speedbar。

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;;让 dired 可以递归的拷贝和删除目录。
(global-set-key [C-f9] 'dired)
;;设置[C-f9]为调用dired命令

(global-set-key [f10] 'undo)
;;设置F10为撤销

(global-set-key [f11] 'calendar)
;;设置F11快捷键指定Emacs 的日历系统

(global-set-key [f12] 'list-bookmarks)
;;设置F12 快速察看日程安排

(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
;; 设置时间戳，标识出最后一次保存文件的时间。

(global-set-key (kbd "M-g") 'goto-line)
;;设置M-g为goto-line

(global-set-key (kbd "C-SPC") 'nil)
;;取消control+space键设为mark

(global-set-key (kbd "s-SPC") 'set-mark-command)
;;用win+space键来set-mark，这样，C-SPC就可以用来调用外部输入法了。

;;----------定制操作习惯结束-------------

;;----------日历设置--------------------

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t) ; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar nil) ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
						 (holiday-fixed 2 14 "情人节")
						 (holiday-fixed 3 14 "白色情人节")
						 (holiday-fixed 4 1 "愚人节")
						 (holiday-fixed 5 1 "劳动节")
						 (holiday-float 5 0 2 "母亲节")
						 (holiday-fixed 6 1 "儿童节")
						 (holiday-float 6 0 3 "父亲节")
						 (holiday-fixed 7 1 "建党节")
						 (holiday-fixed 8 1 "建军节")
						 (holiday-fixed 9 10 "教师节")
						 (holiday-fixed 10 1 "国庆节")
						 (holiday-fixed 12 25 "圣诞节")))

;;Calendar模式支持各种方式来更改当前日期
;;（这里的“前”是指还没有到来的那一天，“后”是指已经过去的日子）
;; q 退出calendar模式
;; C-f 让当前日期向前一天
;; C-b 让当前日期向后一天
;; C-n 让当前日期向前一周
;; C-p 让当前日期向后一周
;; M-} 让当前日期向前一个月
;; M-{ 让当前日期向后一个月
;; C-x ] 让当前日期向前一年
;; C-x [ 让当前日期向后一年
;; C-a 移动到当前周的第一天
;; C-e 移动到当前周的最后一天
;; M-a 移动到当前月的第一天
;; M-e 多动到当前月的最后一天
;; M-< 移动到当前年的第一天
;; M-> 移动到当前年的最后一天

;;Calendar模式支持移动多种移动到特珠日期的方式
;; g d 移动到一个特别的日期
;; o 使某个特殊的月分作为中间的月分
;; . 移动到当天的日期
;; p d 显示某一天在一年中的位置，也显示本年度还有多少天。
;; C-c C-l 刷新Calendar窗口

;; Calendar支持生成LATEX代码。
;; t m 按月生成日历
;; t M 按月生成一个美化的日历
;; t d 按当天日期生成一个当天日历
;; t w 1 在一页上生成这个周的日历
;; t w 2 在两页上生成这个周的日历
;; t w 3 生成一个ISO-SYTLE风格的当前周日历
;; t w 4 生成一个从周一开始的当前周日历
;; t y 生成当前年的日历

;;EMACS Calendar支持配置节日：
;; h 显示当前的节日
;; x 定义当天为某个节日
;; u 取消当天已被定义的节日
;; e 显示所有这前后共三个月的节日。
;; M-x holiday 在另外的窗口的显示这前后三个月的节日。


;; 另外，还有一些特殊的，有意思的命令：
;; S 显示当天的日出日落时间(是大写的S)
;; p C 显示农历可以使用
;; g C 使用农历移动日期可以使用

;;-----------日历设置结束----------------
;;-----------日记设置---------------------

(setq diary-file "~/diary/diary");; 默认的日记文件
(setq diary-mail-addr "yourmail@gmail.com")
;;(add-hook 'diary-hook 'appt-make-list)
;;当你创建了一个'~/diary'文件，你就可以使用calendar去查看里面的内容。你可以查看当天的事件，相关命令如下 ：
;; d 显示被选中的日期的所有事件
;; s 显示所有事件，包括过期的，未到期的等等

;; 创建一个事件的样例：
;; 02/11/1989
;; Bill B. visits Princeton today
;; 2pm Cognitive Studies Committee meeting
;; 2:30-5:30 Liz at Lawrenceville
;; 4:00pm Dentist appt
;; 7:30pm Dinner at George's
;; 8:00-10:00pm concert

;; 创建事件的命令：
;; i d 为当天日期添加一个事件
;; i w 为当天周创建一个周事件
;; i m 为当前月创建一个月事件
;; i y 为当前年创建一个年事件
;; i a 为当前日期创建一个周年纪念日
;; i c 创建一个循环的事件

;;----------日记设置结束-----------------


;;-------------方便编程操作设置----------------

;;代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;能把一个代码块缩起来，需要的时候再展开
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show


;;自动补全括号
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
	(?` ?` _ "''")
	(?\( ? _ " )")
	(?\[ ? _ " ]")
	(?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。

;;把c语言风格设置为k&r风格
(add-hook 'c-mode-hook
'(lambda ()
(c-set-style "k&r")))

(autoload 'css-mode "css-mode" "CSS editing mode" t)
;;css-mode.el编辑css文件

(autoload 'htmlize-buffer "htmlize" "HTMLize mode" t)
;;把buffer的内容连同颜色转为html格式

(autoload 'folding-mode "folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
(autoload 'turn-on-folding-mode "folding" "Folding mode" t)
;;folding.el 编辑文本的一部分，其它部分折叠起来

(setq auto-mode-alist
	  ;; 将文件模式和文件后缀关联起来
	  (append '(("\\.py\\'" . python-mode)
				("\\.s?html?\\'" . html-helper-mode)
				("\\.asp\\'" . html-helper-mode)
				("\\.phtml\\'" . html-helper-mode)
				("\\.css\\'" . css-mode))
			  auto-mode-alist))

;;------------方便编程操作设置结束--------------------
