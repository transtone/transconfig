(defun color-theme-zen-and-art2 ()
  "Irfn's zen with a bit of art. transtone make some change"
  (interactive)
  (color-theme-install
   '(color-theme-zen-and-art2
     (;;(background-color . "#191717")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#D2DEC4")
      (list-matching-lines-face . bold)
      (view-highlight-face . highlight))
     (default ((t (nil))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (fringe ((t (:background "#252323"))))
		 (highlight-current-line-face ((t (:background "#252323"))))
     (font-lock-builtin-face ((t (:foreground "#86453A"))))
     (font-lock-comment-face ((t (:italic t :foreground "#333B40"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#4C565D"))))
     (font-lock-constant-face ((t (:foreground "#86453A"))))
     (font-lock-function-name-face ((t (:bold t :foreground "#C6B032"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#AE5825"))))
     (font-lock-preprocessor-face ((t (:foreground "#007575"))))
     (font-lock-reference-face ((t (:foreground "#0055FF"))))
     (font-lock-string-face ((t (:foreground "#5A7644"))))
     (font-lock-doc-face ((t (:foreground "#DDFFD1"))))
     (font-lock-type-face ((t (:italic t :foreground "#C6B032"))))
     (font-lock-variable-name-face ((t (:bold t :foreground "#46657B"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (paren-face-match-light ((t (:background "#252323"))))
     (highlight ((t (:background "darkolivegreen"))))
     (italic ((t (:italic t))))
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

     (linum ((t (:foreground "#888a85"))))

     (minibuffer-prompt ((t (:foreground "#888888"))))
     (ido-subdir ((t (:foreground "#CF6A4C"))))
     (ido-first-match ((t (:foreground "#8F9D6A"))))
     (ido-only-match ((t (:foreground "#8F9D6A"))))
     
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (region ((t (:background "#660000"))))
     (highlight ((t (:background "#151515"))))
     (highline-face ((t (:background "#252525"))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))

     ;; mumamo
     ;;(mumamo-background-chunk-major ((t (:background "#000000"))))
     (mumamo-background-chunk-submode ((t (:background "#222222"))))
     (mumamo-background-chunk-submode1 ((t (:background "#0A0A0A"))))
     (mumamo-background-chunk-submode2 ((t (:background "#0A0A0A"))))
     (mumamo-background-chunk-submode3 ((t (:background "#0A0A0A"))))
     (mumamo-background-chunk-submode4 ((t (:background "#0A0A0A"))))

     ;; yasnippet && auto-complete
     (yas/field-highlight-face ((t (:background "#729fcf"))))
     (ac-yasnippet-candidate-face ((t (:background "#ffffe0" :foreground "coral3"))))
     (ac-yasnippet-selection-face ((t (:background "steelblue" :foreground "white"))))
     (ac-completion-face ((t (:background "darkblue" :foreground "white"))))
     (ac-candidate-face ((t (:background "lightgray" :foreground "navy"))))
     (ac-selection-face ((t (:background "steelblue" :foreground "white"))))

     ;; diff-mode
     (diff-added ((t (:background "#253B22" :foreground "#F8F8F8"))))
     (diff-removed ((t (:background "#420E09" :foreground "#F8F8F8"))))
     (diff-content ((t nil)))
     (diff-header ((t (:background "#0E2231" :foreground "#F8F8F8"))))
     


     (underline ((t (:underline t))))
     (minibuffer-prompt ((t (:bold t :foreground "#ff6600")))))))