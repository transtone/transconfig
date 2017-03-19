;;; rainbow-blocks-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "rainbow-blocks" "rainbow-blocks.el" (22082
;;;;;;  51597 0 0))
;;; Generated autoloads from rainbow-blocks.el

(autoload 'rainbow-blocks-mode "rainbow-blocks" "\
Highlight nested parentheses, brackets, and braces according to their depth.

\(fn &optional ARG)" t nil)

(autoload 'rainbow-blocks-mode-enable "rainbow-blocks" "\


\(fn)" nil nil)

(autoload 'rainbow-blocks-mode-disable "rainbow-blocks" "\


\(fn)" nil nil)

(defvar global-rainbow-blocks-mode nil "\
Non-nil if Global-Rainbow-Blocks mode is enabled.
See the command `global-rainbow-blocks-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-rainbow-blocks-mode'.")

(custom-autoload 'global-rainbow-blocks-mode "rainbow-blocks" nil)

(autoload 'global-rainbow-blocks-mode "rainbow-blocks" "\
Toggle Rainbow-Blocks mode in all buffers.
With prefix ARG, enable Global-Rainbow-Blocks mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Rainbow-Blocks mode is enabled in all buffers where
`rainbow-blocks-mode-enable' would do it.
See `rainbow-blocks-mode' for more information on Rainbow-Blocks mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; rainbow-blocks-autoloads.el ends here
