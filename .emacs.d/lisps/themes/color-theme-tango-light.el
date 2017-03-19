;;; Color theme based on Tango Palette.
;;; Created by zhuqin <zhuqin83@gmail.com>

(defun color-theme-tango-light ()
  "A color theme based on Tango Palette."
  (interactive)
  (color-theme-install
   '(color-theme-tango-light
     ((background-color . "#ffffff")
      (background-mode . light)
      (border-color . "#eeeeec")
      (cursor-color . "#3465a4")
      (foreground-color . "#1a1a1a")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face ((t (:foreground "#3465a4"))))
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face ((t (:foreground "#75507b"))))
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (fringe ((t (:background "#eeeeec"))))
     (mode-line ((t (:foreground "#ffffff" :background "#3465a4" :box (:style released-button)))))
     (region ((t (:background "#fce94f"))))
     (font-latex-math-face ((t (:foreground "#8f5902"))))
     (font-latex-sedate-face ((t (:foreground "#204a87"))))
     ;; (font-latex-string-face ((t (:foreground "#4e9a06"))))
     (font-latex-warning-face ((t (:foreground "#ef2929" :bold t))))
     (font-lock-builtin-face ((t (:foreground "#3465a4"))))
     (font-lock-comment-face ((t (:foreground "#729fcf"))))
     (font-lock-constant-face ((t (:foreground "#c4a000" :bold t))))
     (font-lock-doc-face ((t (:foreground "#c17d11"))))
     ;; (font-lock-doc-string-face ((t (:foreground "mediumvioletred"))))
     (font-lock-keyword-face ((t (:foreground "#ce5c00" :bold t))))
     (font-lock-string-face ((t (:foreground "#75507b"))))
     (font-lock-type-face ((t (:foreground "#5c3566" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#4e9a06" :bold t))))
     (font-lock-warning-face ((t (:bold t :foreground "#ef2929"))))
     (font-lock-function-name-face ((t (:foreground "#3465a4" :bold t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:background "#e9b96e" :foreground "#2e3436"))))
     (show-paren-match-face ((t (:background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#3465a4" :bold t))))
     (info-xref ((t (:foreground "#3465a4"))))
     (info-xref-visited ((t (:foreground "#75507b"))))
     (highlight ((t (:background "#d3d7cf"))))

     (modeline ((t (:background "#3F3B3B" :foreground "white"))))
     (modeline-buffer-id ((t (:background "#3F3B3B" :foreground
                                          "white"))))
     (modeline-mousable ((t (:background "#a5baf1" :foreground
                                         "black"))))
     (modeline-mousable-minor-mode ((t (:background
                                        "#a5baf1" :foreground "black"))))
     (region ((t (:background "#3B3B3F"))))
     (primary-selection ((t (:background "#3B3B3F"))))
     (isearch ((t (:background "#555555"))))
     (zmacs-region ((t (:background "#555577"))))
     (secondary-selection ((t (:background "#545459"))))
     (flymake-errline ((t (:background "LightSalmon" :foreground
                                       "black"))))
     (flymake-warnline ((t (:background "LightSteelBlue" :foreground
                                        "black"))))
     

     (org-date ((t (:foreground "LightSteelBlue" :underline t))))
     (org-hide ((t (:foreground "#2e3436"))))
     (org-todo ((t (:inherit font-lock-keyword-face :bold t))))
     (org-level-1 ((t (:inherit font-lock-function-name-face))))
     (org-level-2 ((t (:inherit font-lock-variable-name-face))))
     (org-level-3 ((t (:inherit font-lock-keyword-face))))
     (org-level-4 ((t (:inherit font-lock-string-face))))
     (org-level-5 ((t (:inherit font-lock-constant-face))))

     (vertical-border ((t (:foreground "#ffffff" :background  "#ffffff"))))

     (ido-subdir ((t (:foreground "#CF6A4C"))))
     (ido-first-match ((t (:foreground "#8F9D6A"))))
     (ido-only-match ((t (:foreground "#8F9D6A"))))
     
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))

     )))

(provide 'color-theme-tango-light)
