;; 载入elisp文件
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/transtone"))
(add-to-list 'load-path "~/.emacs.d/lisps")
(add-to-list 'load-path "~/.emacs.d/lisps/powerline")
(add-to-list 'load-path "~/.emacs.d/lisps/tree")

;; 载入package
(require 'package)
;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.org/packages/")))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") ("popkit" . "http://elpa.popkit.org/packages/")))
(package-initialize)

;; (unless (require 'quelpa nil t)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
;;     (eval-buffer)))

;; 开启行号
(require 'linum-relative)
;; (linum-on)
;; (linum-relative-on)
(linum-relative-in-helm-p)
(setq linum-format " %4d  ") ;\u2502

;;(global-set-key [(f1)] (lambda () (interactive) (manual-entry (current-word))))
(global-set-key [f1] 'neotree-toggle)       ; 快速浏览
;; (global-set-key [f2] 'nyan-animate-nyancat)  ; nyan cat animate
;; (global-set-key [f2] 'view-mode)            ; 只读模式
(global-set-key [f2] 'rainbow-identifiers-mode)       ; 语法高亮
(global-set-key [f3] 'highlight-symbol-mode)       ; sublimity-mode
;; (global-set-key [f3] 'minimap-toggle)       ; minimap
;; (global-set-key [f3] 'hs-minor-mode)           ; hide-show
;; (global-set-key [f4] 'highlight-indentation-mode )
(global-set-key [f4] 'whitespace-mode) ; 高亮光标行  global-hl-line-mode
(global-set-key [f5] 'revert-buffer)       ; 刷新文件
(global-set-key [f6] 'multi-term)               ; shell
(global-set-key [f7] 'calendar)             ; Emacs 的日历系统
;; (global-set-key [f8] 'flymake-mode)
(global-set-key [f8] 'magit-status)
(global-set-key [f9] 'other-window)         ; 跳转到 Emacs 的另一个窗口
;;(global-set-key [f10] ')                  ; 文件菜单
(global-set-key [f11] 'compile)             ; 在 Emacs 中编译
(global-set-key [f12] 'gdb)                 ; 在 Emacs 中调试
;; 这些功能键有时候还是很有用的。除了直接设置之外，还可以配合 Shift, Ctrl 设置，比如：
;; (global-set-key [(shift f1)] 'goto-line)
;;
;; 实际上 Shift-F1 也可以用 F13 表示。

;; (server-start)

;; Automatically becomes buffer-local when set in any fashion.

;; Documentation:
;; Cursor to use when this buffer is in the selected window.
;; Values are interpreted as follows:

;; t use the cursor specified for the frame
;; nil don't display a cursor
;; box display a filled box cursor
;; hollow display a hollow box cursor
;; bar display a vertical bar cursor with default width
;; (bar . WIDTH) display a vertical bar cursor with width WIDTH
;; hbar display a horizontal bar cursor with default height
;; (hbar . HEIGHT) display a horizontal bar cursor with height HEIGHT
;; ANYTHING ELSE display a hollow box cursor
;; When the buffer is displayed in a non-selected window, the
;; cursor's appearance is instead controlled by the variable
;; `cursor-in-non-selected-windows'.

;; (setq-default cursor-type 'bar) ; 设置光标为竖线

(setq evil-want-C-i-jump nil) ;; 在normal模式使用Tab键, 必须在evil加载之前设置。
;; (require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ri" 'indent-region
  "rb" 'revert-buffer
  "dt" 'dired-move-to-first-file
  "dy" 'put-file-name-on-clipboard
  "tt" 'helm-gtags-dwim
  "tk" 'helm-gtags-pop-stack
  ;; "e" 'find-file ;; find and edit
  "gs" 'avy-goto-word-or-subword-1
  "gw" 'avy-goto-word-1
  "gc" 'avy-goto-char
  "gl" 'avy-goto-line
  "gj" 'godef-jump
  "gi" 'go-goto-imports
  "gb" 'pop-tag-mark
  "go" 'godef-jump-other-window
  "gt" 'go-coverage
  "e" 'helm-find-files
  "s" 'helm-occur
  ;; "f" 'helm-occur
  "rd" 'redo
  "rr" 'anzu-query-replace ;; search & replace
  "m" 'helm-mini
  "b" 'switch-to-buffer
  "k" 'kill-buffer
)
(setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))

;; (require 'evil)
(evil-mode t)
;; (setq evil-emacs-state-cursor '(bar . 2))
(setq evil-emacs-state-cursor '("#8A2BE2" box))
(setq evil-normal-state-cursor '("#BD2C00" box)) ;#0FB300
(setq evil-visual-state-cursor '("#FFA500" box))

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

;; (defun after-all-loads () (require 'evil))
;; (add-hook 'after-init-hook 'after-all-loads)


;; (setq evil-default-state 'emacs)
(setq evil-want-fine-undo t)
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
; C-o按键调用vim功能（就是临时进入normal模式，然后自动回来）;
; 比如，你要到第一行，可以使用emacs的 M-<，也可以使用evil的C-o gg
; 其中C-o是进入vim模式 gg是去第一行，命令之后自动还原emacs模式！
; "Fuck you!" 如何删除""里面的内容呢？Emacs的话，默认文本对象能力不强
; 有了evil的拓展 C-o di" 轻轻松松搞定~
; 比如C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~发挥想象力吧

;; 用emacs-state替换insert-state
(defadvice evil-insert-state (around emacs-state-instead-of-insert-state activate)
  (evil-emacs-state))
;; (defalias 'evil-insert-state 'evil-emacs-state)

;; 按 ESC 进入正常模式，并且设置fcitx为关闭状态。
;; 需要设置一下默认路径，否则在tramp下执行的是远程机器的命令。
;; (defun close-fcitx ()
;; (interactive)
;; (save-excursion
;; (let ((default-directory "/"))
;; (shell-command "fcitx-remote -c"))))

;; (add-hook 'evil-normal-state-entry-hook 'close-fcitx)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
;; 修改evil正常模式下vi风格绑定，改为emacs风格绑定。
(define-key evil-normal-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "C-b") 'evil-backward-char)
(define-key evil-normal-state-map (kbd "C-v") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd "C-v") 'evil-scroll-page-down)
(define-key evil-normal-state-map (kbd "C-.") 'redo)
(define-key evil-normal-state-map "\C-r" 'isearch-backward)
(define-key evil-insert-state-map "\C-r" 'search-backward)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-y" 'evil-paste-before)
(define-key evil-insert-state-map "\C-y" 'evil-paste-after)
(define-key evil-normal-state-map "J" 'evil-scroll-line-up)
(define-key evil-normal-state-map "K" 'evil-scroll-line-down)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "x" 'delete-char) ;; 后删，不记录剪切板
(define-key evil-normal-state-map "X" 'delete-backward-char) ;; 前删，不记录剪切板
(define-key evil-normal-state-map "\C-d" 'delete-char)
(define-key evil-insert-state-map "\C-d" 'delete-char)
;; (define-key evil-emacs-state-map "\C-z" 'undo)
;; (define-key evil-normal-state-map "\C-z" 'undo)
(define-key evil-normal-state-map "\C-z" 'set-mark-command)
(define-key evil-emacs-state-map "\C-z" 'set-mark-command)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-emacs-state-map  "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
; 以下设置时使用t作为多剪贴板的起始按键，比如 tay(不是 "ay哦) tap(就是"ap啦)~
(define-key evil-normal-state-map "t" 'evil-use-register)


(add-hook 'neotree-mode-hook
      (lambda ()
    ;; (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(add-hook 'go-mode-hook         'hs-minor-mode)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(hideshowvis-symbols)
(global-set-key (kbd "C-c h") 'hs-hide-all) ;; hide all
(global-set-key (kbd "C-c n") 'hs-show-all) ;; no hide all
(global-set-key (kbd "C-c j") 'hs-toggle-hiding) ;; unfold

(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
;; (global-set-key (kbd "s-w") 'ace-window)

;; (global-set-key ( kbd "C-z") 'undo)

;; 存盘前删除行末多余的空格/空行
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

(setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-theme 'nerd) ;; classic，ascii，arrow，nerd
(setq neo-vc-integration nil)
(defun neotree-ffip-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
    (file-name (buffer-file-name)))
    (if project-dir
    (progn
      (neotree-dir project-dir)
      (neotree-find file-name))
      (message "Could not find git project root."))))

(global-set-key (kbd "C-c C-p") 'neotree-ffip-project-dir)

;; (require 'rainbow-identifiers)
;; (require 'rainbow-mode)
;; Customized filter: don't mark *all* identifiers
(defun amitp/rainbow-identifiers-filter (beg end)
  "Only highlight standalone words or those following 'this.' or 'self.'"
  (let ((curr-char (char-after beg))
        (prev-char (char-before beg))
        (prev-self (buffer-substring-no-properties
                    (max (point-min) (- beg 5)) beg)))
    (and (not (member curr-char
                    '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
         (or (not (equal prev-char ?\.))
             (equal prev-self "self.")
             (equal prev-self "this.")))))

;; Filter: don't mark identifiers inside comments or strings
(setq rainbow-identifiers-faces-to-override
      '(font-lock-type-face
        font-lock-variable-name-face
        font-lock-function-name-face))

;; Set the filter
(add-hook 'rainbow-identifiers-filter-functions 'amitp/rainbow-identifiers-filter)

;; Use a wider set of colors
(setq rainbow-identifiers-choose-face-function
      'rainbow-identifiers-cie-l*a*b*-choose-face)
(setq rainbow-identifiers-cie-l*a*b*-lightness 45)
(setq rainbow-identifiers-cie-l*a*b*-saturation 45)


;; (require 'highline)
;; (toggle-hl-line-when-idle 1) ; Highlight only when idle

(require 'wgrep)
(require 'diff-mode)
(defvar diff-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-.") 'diff-hunk-next)
    (define-key map (kbd "M-,") 'diff-hunk-prev)
  map)
"Keymap for `diff-mode'.")


;; 用meta-j/meta-k 上下移动光标
;; (define-key key-translation-map [(meta j)] [(control n)])
;; (define-key key-translation-map [(meta k)] [(control p)])

;; 模拟Vi的光标不动屏幕动效果
(global-set-key [(meta j)] (lambda () (interactive) (scroll-down 1)))
(global-set-key [(meta k)] (lambda () (interactive) (scroll-up 1)))
;; (global-set-key [(meta down)] (lambda () (interactive) (scroll-down 1)))
;; (global-set-key [(meta up)] (lambda () (interactive) (scroll-up 1)))
;; 同上, 但是是另一个buffer窗口上下移动. 常常查看帮助用这个.
(global-set-key [(meta J)] 'other-window-move-down)
(global-set-key [(meta K)] 'other-window-move-up)
;; C-l 向右移动一个字符, C-j向左移动一个字符.
(global-set-key [(meta l)] 'forward-char)
(global-set-key [(meta h)] 'backward-char)

;; Setting English Font
;; (set-face-attribute
;; 'default nil :font "Roboto Mono 10")
;; (set-face-attribute
 ;; 'default nil :font "Envy Code R for Powerline 10")
;; (set-face-attribute
 ;; 'default nil :font "Tsentsiu Mono HG 10")
(set-face-attribute
 'default nil :font "PT Mono 9")
;; (set-face-attribute
 ;; 'default nil :font "Anonymous Pro Minus 10")
;; (set-face-attribute
 ;; 'default nil :font "Fantasque Sans Mono 10")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
    charset
    (font-spec :family "思源黑体 medium" )))
    ;; (font-spec :family "PingFang SC Regular" )))
    ;; (font-spec :family "方正秉楠圆宋简体" :size 20)))
    ;; (font-spec :family "冬青黑体简体中文 W6" :size 22)))
    ;; (font-spec :family "Microsoft Yahei" :size 20)))

;; (set-default-font "Monaco-9")
;; (set-face-attribute 'default nil :font (font-candidate '("Consolas-10:weight=normal" "DejaVu Sans Mono-10:weight=normal")))

;; (require 'twittering-mode)
;; (setq twittering-username "transtone")
;; (setq twittering-update-status-function
;;       'twittering-update-status-from-pop-up-buffer)
;; (twittering-icon-mode)                       ; Show icons (requires wget)
;; (setq twittering-timer-interval 300)

(autoload 'dirtree "dirtree" "Add directory to tree view" t)

(eval-after-load "man" '(require 'man-completion))

(global-set-key (kbd "C-SPC") 'nil)
(global-set-key (kbd "M-j") 'nil)
(global-set-key (kbd "M-k") 'nil)
(global-set-key (kbd "C-d") 'hungry-delete-forward) ;;增强删除功能
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-c\C-z" 'pop-global-mark)
;; 很多文件的时候，在几个文件中跳转到曾经用过的 mark 地方。

;; (global-set-key "\C-\\" 'toggle-truncate-lines)
;; 基本不用 Emacs 的输入法，绑定给折行命令吧
;; 折行
(global-set-key "\C-]" 'toggle-truncate-lines)

;; (global-set-key "\C-z" 'set-mark-command)
(global-set-key (kbd "M-SPC") 'set-mark-command)
;; 设置标记。

(define-prefix-command 'ctl-x-m-map)
(global-set-key "\C-xm" 'ctl-x-m-map)
;; 定义了一个新的前缀，并且绑定到 C-x m

(define-key ctl-x-m-map "w" 'ibuffer)
;; 管理 Emacs 所打开的 buffer。

(setq inhibit-startup-message t)
;; 不显示 Emacs 的开始画面。

(setq frame-title-format '("" buffer-file-name "@" user-login-name ":" system-name))
;; 设置缓冲标题

(setq default-major-mode 'text-mode)
;; (add-hook 'text-mode-hook '(lambda () (setq require-final-newline 'query)))
;; 任意的打开一个新文件时，缺省使用 text-mode。

(setq require-final-newline t)
(setq mode-require-final-newline nil)
;; (setq require-final-newline t)
;; 存盘的时候，要求最后一个字符是换行符。

(setq resize-mini-windows nil)
;; mini buffer 的大小保持不变。

;;(mouse-avoidance-mode 'animate)
;; 鼠标指针避开光标

;; 用鼠标快速 copy ,cut , paste
;; (require 'mouse-copy)
;; (global-set-key [S-down-mouse-1] 'mouse-drag-secondary-pasting)
;; (global-set-key [M-S-down-mouse-1] 'mouse-drag-secondary-moving)

(global-unset-key [M-mouse-1])
(global-unset-key [M-drag-mouse-1])
(global-unset-key [M-down-mouse-1])
(global-unset-key [M-mouse-3])
(global-unset-key [M-mouse-2])

(setq track-eol t)
;; 当光标在行尾上下移动的时候，始终保持在行尾。

(setq Man-notify-method 'pushy)
;; 当浏览 man page 时，直接跳转到 man buffer。

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的

(setq default-fill-column 80)

(setq line-number-display-limit 1000000)
;; 当行数超过一定数值，不再显示行号。

(setq kill-ring-max 200)
;; kill-ring 最多的记录个数。

(setq ring-bell-function 'ignore)
;; 彻底的消除 ring-bell 的效果。

(setq apropos-do-all nil)
;; M-x apropos 时多查询些结果，但需要更多的 CPU。

(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
;; 复制(删除)目录的时，第归的复制(删除)其中的子目录。


;; (display-battery-mode 1)
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间栏旁边启用邮件设置
;; (setq display-time-use-mail-icon t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
(setq display-time-format "%m-%d %H:%M %A")
;; (setq display-time-24hr-format t)
;; (setq display-time-day-and-date t)
;; 在 mode-line 上显示时间。
;; (fancy-battery-mode 1)


(require 'smtpmail)
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq user-full-name "transtone")
(setq smtpmail-local-domain "gmail.com")
(setq user-mail-address (concat "zm3345@" smtpmail-local-domain))
;; 缺省的名字和邮件地址，很多地方用得到，比如 VC(version control) 中产生ChangeLog 文件。

(setq appt-issue-message t)
;; 打开约会提醒功能。
(setq x-select-enable-clipboard t)
;; 支持emacs和外部程序的粘贴

(defun zhou-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'zhou-comment-dwim-line)
;;do what I mean,注释功能

;;###复制一行绑定
(global-set-key (kbd "M-w") 'zhou-save-line-dwim)
;;###autoload
(defun zhou-save-one-line (&optional arg)
  "save one line. If ARG, save one line from first non-white."
  (interactive "P")
  (save-excursion
    (if arg
    (progn
      (back-to-indentation)
      (kill-ring-save (point) (line-end-position)))
      (kill-ring-save (line-beginning-position) (line-end-position)))))
;;;###autoload
(defun zhou-kill-ring-save (&optional n)
  "If region is active, copy region. Otherwise, copy line."
  (interactive "p")
  (if (and mark-active transient-mark-mode)
      (kill-ring-save (region-beginning) (region-end))
    (if (> n 0)
    (kill-ring-save (line-beginning-position) (line-end-position n))
      (kill-ring-save (line-beginning-position n) (line-end-position)))))
;;;###autoload
(defun zhou-save-line-dwim (&optional arg)
  "If region is active, copy region.
If ARG is nil, copy line from first non-white.
If ARG is numeric, copy ARG lines.
If ARG is non-numeric, copy line from beginning of the current line."
  (interactive "P")
  (if (and mark-active transient-mark-mode)
      ;; mark-active, save region
      (kill-ring-save (region-beginning) (region-end))
    (if arg
    (if (numberp arg)
    ;; numeric arg, save ARG lines
    (zhou-kill-ring-save arg)
      ;; other ARG, save current line
      (zhou-save-one-line))
      ;; no ARG, save current line from first non-white
      (zhou-save-one-line t))))
;;==============================================


(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S 93free")
;; 设置时间戳，标识出最后一次保存文件的时间。

(setq version-control 1)
(setq kept-old-versions 1)
(setq kept-new-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp")))
(setq backup-by-copying t)
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的一个版本和最新的
;; 两个版本。并且备份的时候，备份文件是复本，而不是原件。

(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))
;; 语法高亮。除 shell-mode 和 text-mode 之外的模式中使用语法高亮。

(setq git-lock-defer-on-scrolling t)
(setq font-lock-support-mode 'jit-lock-mode)
;; 为什么使用语法显示的大文件在移动时如此之慢


;; TTY-emacs: Use mode line face for vertical border
;; (set-display-table-slot standard-display-table
;;       'vertical-border
;;       (make-glyph-code ?| 'mode-line))


(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
      (oldalpha (if alpha-or-nil alpha-or-nil 100))
      (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C-8 will increase opacity (== decrease transparency)
 ;; C-9 will decrease opacity (== increase transparency
 ;; C-0 will returns the state to normal
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
     (modify-frame-parameters nil `((alpha . 100)))))


;; shell 和 eshell 相关设置
(setq shell-file-name "/bin/bash")

;; 让 shell mode 可以正常显示颜色
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(require 'ansi-color)


;; eshell 的颜色;; 这样可以显示颜色，但是当在文件很多的目录里面显示的时候会很慢
;(add-hook 'eshell-preoutput-filter-functions
;         'ansi-color-apply)
;; 这样直接把颜色滤掉
(add-hook 'eshell-preoutput-filter-functions
      'ansi-color-filter-apply)

;; eshell ssh
(defun eshell/ssh (&rest args)
  "Secure shell"
  (let ((cmd (eshell-flatten-and-stringify
      (cons "ssh" args)))
    (display-type (framep (selected-frame))))
    (cond
     ((and
       (eq display-type 't)
       (getenv "STY"))
      (send-string-to-terminal (format "\033]83;screen %s\007" cmd)))
     ((eq display-type 'x)
      (eshell-do-eval
       (eshell-parse-command
    (format "Terminal -e %s &" cmd)))
      nil)
     (t
      (apply 'eshell-exec-visual (cons "ssh" args))))))

(setq-default kill-whole-line t)
;; 在行首 C-k 时，同时删除该行。

(fset 'yes-or-no-p 'y-or-n-p)
;; 按 y 或空格键表示 yes，n 表示 no。

(auto-compression-mode 1)               ; 打开压缩文件时自动解压缩。
(column-number-mode 1)                  ; 显示列号。
(blink-cursor-mode -1)                  ; 光标不要闪烁。
(show-paren-mode 1)                     ; 高亮显示匹配的括号。
(setq show-paren-style 'parentheses)    ; 括号不来回弹跳。
(menu-bar-mode -1)                      ; 不要 menu-bar。
;; (icomplete-mode 1)                      ; 给出用 M-x foo-bar-COMMAND 输入命令的提示。
(set-scroll-bar-mode 'right)		; scroll-bar 靠右显示。
(scroll-bar-mode -1)                    ; 不要纵向 scroll-bar
;; (horizontal-scroll-bar-mode -1)         ; 不要横向 scroll-bar
(tool-bar-mode -1)			; 不要 tool-bar。

(autoload 'table-insert "table" "WYGIWYS table editor")
;; 可以识别文本文件里本来就存在的表格，而且可以把表格输出为 HTML 和 TeX。

;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 注释style
;;(setq comment-style 'box)

;; outline-mode
(setq outline-minor-mode-prefix [(control r)])
(set-display-table-slot
 standard-display-table
 'selective-display
 (let ((face-offset (* (face-id 'shadow) (lsh 1 22))))
   (vconcat (mapcar (lambda (c) (+ face-offset c)) " [...] "))))

;; 这两个函数可以分别把一个区域和匹配某个regexp的行都藏起来，就跟不存在一样……
;; hide region
(require 'hide-region)
(global-set-key (kbd "C-c r") 'hide-region-hide)
(global-set-key (kbd "C-c R") 'hide-region-unhide)
;; hide lines
(require 'hide-lines)
;;(global-set-key (kbd "C-c l") 'hide-lines)
(global-set-key (kbd "C-c L") 'show-all-invisible)
;; hide-lines 在操作某些行的时候用起来特别方便。加一个前缀参数可以把不匹配的行都藏起来，只看到匹配的！

(require 'thumbs)
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
(auto-image-file-mode t)
;; 开启图片浏览

;;设置TAB键缩进为4个空格
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
;; (setq default-tab-width 3)
(setq tab-width 3)
(setq c-basic-offset 3)
(setq tab-stop-list ())

(setq x-stretch-cursor t)
;; 如果设置为 t，光标在 TAB 字符上会显示为一个大方块 :)。

;;(require 'un-define)  ;;最新版的mule-ucs不自动加载unicode支持,须照此行方法手动载入.
;; (require 'unicad)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
;;(set-keyboard-coding-system 'chinese-gbk)

;; make PC keyboard's Win key or other to type Super or Hyper, for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(modify-coding-system-alist 'file "\\.nfo\\'" 'cp437)
;; 用cp437编码来打开.nfo文件

;; css-mode 缩进
;; (defcustom css-indent-offset 2)

;; (require 'ido)
(ido-mode t)
(defun ido-file-name-all-completions-1 (dir)
  (cond
   ((ido-nonreadable-directory-p dir) '())
   ;; do not check (ido-directory-too-big-p dir) here.
   ;; Caller must have done that if necessary.

   ((and ido-enable-tramp-completion
     (or (fboundp 'tramp-completion-mode-p)
     (require 'tramp nil t))
     (string-match "\\`/[^/]+[:@]\\'" dir))
    ;; TRAMP RELATED CODE DELETED
    nil)
   (t
    (file-name-all-completions "" dir))))
(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
  (setq ido-temp-list
    (sort ido-temp-list
      (lambda (a b)
    (time-less-p
     (sixth (file-attributes (concat ido-current-directory b)))
     (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
      (lambda (x) (and (char-equal (string-to-char x) ?.) x))
      ido-temp-list))))

;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "C-x C-m") 'smex) ;; supersedes binding in starter-kit-bindings.org
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-x C-M") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; (setq smex-show-unbound-commands t)
;; (smex-auto-update 30)


;; (helm-autoresize-mode 1)
;(setq helm-ff-auto-update-initial-value nil)    ; 禁止自动补全
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)
;; (define-key helm-map (kbd "M-n") 'helm-next-line)
;; (define-key helm-map (kbd "M-p") 'helm-previous-line)
;; (define-key helm-map (kbd "C-p") 'previous-history-element)
;; (define-key helm-map (kbd "C-n") 'next-history-element)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-quick-update                     t ; do not display invisible candidates
      helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t   ; 模糊搜索
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t
      helm-recentf-fuzzy-match              t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

;; Only pop up at the bottom.
(setq helm-split-window-in-side-p t)

(add-to-list 'display-buffer-alist
         '("\\`\\*helm.*\\*\\'"
           (display-buffer-in-side-window)
           (inhibit-same-window . t)
           (window-height . 0.4)))

(setq helm-swoop-split-with-multiple-windows nil
    helm-swoop-split-direction 'split-window-vertically
    helm-swoop-split-window-function 'helm-default-display-buffer)

;; Input in header line and hide the mode-lines above.
(setq helm-echo-input-in-header-line t)

(defvar bottom-buffers nil
  "List of bottom buffers before helm session.
    Its element is a pair of `buffer-name' and `mode-line-format'.")

(defun bottom-buffers-init ()
  (setq-local mode-line-format (default-value 'mode-line-format))
  (setq bottom-buffers
    (cl-loop for w in (window-list)
         when (window-at-side-p w 'bottom)
         collect (with-current-buffer (window-buffer w)
               (cons (buffer-name) mode-line-format)))))


(defun bottom-buffers-hide-mode-line ()
  (setq-default cursor-in-non-selected-windows nil)
  (mapc (lambda (elt)
      (with-current-buffer (car elt)
        (setq-local mode-line-format nil)))
    bottom-buffers))


(defun bottom-buffers-show-mode-line ()
  (setq-default cursor-in-non-selected-windows t)
  (when bottom-buffers
    (mapc (lambda (elt)
        (with-current-buffer (car elt)
          (setq-local mode-line-format (cdr elt))))
      bottom-buffers)
    (setq bottom-buffers nil)))

(defun helm-keyboard-quit-advice (orig-func &rest args)
  (bottom-buffers-show-mode-line)
  (apply orig-func args))


(add-hook 'helm-before-initialize-hook #'bottom-buffers-init)
(add-hook 'helm-after-initialize-hook #'bottom-buffers-hide-mode-line)
(add-hook 'helm-exit-minibuffer-hook #'bottom-buffers-show-mode-line)
(add-hook 'helm-cleanup-hook #'bottom-buffers-show-mode-line)
(advice-add 'helm-keyboard-quit :around #'helm-keyboard-quit-advice)


;; File Navigation
;; Backspace goes to the upper folder if you are not inside a filename, and Return will select a file or navigate into the directory if it is one.
;; http://emacs.stackexchange.com/a/7896/9198

(defun dwim-helm-find-files-up-one-level-maybe ()
  (interactive)
  (if (looking-back "/" 1)
      (call-interactively 'helm-find-files-up-one-level)
    (delete-backward-char 1)))

(define-key helm-read-file-map (kbd "<backsqpace>") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-read-file-map (kbd "DEL") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-find-files-map (kbd "<backspace>") 'dwim-helm-find-files-up-one-level-maybe)
(define-key helm-find-files-map (kbd "DEL") 'dwim-helm-find-files-up-one-level-maybe)

(defun dwim-helm-find-files-navigate-forward (orig-fun &rest args)
  "Adjust how helm-execute-persistent actions behaves, depending on context"
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))


(define-key helm-map (kbd "<return>") 'helm-maybe-exit-minibuffer)
(define-key helm-map (kbd "RET") 'helm-maybe-exit-minibuffer)
(define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "RET") 'helm-execute-persistent-action)

(advice-add 'helm-execute-persistent-action :around #'dwim-helm-find-files-navigate-forward)

;; helm projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)
(setq projectile-switch-project-action 'helm-projectile-find-file)


;; (autopair-global-mode) ;; enable autopair in all buffers
;; (smartparens-global-mode)
(electric-pair-mode 1) ;; emacs 自带的括号补全

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case nil)
;; (setq company-dabbrev-code-ignore-case t)
(setq company-dabbrev-code-other-buffers nil)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-idle-delay 0.3)
(setq company-auto-complete nil)
;; (setq company-show-numbers t)
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(setq company-global-modes
      '(not
    eshell-mode comint-mode org-mode erc-mode gud-mode))

(setq company-selection-wrap-around t)
(setq company-transformers '(company-sort-by-occurrence))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (require 'init-company)

;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;         (backward-char 1)
;;         (if (looking-at "->") t nil)))))

;; (Defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;;             (null (do-yas-expand)))
;;         (if (check-expansion)
;;             (company-complete-common)
;;           (indent-for-tab-command)))))

;; (global-set-key [tab] 'tab-indent-or-complete)

;; yasnippet
(require 'yasnippet)
;; (add-to-list 'load-path
             ;; "~/.emacs.d/lisps/yasnippet/snippets")
;; (require 'yasnippet)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
          yas/completing-prompt))
(setq yas-snippet-dirs (append yas-snippet-dirs
           '("~/.emacs.d/lisps/yasnippet/snippets")))
;; (add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'html-mode)))

(yas-global-mode 1)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/lisps/yasnippet/snippets")
;; (add-to-list 'load-path "~/.emacs.d/plugins/autopair") ;; comment if autopair.el is in standard load path

(require 'go-mode-autoloads)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

;; (load "~/gocode/src/golang.org/x/tools/cmd/oracle/oracle.el")
;; (add-hook 'go-mode-hook 'go-oracle-mode)

;; (add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
;; (require 'go-flymake')

(setq gofmt-show-errors "Echo area")

(add-hook 'go-mode-hook 'go-eldoc-setup)
;; (set-face-attribute 'eldoc-highlight-function-argument nil
  ;; :underline t :foreground "green"
  ;; :weight 'bold)
(add-hook 'go-mode-hook
      (lambda ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq tab-width 3)
    (setq indent-tabs-mode 1)))
;; define my own go mode key binds ::super
(setq go-mode-map
  (let ((m (make-sparse-keymap)))
    (define-key m "}" #'go-mode-insert-and-indent)
    (define-key m ")" #'go-mode-insert-and-indent)
    (define-key m "," #'go-mode-insert-and-indent)
    (define-key m ":" #'go-mode-insert-and-indent)
    (define-key m "=" #'go-mode-insert-and-indent)
    (define-key m (kbd "C-c C-a") #'go-import-add)
    (define-key m (kbd "C-c C-j") #'godef-jump)
    (define-key m (kbd "C-c C-r") #'go-remove-unused-imports)
    ;; go back to point after called godef-jump.  ::super
    (define-key m (kbd "C-c C-b") #'pop-tag-mark)
    (define-key m (kbd "C-c C-o") #'godef-jump-other-window)
    (define-key m (kbd "C-c C-d") #'godef-describe)
    m))
;; use goimports instead of gofmt ::super
;; (setq gofmt-command "goimports")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto-completion
;;;  Integrates:
;;;   1) Rope
;;;   2) Yasnippet
;;;   all with AutoComplete.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (require 'eclim)
;; (global-eclim-mode)
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)



;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>
(mapc
  (lambda (pair)
    (if (eq (cdr pair) 'perl-mode)
    (setcdr pair 'cperl-mode)))
  (append auto-mode-alist interpreter-mode-alist))


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(defvar markdown-mode-map
  (let ((map (make-keymap)))
    (define-key map (kbd "M-l") 'markdown-next-link)
    (define-key map (kbd "M-L") 'markdown-previous-link)
    map)
  "See `markdown-mode-map'.")
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)
(autoload 'browse-url-interactive-arg "browse-url")
;; (setq browse-url-browser-function 'w3m-browse-url
;;       browse-url-new-window-flag t)

(require 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
(defun my/anzu-update-func (here total)
  (when anzu--state
    (let ((status (cl-case anzu--state
            (search (format "<%d/%d>" here total))
            (replace-query (format "(%d Replaces)" total))
            (replace (format "<%d/%d>" here total)))))
      (propertize status 'face 'anzu-mode-line))))
(setq anzu-mode-line-update-function #'my/anzu-update-func)
;; (setq anzu-cons-mode-line-p nil)
;; (setcar (cdr (assq 'isearch-mode minor-mode-alist))
    ;; '(:eval (anzu--update-mode-line)))
(set-face-attribute 'anzu-mode-line nil
            :foreground "yellow" :weight 'bold)


(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map [(meta r)] 'coffee-compile-file)
     (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

;; folding for sgml-mode
(add-hook 'sgml-mode-hook
      '(lambda()
     (hs-minor-mode 1)))
(add-to-list 'hs-special-modes-alist
     '(sgml-mode
       "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
       ""
       "<!--"
       sgml-skip-tag-forward
       nil))

(defun reformat-xml ()
  "Reformats xml to make it readable (respects current selection)."
  (interactive)
  (save-excursion
    (let ((beg (point-min))
      (end (point-max)))
      (if (and mark-active transient-mark-mode)
      (progn
    (setq beg (min (point) (mark)))
    (setq end (max (point) (mark))))
    (widen))
      (setq end (copy-marker end t))
      (goto-char beg)
      (while (re-search-forward ">\\s-*<" end t)
    (replace-match ">\n<" t t))
      (goto-char beg)
      (indent-region beg end nil))))


;; (require 'mustache-mode)
(require 'web-mode)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-pairing nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-force-tab-indentation 2)
;; (setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-control-block-indentation nil)
(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
(setq web-mode-content-types-alist
  '(("jsx" . "\\.tsx\\'")
    ("jsx"  . "\\.js?\\'")))
;; (setq web-mode-content-types-alist
;;       '(("jsx" . "\\.js[x]?\\'")))
;; (setq web-mode-content-types-alist
;;       '(("jsx" . ".*\\.tsx?")))

(setq web-mode-engines-alist
      '(("php" . "\\.phtml\\'")
        ("django" . "\\.html\\'")
        ("django" . "\\.tmpl\\'")
        ("blade" . "\\.blade\\."))
      )
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#205081" :bold t) ;; #3465A4
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#D04437") ;; #4E9A06 :bold t
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#14892C")   ;; #75507B
;; web-mode-doctype-face, web-mode-html-tag-face, web-mode-html-attr-name-face, web-mode-html-attr-value-face
;; (setq web-mode-comment-style 2)
(setq web-mode-enable-comment-keywords t)
(add-hook 'web-mode-hook
      (lambda()
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode nil)))

(setq js-indent-level 2)

(setq auto-mode-alist
      (append '(("\\.php\\'"   . web-mode)
    ("\\.module$"  . web-mode)
    ("\\.inc$"     . web-mode)
    ("\\.install$" . web-mode)
    ("\\.engine$"  . web-mode)
    ("\\.js\\'"    . web-mode)
    ("\\.jsx$"     . web-mode)
    ("\\.tsx$"     . web-mode)
    ("\\.vue$"     . web-mode)
    ("\\.we$"      . web-mode)
    ("\\.coffee$"  . coffee-mode)
    ("\\.asp\\'"   . web-mode)
    ("\\.less\\'"  . less-css-mode)
    ("\\.ahk\\'"   . xahk-mode)
    ("\\.aspx\\'"  . web-mode)
    ("\\.ascx\\'"  . web-mode)
    ("\\.phtml$"   . html-mode)
    ("\\.djhtml$"  . web-mode)
    ("\\.htm$"     . web-mode)
    ("\\.tmpl\\'"  . web-mode)
    ("\\.html\\'"  . web-mode))
      auto-mode-alist))
;; 将文件模式和文件后缀关联起来。

(add-hook 'css-mode-hook  'rainbow-mode)
(add-hook 'less-css-mode-hook  'rainbow-mode)
(add-hook 'web-mode-hook  'rainbow-mode)
(add-hook 'coffee-mode-hook  'rainbow-mode)
(add-hook 'lisp-mode-hook  'rainbow-mode)
(add-hook 'jinja2-mode-hook  'rainbow-mode)
(add-hook 'go-mode-hook  'rainbow-mode)
(add-hook 'js3-mode-hook  'rainbow-mode)
(add-hook 'js-jsx-mode-hook  'rainbow-mode)

;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'jsx-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'jsx-mode-hook (lambda ()
;;   (set (make-local-variable 'company-backends) '(company-tern))
;;   (company-mode)))


(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(set-face-attribute 'hl-paren-face nil :bold t)

(dolist (hook '(css-mode-hook
    coffee-mode-hook
    conf-mode-hook
    c-mode-common-hook
    c++-mode-hook
    emacs-lisp-mode-hook
    term-mode-hook
    perl-mode-hook
    sh-mode-hook
    text-mode-hook
    web-mode-hook
    css-mode-hook
    less-css-mode-hook
    js-mode-hook
    go-mode-hook
    java-mode-hook
    jinja2-mode-hook
    markdown-mode-hook
    gfm-mode-hook
    magit-status-mode-hook
    js3-mode-hook
    js-jsx-mode-hook
    python-mode-hook
    lisp-mode-hook))
  (add-hook hook (lambda () (linum-mode 1))))
;; (rainbow-identifiers-mode 1)

;; (require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js3-mode
  '(define-key js3-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))
;;(eval-after-load 'json-mode
;;  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
     (lambda ()
       (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

;; (require 'xcscope)
;; (global-set-key [\C-f12] 'cscope-pop-mark)
;; (define-key global-map [(control f3)] 'cscope-set-initial-directory)
;; (define-key global-map [(control f4)] 'cscope-unset-initial-directory)
;; (define-key global-map [(control f5)] 'cscope-find-this-symbol)
;; (define-key global-map [(control f6)] 'cscope-find-global-definition)
;; (define-key global-map [(control f7)]
;;   'cscope-find-global-definition-no-prompting)
;; (define-key global-map [(control f8)] 'cscope-pop-mark)
;; (define-key global-map [(control f9)] 'cscope-next-symbol)
;; (define-key global-map [(control f10)] 'cscope-next-file)
;; (define-key global-map [(control f11)] 'cscope-prev-symbol)
;; (define-key global-map [(control f12)] 'cscope-prev-file)
;; (define-key global-map [(meta f9)] 'cscope-display-buffer)
;; (global-set-key (kbd "M-,") 'cscope-pop-mark)
;; (global-set-key (kbd "M-.") 'cscope-find-global-definition-no-prompting)
;;(defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)



;; python-mode
;;Autofill comments
;;TODO: make this work for docstrings too.
;; but docstrings just use font-lock-string-face unfortunately
(add-hook 'python-mode-hook
      (lambda ()
    (auto-fill-mode 1)
    (setq-default fill-column 200)
    (set (make-local-variable 'fill-nobreak-predicate)
     (lambda ()
       (not (eq (get-text-property (point) 'face)
  'font-lock-comment-face))))))

;; (add-hook 'python-mode-hook 'highlight-indentatoin-mode)
;; (add-hook 'python-mode-hook 'highlight-indentatoin-current-column-mode)

;; pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;;(require 'zencoding-mode)
;;(add-hook 'html-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;; 显示匹配的括号
(show-paren-mode t)
;; 括号匹配
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))
;; 当 % 在括号上按下时，那么匹配括号，否则输入一个 %。

;;(global-set-key "\C-ch" 'highline-mode)
;;(global-set-key "\C-cg" 'global-highline-mode)
;;(global-set-key "\C-cc" 'highline-customize)
;;(global-set-key "\C-cv" 'highline-view-mode)
;;(global-set-key "\C-c2" 'highline-split-window-vertically)
;;(global-set-key "\C-c3" 'highline-split-window-horizontally)


;; 交换两个窗口的内容
;; transpose(interchange) two windows
(defun his-transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
    (next-win (window-buffer (funcall selector))))
    (set-window-buffer (selected-window) next-win)
    (set-window-buffer (funcall selector) this-win)
    (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
;; 交换两个窗口内的 buffer
(global-set-key (kbd "C-c l") 'his-transpose-windows)


(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (require 'browse-kill-ring)
;; (global-set-key [(control c)(k)] 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)
;; 方便的在 kill-ring 里寻找需要的东西。


;; 为 view-mode 加入 vim 的按键。
;; (setq view-mode-hook
;;       (lambda ()
;;     (define-key view-mode-map "h" 'backward-char)
;;     (define-key view-mode-map "l" 'forward-char)
;;     (define-key view-mode-map "j" 'next-line)
;;     (define-key view-mode-map "k" 'previous-line)))

;; tabbar设置
(require 'tabbar-ruler) ;; required mode-icons && tabbar already
;; (setq tabbar-ruler-style 'text )
(tabbar-ruler-group-by-projectile-project)

;; (set-face-attribute 'tabbar-default nil
;;                     :inherit nil
;;                     :stipple nil
;;                     :foreground "#151718"
;;                     :background "#666666" ;#3B758C
;;                     :inverse-video nil
;;                     :strike-through nil
;;                     :overline nil
;;                     :underline nil
;;                     :slant 'normal
;;                     :weight 'normal
;;                     :width 'normal
;;                     :height 92)


;; (set-face-attribute 'tabbar-button nil
;;           :inherit 'tabbar-default
;;           :box nil)

;; (set-face-attribute 'tabbar-selected nil
;;                     :inherit 'tabbar-default
;;                     :stipple nil
;;                     :background "#FFFFFF"
;;                     :foreground "#151718"
;;                     :foundry "outline" )

;; (set-face-attribute 'tabbar-modified nil
;;                    :inherit 'tabbar-default
;;                    :background "#151718"
;;                    :foreground "DarkOrange3"
;;                    :box nil
;;                    :weight 'bold)

;; (defface tabbar-selected-highlight
;;   '((t
;;      :inherit tabbar-default
;;      :weight bold ))
;;   "Face for selected, highlighted tabs."
;;   :group 'tabbar)

(set-face-attribute 'tabbar-selected-modified nil
                    ;; :inherit 'tabbar-default
                    ;; :foreground "red"
                    :background "white"
                    )

;; (set-face-attribute 'tabbar-unselected nil
;;                     :inherit nil
;;                     :stipple nil
;;                     :background "#151718"
;;                     :foreground "#FFFFFF"
;;                     :inverse-video nil
;;                     :box nil
;;                     :strike-through nil
;;                     :overline nil
;;                     :underline nil
;;                     :slant 'normal
;;                     :weight 'normal
;;                     ;; :height 99
;;                     :width 'normal
;;                     :foundry "outline")

;; (defface tabbar-unselected-highlight
;;   '((t
;;      :background "gray90"
;;      :foreground "gray20"
;;      :box (:line-width -1 :color "grey75" :style released-button)
;;      :weight light ))
;;   "Face for unselected, highlighted tabs."
;;   :group 'tabbar)

;; (tabbar-mode 1)
;; (setq tabbar-tab-label-function (lambda (tab) (format " %s " (car tab))))
(setq tabbar-use-images nil)

(global-set-key (kbd "<S-up>") 'tabbar-backward-group)
(global-set-key (kbd "<S-down>") 'tabbar-forward-group)
(global-set-key (kbd "M-n") 'tabbar-backward)
(global-set-key (kbd "M-p") 'tabbar-forward)
(global-set-key (kbd "<S-left>") 'tabbar-backward)
(global-set-key (kbd "<S-right>") 'tabbar-forward)     ; 用 Shift+方向键 切换tab

(setq tabbar-buffer-list-function
    (lambda ()
    (remove-if
      (lambda(buffer)
     (find (aref (buffer-name buffer) 0) " *"))
      (buffer-list))))

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
    ((or (get-buffer-process (current-buffer))
     ;; Check if the major mode derives from `comint-mode' or
     ;; `compilation-mode'.
     (tabbar-buffer-mode-derived-p
      major-mode '(comint-mode compilation-mode)))
     "Process"
     )
    ((member (buffer-name)
     '("*scratch*" "*Messages*"))
     "Common"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    ((memq major-mode
       '(jinja2-mode html-mode json-mode web-mode js-jsx-mode nxml-mode sgml-mode python-mode css-mode scss-mode less-mode less-css-mode javascript-mode coffee-mode js-mode js3-mode))
     "Webcodes"
     )
    ((memq major-mode
       '(help-mode apropos-mode Info-mode Man-mode))
     "Help"
     )
    ((memq major-mode
       '(conf-mode text-mode))
     "Text"
     )
    ((memq major-mode
       '(rmail-mode
     rmail-edit-mode vm-summary-mode vm-mode mail-mode
     mh-letter-mode mh-show-mode mh-folder-mode
     gnus-summary-mode message-mode gnus-group-mode
     gnus-article-mode score-mode gnus-browse-killed-mode))
     "Mail"
     )
    (t
     ;; Return `mode-name' if not blank, `major-mode' otherwise.
     (if (and (stringp mode-name)
      ;; Take care of preserving the match-data because this
      ;; function is called when updating the header line.
      (save-match-data (string-match "[^ ]" mode-name)))
     mode-name
       (symbol-name major-mode))
     ))))

;; tabbar end

(setq highlight-symbol-idle-delay 0.5)

;; (require 'highlight-tail)
;; (setq highlight-tail-colors
;;      '(("#c1e156" . 0)
;;        ("#b8ff07" . 25)
;;        ("#00c377" . 60)))
;;(highlight-tail-mode)

;; calendar & planner begain
;; -------------------------------------------
;; (require 'todo-mode)
;; (require 'cal-china-x)

;; (setq diary-file "~/.emacs.d/plans/.diary")  ;; 默认的日记文件
;; (add-hook 'diary-display-hook 'fancy-diary-display-week-graph)
;; (load-library "cal-desk-calendar")
;; (add-hook 'diary-display-hook 'sort-diary-entries)
;; (add-hook 'diary-display-hook 'fancy-schedule-display-desk-calendar t)

;; planner
;;(setq muse-project-alist
;;   '(("WikiPlanner"
;;     ("~/.emacs.d/plans"   ;; Or wherever you want your planner files to be
;;     :default "index"
;;     :major-mode planner-mode
;;     :visit-link planner-visit-link))))
;;(require 'planner)
;;(global-set-key (kbd "<f8> p") 'planner-create-task-from-buffer)
;;(setq planner-publishing-directory "~/.emacs.d/plans")
;;;;Start planner together with Calendar
;;(planner-calendar-insinuate)
;;(setq planner-calendar-show-planner-files t)
;; -------------------------------------------

;; calendar & planner end here
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;(define-key global-map "\C-cl" 'org-store-link)
;;(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; (require 'tramp)
(setq tramp-auto-save-directory "~/tmp")
;; (setq tramp-default-method "plink")
(setq tramp-default-method "sshx")
(defun tramp-set-auto-save ()
  (auto-save-mode -1))
(setq tramp-debug-buffer nil)
(setq tramp-verbose 100)

(setq auto-save-default nil)
(require 'epa) ;;使用EasyPG

(require 'sublimity)
;; (require 'sublimity-scroll)
(require 'sublimity-map)
(sublimity-map-set-delay 3)
;; (sublimity-mode 1)


(defun reload-dotemacs-file ()
    "reload your .emacs file without restarting Emacs"
    (interactive)
    (load-file "~/.emacs.d/init.el"))


;;(load-theme 'solarized-light t)
;; (load-theme 'monokai t)
;; (require 'color-theme)

;; (setq theme-load-from-file t)
;; (load-file "~/.emacs.d/lisps/themes/color-theme-tango-light.el")
;; (load-file "~/.emacs.d/lisps/themes/color-theme-railscasts.el")
;; (load-file "~/.emacs.d/lisps/themes/tangotangokx-theme.el")
;; (load-file "~/.emacs.d/lisps/themes/mccarthy-theme.el")
;; (load-file "~/.emacs.d/lisps/themes/spolsky-theme.el")
(load-file "~/.emacs.d/lisps/themes/stone-theme.el")

;;(if window-system
;;    (if (> (caddr (decode-time (current-time))) 18)
;;        (color-theme-tango-light)             ;白天光线好用黑色系的主题
;;      (color-theme-tango-2))          ;晚上光线差用深蓝系的主题
;;(color-theme-tty-dark)
;;)

;; (load-theme 'leuven t)
;; (load-theme 'stone t)
;; (color-theme-tango-light)
;;(color-theme-railscasts)

(require 'powerline)
;; (powerline-center-evil-theme)
(powerline-raw mode-line-mule-info nil 'l)
(setq powerline-default-separator 'nil) ;; nil, arrow, brace, slant, arrow-fade, zigzag, wave, roundstub, rounded, chamfer, contour, curve, alternate, butt
;; (setq powerline-default-separator-dir '(right . left))
(powerline-evil-theme)

(require 'nyan-mode)
(nyan-mode 1)
(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)

;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)


(setq multi-term-program "/bin/zsh")
;; (custom-set-variables
;;  '(term-default-bg-color "#000000")        ;; background color (black)
;;  '(term-default-fg-color "#dddd00"))       ;; foreground color (yellow)
(add-hook 'term-mode-hook
      (lambda ()
  (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
  (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))
(add-hook 'term-mode-hook
      (lambda ()
  (setq term-buffer-maximum-size 0)))
(add-hook 'term-mode-hook
      (lambda ()
  (setq show-trailing-whitespace nil)
  (autopair-mode -1)))
(add-hook 'term-mode-hook
      (lambda ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
;; (global-set-key (kbd "C-x C-k") 'server-edit)


;;(load-file "~/.emacs.d/lisps/themes/writer-theme.el")
;;(load-file "~/.emacs.d/lisps/themes/quiet-light-theme.el")
;;(load-file "~/.emacs.d/lisps/themes/tomorrow-night-theme.el")
;; (set-face-background 'highlight-indentation-face "#e3e3d3")
;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
;;session和desktop插件,需要放在最后
;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;(desktop-save-mode 1)
;;(setq desktop-save-directory "~/.emacs.d/desktop/")
;;(setq desktop-buffers-not-to-save
;;     (cncat "\\(" "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
;;      "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
;;      "\\)$"))
;;(add-to-list 'desktop-modes-not-to-save 'dired-mode)
;;(add-to-list 'desktop-modes-not-to-save 'Info-mode)
;;(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;;(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; (require 'redo+)
;; (setq undo-no-redo t)
;; (global-set-key ( kbd "C-.") 'redo)
;; 设置Redo的键绑定
;; (setq max-specpdl-size 32000)


;; Whitespace mode.  lines-tail tabs tab-mark
;; (setq whitespace-style '(spaces tabs  space-mark tab-mark ))
(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
    (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))

;; (custom-set-faces
;;  ;; `(background-mode . light)
;;  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

 `(highlight-indentation-face ((t (:foreground ,"#4f4f4f" :stipple ,(list 9 1 (string 15 0))))))
 `(highlight-indentation-current-column-face ((t (:foreground ,"#6F6F6F" :stipple ,(list 9 1 (string 15 0))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold font-lock-comment-face italic underline success warning error])
 '(ansi-term-color-vector
   [unspecified "#272822" "#f92672" "#a6e22e" "#f4bf75" "#66d9ef" "#ae81ff" "#66d9ef" "#f8f8f2"])
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(company-begin-commands (quote (self-insert-command)))
 '(company-global-modes
   (quote
    (not eshell-mode comint-mode org-mode erc-mode gud-mode)))
 '(company-idle-delay 0.3)
 '(company-tooltip-limit 20)
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "39abe86bff05855be4e2f3ae4e4c91cd472ce02f894899536d3d07fe91e71d47" "30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" default)))
 '(frame-background-mode (quote light))
 '(global-company-mode t)
 '(helm-M-x-fuzzy-match t)
 '(helm-ag-base-command "sift --no-color -n")
 '(helm-buffers-fuzzy-matching t)
 '(helm-echo-input-in-header-line t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-search-library-in-sexp t)
 '(helm-locate-fuzzy-match t)
 '(helm-move-to-line-cycle-in-source t)
 '(helm-quick-update t t)
 '(helm-recentf-fuzzy-match t)
 '(helm-scroll-amount 8)
 '(helm-split-window-in-side-p t)
 '(package-selected-packages
   (quote
    (hungry-delete evil-avy ace-window helm-company company-web cssfmt css-eldoc portage-navi company-go chinese-fonts-setup alchemist evil-anzu 0blayout diff-hl less-css-mode idle-highlight-mode highlight-symbol php-eldoc php-mode go-complete sublimity farmhouse-theme molokai-theme spacemacs-theme js3-mode company-tern spaceline tss typescript typescript-mode helm-ag xahk-mode go-dlv tabbar-ruler rainbow-blocks highlight-parentheses powerline-evil tabbar solarized-theme github-theme helm-swoop ggtags projectile hydra base16-theme redo+ zlc js-doc gtags ace-jump-helm-line helm-go-package helm-gtags helm-fuzzy-find ace-jump-mode evil-matchit evil-leader helm-c-yasnippet helm-themes helm rainbow-identifiers rainbow-mode diminish rainbow-delimiters dash-functional nssh sublime-themes monokai-theme go-eldoc mustache go-snippets markdown-mode web-beautify nginx-mode minimap neotree react-snippets jsx-mode dropdown-list fuzzy browse-kill-ring+ smartparens octopress magit fold-dwim smex web-mode dirtree go-mode nlinum hideshowvis evil emacs-eclim)))
 '(term-default-bg-color "#e5e5e5")
 '(term-default-fg-color "#333333")
 '(vc-annotate-background "#e5e5e5")
 '(vc-annotate-color-map
   (quote
    ((20 . "#660000")
     (40 . "#9e0b0f")
     (60 . "#a0410d")
     (80 . "#a36209")
     (100 . "#aba000")
     (120 . "#598527")
     (140 . "#1a7b30")
     (160 . "#007236")
     (180 . "#00746b")
     (200 . "#0076a3")
     (220 . "#004b80")
     (240 . "#003471")
     (260 . "#1b1464")
     (280 . "#440e62")
     (300 . "#630460")
     (320 . "#9e005d")
     (340 . "#9e0039")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
