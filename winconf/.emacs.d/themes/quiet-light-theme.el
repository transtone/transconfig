;; -*- eval: (progn (rainbow-mode 1) (hl-line-mode -1)) -*-
;;
;; Based on the Quiet Light foam for Espresso, by Ian Beck
;; Source: <http://github.com/onecrayon/quiet-light.foam>
;;
;; Ported to Emacs by Martin Kühl <purl.org/net/mkhl>
;;
;; Extended and ported to custom-theme (emacs24+)
;; by Victor Deryagin <vderyagin@gmail.com>
;;

(deftheme quiet-light "Another light color theme")

(let ((class '((class color) (background light) (min-colors 89)))
      (bg "#e5e5e5") (fg "#333333")
      (gray-1   "#808080")
      (green-1  "#448c27") (green-2  "#a3cfa0") (green-3  "#c9e2c9") (green-4  "#ddffdd")
      (orange-1 "#ab6526") (orange-2 "#e06400") (orange-3 "#e5a775") (orange-4 "#f7d1b4")
      (red-1    "#660000") (red-2    "#aa3731") (red-3    "#ff6b6b")
      (pink-1   "#e7b0b0") (pink-2   "#ffdddd") (pink-3   "#eee3e3")
      (blue-1   "#3c5f8d") (blue-2   "#4b93cd") (blue-3   "#3a5fcd") (blue-4   "#ddddff")
      (purple-1 "#7a3e9d") (purple-2 "#e8c0ff")
      (yellow-1 "#ffffdd"))

  (custom-theme-set-faces
   'quiet-light

   ;; Basics
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor ((,class (:background ,fg :foreground ,fg))))
   `(fringe ((,class (:background "white"))))
   `(link ((,class (:foreground ,blue-3 :underline t))))
   `(link-visited ((,class (:inherit link :foreground ,purple-1))))
   `(error ((,class (:inherit font-lock-warning-face :weight bold))))
   `(warning ((,class (:foreground ,orange-2 :weight bold))))
   `(success ((,class (:foreground ,green-1 :weight bold))))

   ;; Highlighting
   `(hl-line ((,class (:background "white"))))
   `(highlight ((,class (:background ,orange-3 :foreground ,fg))))
   `(region ((,class (:background "#c9d0d9"))))
   `(isearch ((,class (:inherit highlight))))
   `(lazy-highlight ((,class (:background ,orange-4))))
   `(secondary-selection ((,class (:inherit lazy-highlight))))
   `(shadow ((,class (:foreground "#7f7f7f" :background "white"))))
   `(match ((,class (:inherit highlight))))

   ;; Font-lock
   `(font-lock-builtin-face ((,class (:foreground ,blue-1))))
   `(font-lock-comment-face ((,class (:foreground ,gray-1))))
   `(font-lock-constant-face ((,class (:foreground ,orange-1))))
   `(font-lock-function-name-face ((,class (:foreground ,red-2))))
   `(font-lock-keyword-face ((,class (:foreground ,blue-2 :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground "#434343"))))
   `(font-lock-reference-face ((,class (:foreground ,orange-1))))
   `(font-lock-string-face ((,class (:foreground ,green-1))))
   `(font-lock-type-face ((,class (:foreground ,purple-1 :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,purple-1))))
   `(font-lock-warning-face ((,class (:foreground ,red-1 :background ,pink-3))))

   ;; Parens
   `(paren-face-match ((,class (:background ,green-2))))
   `(paren-face-mismatch ((,class (:background ,orange-4))))
   `(paren-face-no-match ((,class (:background ,pink-1))))

   ;; Org
   `(org-agenda-clocking ((,class (:bold t))))
   `(org-agenda-current-time ((,class (:foreground "#555555"))))
   `(org-agenda-date ((,class (:inherit default :slant normal :weight normal :foreground ,orange-1))))
   `(org-agenda-date-today ((,class (:foreground ,orange-1 :box (:line-width -1 :color ,fg)))))
   `(org-agenda-structure ((,class (:inherit font-lock-function-name-face :weight bold))))
   `(org-checkbox ((,class (:inherit bold))))
   `(org-checkbox-statistics-todo ((,class (:inherit bold))))
   `(org-date ((,class (:foreground ,green-1 :weight bold :underline t))))
   `(org-date-selected ((,class (:background ,orange-3))))
   `(org-habit-alert-future-face ((,class (:background "yellow"))))
   `(org-habit-clear-face ((,class (:background ,purple-2))))
   `(org-habit-clear-future-face ((,class (:background "white"))))
   `(org-habit-overdue-face ((,class (:background ,red-3))))
   `(org-habit-overdue-future-face ((,class (:background ,pink-1))))
   `(org-habit-ready-face ((,class (:background ,green-2))))
   `(org-habit-ready-future-face ((,class (:background ,green-3))))
   `(org-hide ((,class (:foreground "white"))))
   `(org-link ((,class (:inherit link))))
   `(org-mode-line-clock ((,class (:background "white"))))
   `(org-mode-line-clock-overrun ((,class (:background ,pink-1))))
   `(org-scheduled ((,class (:inherit default))))
   `(org-scheduled-previously ((,class (:foreground ,red-1 :weight bold))))
   `(org-scheduled-today ((,class (:inherit org-scheduled))))
   `(org-sexp-date ((,class (:inherit org-date :underline nil))))
   `(org-special-keyword ((,class (:foreground ,orange-2 :weight bold))))
   `(org-table ((,class (:foreground ,blue-1))))
   `(org-tag ((,class (:background ,yellow-1 :foreground ,fg :weight bold))))
   `(org-time-grid ((,class (:inherit font-lock-comment-face))))
   `(org-warning ((,class (:inherit font-lock-warning-face :background ,bg :weight bold))))

   ;; Dired+
   `(diredp-compressed-file-suffix ((,class (:inherit diredp-ignored-file-name :weight bold))))
   `(diredp-deletion ((,class (:background ,pink-1 :weight bold))))
   `(diredp-deletion-file-name ((,class (:inherit diredp-deletion))))
   `(diredp-dir-heading ((,class (:inherit bold :background "white"))))
   `(diredp-dir-priv ((,class (:inherit bold))))
   `(diredp-executable-tag ((,class (:inherit font-lock-function-name-face))))
   `(diredp-file-name ((,class (:foreground ,blue-1))))
   `(diredp-file-suffix ((,class (:inherit diredp-file-name :weight bold))))
   `(diredp-flag-mark ((,class (:background ,purple-2 :weight bold))))
   `(diredp-flag-mark-line ((,class (:inherit diredp-flag-mark))))
   `(diredp-ignored-file-name ((,class (:inherit font-lock-string-face))))
   `(diredp-mode-line-flagged ((,class (:foreground ,red-2 :weight bold))))
   `(diredp-mode-line-marked ((,class (:foreground ,purple-1 :weight bold))))
   `(diredp-number ((,class (:inherit bold))))
   `(diredp-symlink ((,class (:foreground ,gray-1))))

   ;; ERC
   `(erc-current-nick-face ((,class (:foreground ,red-2 :weight bold))))
   `(erc-notice-face ((,class (:inherit font-lock-comment-face))))
   `(erc-prompt-face ((,class (:inherit minibuffer-prompt))))
   `(erc-timestamp-face ((,class (:foreground ,green-1 :weight bold))))

   ;; Diff Mode
   `(diff-file-header ((,class (:bold t :inherit diff-header))))
   `(diff-header ((,class (:background ,blue-4 :foreground ,fg))))
   `(diff-added ((,class (:background ,green-4))))
   `(diff-removed ((,class (:background ,pink-2))))
   `(diff-changed ((,class (:background ,yellow-1))))
   `(diff-refine-change ((,class (:background ,blue-4))))

   ;; Magit
   '(magit-header ((t (:inherit header-line :background "white" :weight bold))))
   `(magit-diff-add ((,class (:inherit diff-added :foreground ,fg))))
   `(magit-diff-del ((,class (:inherit diff-removed :foreground ,fg))))
   `(magit-diff-file-header ((,class (:inherit diff-header))))
   `(magit-diff-hunk-header ((,class (:inherit diff-header))))
   `(magit-diff-none ((,class (:inherit diff-context :foreground ,fg))))
   `(magit-item-highlight ((,class (:weight bold))))

   ;; ahg
   `(ahg-status-marked-face ((,class (:inherit diredp-flag-mark))))
   `(ahg-header-line-face ((,class (:inherit header-line :background "white" :weight bold))))
   `(ahg-header-line-root-face ((,class (:inherit font-lock-constant-face :background "white"))))

   ;; bookmark+
   `(bmkp->-mark ((,class (:inherit diredp-flag-mark))))
   `(bmkp-gnus ((,class (:foreground ,orange-1))))
   `(bmkp-info ((,class (:inherit bmkp-man :weight bold))))
   `(bmkp-man ((,class (:foreground ,green-1))))
   `(bmkp-function ((,class (:inherit font-lock-function-name-face))))
   `(bmkp-D-mark ((,class (:inherit diredp-deletion))))
   `(bmkp-url ((,class (:inherit font-lock-variable-name-face))))
   `(bmkp-heading ((,class (:foreground ,purple-1 :weight bold))))
   `(bmkp-local-directory ((,class (:inherit diredp-dir-priv))))
   `(bmkp-local-file-without-region ((,class (:inherit diredp-file-name))))
   `(bmkp-local-file-with-region ((,class (:inherit region))))
   `(bmkp-non-file ((,class (:inherit font-lock-comment-face))))
   `(bmkp-su-or-sudo ((,class (:foreground ,red-1))))
   `(bmkp-url ((,class (:inherit link :underline nil))))

   ;; Jabber.el
   `(jabber-chat-error ((,class (:foreground ,red-1 :weight bold))))
   `(jabber-chat-prompt-local ((,class (:foreground ,blue-3 :weight bold))))
   `(jabber-chat-prompt-system ((,class (:foreground ,green-1 :weight bold))))
   `(jabber-roster-user-chatty ((,class (:foreground ,orange-1 :slant normal :weight bold))))
   `(jabber-roster-user-online ((,class (:foreground ,blue-3 :slant normal :weight bold))))
   `(jabber-title-large ((,class (:inherit variable-pitch :weight bold :height 2.0 :width ultra-expanded))))
   `(jabber-title-medium ((,class (:inherit variable-pitch :weight bold :height 1.5 :width expanded))))

   ;; Outline
   `(outline-1 ((,class (:inherit font-lock-function-name-face :weight bold))))
   `(outline-2 ((,class (:inherit font-lock-variable-name-face :weight normal))))
   `(outline-3 ((,class (:inherit font-lock-keyword-face :weight normal))))
   `(outline-4 ((,class (:inherit font-lock-string-face :weight normal))))
   `(outline-5 ((,class (:inherit font-lock-type-face :weight normal))))
   `(outline-6 ((,class (:inherit font-lock-constant-face :weight normal))))
   `(outline-7 ((,class (:inherit font-lock-builtin-face :weight normal))))
   `(outline-8 ((,class (:inherit font-lock-comment-face :weight normal))))

   ;; w3m
   `(w3m-anchor ((,class (:inherit link))))
   `(w3m-arrived-anchor ((,class (:inherit link-visited))))
   `(w3m-form ((,class (:foreground ,blue-2 :underline t))))
   `(w3m-header-line-location-title ((,class (:inherit link))))

   ;; IDO
   `(ido-subdir ((,class (:inherit diredp-dir-priv))))

   ;; Info
   `(info-command-ref-item ((,class (:background "white" :foreground ,blue-4))))
   `(info-file ((,class (:inherit info-command-ref-item))))
   `(info-node ((,class (:inherit font-lock-type-face))))

   ;; IRFC
   `(irfc-rfc-number-face ((,class (:foreground ,green-1 :underline t :weight bold))))
   `(irfc-table-item-face ((,class (:foreground ,blue-1 :weight bold))))
   `(irfc-title-face ((,class (:foreground ,orange-1 :weight bold))))
   `(irfc-reference-face ((,class (:weight bold :foreground ,purple-1))))
   `(irfc-requirement-keyword-face ((,class (:weight bold :foreground ,red-1))))
   `(irfc-std-number-face ((,class (:inherit font-lock-comment-face :weight bold))))
   `(irfc-rfc-link-face ((,class (:inherit link))))

   ;; Eshell
   `(eshell-ls-archive ((,class (:foreground ,purple-1 :weight bold))))
   `(eshell-ls-directory ((,class (:foreground ,blue-1 :weight bold))))
   `(eshell-prompt ((,class (:inherit minibuffer-prompt))))

   ;; Compilation
   `(compilation-error ((,class (:inherit font-lock-warning-face :weight bold))))
   `(compilation-mode-line-fail ((,class (:inherit compilation-error))))
   `(compilation-info ((,class (:background ,bg :foreground ,green-1 :weight bold))))
   `(compilation-warning ((,class (:background ,bg :foreground ,orange-2 :weight bold))))

   ;; Custom
   `(custom-group-tag ((,class (:inherit variable-pitch :foreground ,blue-3 :weight bold :height 1.2))))
   `(custom-variable-tag ((,class (:foreground ,blue-3 :weight bold))))

   ;; Helm
   `(helm-M-x-key ((,class (:inherit font-lock-builtin-face :weight bold))))
   `(helm-bookmark-directory ((,class (:inherit diredp-dir-priv))))
   `(helm-bookmark-file ((,class (:inherit diredp-file-name))))
   `(helm-bookmark-gnus ((,class (:foreground ,orange-1))))
   `(helm-bookmark-info ((,class (:foreground ,green-1 :weight bold))))
   `(helm-bookmark-w3m ((,class (:inherit link))))
   `(helm-bookmarks-su ((,class (:foreground ,red-1))))
   `(helm-buffer-not-saved ((,class (:foreground ,red-2))))
   `(helm-buffer-saved-out ((,class (:inherit font-lock-warning-face))))
   `(helm-buffer-size ((,class (:inherit font-lock-builtin-face))))
   `(helm-candidate-number ((,class (:inherit mode-line :background "white"))))
   `(helm-ff-directory ((,class (:inherit diredp-dir-priv))))
   `(helm-ff-executable ((,class (:foreground ,orange-1))))
   `(helm-ff-file ((,class (:inherit diredp-file-name))))
   `(helm-ff-prefix ((,class (:background ,yellow-1 :foreground ,fg))))
   `(helm-ff-symlink ((,class (:inherit diredp-symlink))))
   `(helm-grep-lineno ((,class (:inherit compilation-warning :underline t))))
   `(helm-header ((,class (:inherit bold :background "#bfbfbf"))))
   `(helm-lisp-completion-info ((,class (:inherit default :background "white"))))
   `(helm-lisp-show-completion ((,class (:background ,green-3))))
   `(helm-moccur-buffer ((,class (:inherit compilation-info, :underline t))))
   `(helm-selection ((,class (:background "white"))))
   `(helm-selection-line ((,class (:background ,yellow-1))))
   `(helm-separator ((,class (:foreground ,gray-1))))
   `(helm-source-header ((,class (:inherit org-agenda-structure))))
   `(helm-time-zone-current ((,class (:foreground ,green-1 :box (:line-width -1 :color ,fg)))))
   `(helm-time-zone-home ((,class (:foreground ,orange-1 ))))
   `(helm-visible-mark ((,class (:inherit diredp-flag-mark))))

   ;; sh
   `(sh-heredoc ((,class (:foreground ,orange-2))))
   `(sh-quoted-exec ((,class (:foreground ,red-1))))

   ;; Mode Line
   `(mode-line ((,class (:background "#bfbfbf" :box (:line-width -1 :color ,fg)))))
   `(mode-line-highlight ((,class (:box (:line-width -2 :color ,fg)))))
   `(mode-line-inactive ((,class (:background ,bg :box (:line-width -1 :color "#999999")))))

   ;; Flymake
   `(flymake-warnline ((,class (:background ,yellow-1))))
   `(flymake-errline ((,class (:background ,pink-1))))

   ;; Slime
   `(slime-repl-inputed-output-face ((,class (:foreground ,red-2 :weight bold))))
   `(slime-repl-prompt-face ((,class (:inherit minibuffer-prompt))))

   ;; Misc
   `(c-annotation-face ((,class (:inherit font-lock-type-face))))
   `(comint-highlight-prompt ((,class (:inherit minibuffer-prompt))))
   `(desktop-entry-group-header-face ((,class (:inherit font-lock-type-face))))
   `(linum ((,class (:background "#d0d0d0" :foreground ,fg))))
   `(minibuffer-prompt ((,class (:foreground ,blue-1 :weight bold))))
   `(proced-marked ((,class (:inherit diredp-flag-mark))))
   `(which-func ((,class (:inherit font-lock-function-name-face :weight bold))))
   `(woman-bold ((,class (:inherit font-lock-string-face :weight bold))))
   `(woman-addition ((,class (:inherit font-lock-builtin-face :weight bold))))
   `(widget-button ((,class (:underline nil :weight bold))))
   `(dropdown-list-selection-face ((,class (:inherit ac-selection-face))))
   `(dropdown-list-face ((,class (:inherit ac-candidate-face))))
   `(yas-field-highlight-face ((,class (:background ,green-3))))
   `(ac-completion-face ((,class (:background ,green-3))))

   ;; Twittering-mode
   `(my-twittering-metainfo-face ((,class (:foreground "#888888"))))
   `(my-twittering-username-face ((,class (:weight bold :height 130 :underline nil))))
   `(twittering-username-face ((,class (:weight bold :foreground ,orange-1 :underline nil))))
   `(twittering-uri-face ((,class (:inherit link))))

   ;; Gnus
   `(gnus-summary-cancelled ((,class (:inherit diredp-deletion))))
   `(gnus-summary-selected ((,class (:background "white"))))
   `(gnus-summary-normal-ancient ((,class (:foreground "#666666"))))

   `(gnus-group-news-1-empty ((,class (:foreground ,purple-1))))
   `(gnus-group-news-1 ((,class (:inherit gnus-group-news-1-empty :weight bold))))
   `(gnus-group-news-2-empty ((,class (:foreground ,blue-1))))
   `(gnus-group-news-2 ((,class (:inherit gnus-group-news-2-empty :weight bold))))
   `(gnus-group-news-3-empty ((,class (:foreground ,red-1))))
   `(gnus-group-news-3 ((,class (:inherit gnus-group-news-3-empty :weight bold))))
   `(gnus-group-news-4-empty ((,class (:foreground ,orange-1))))
   `(gnus-group-news-4 ((,class (:inherit gnus-group-news-4-empty :weight bold))))
   `(gnus-group-news-5-empty ((,class (:foreground ,orange-2))))
   `(gnus-group-news-5 ((,class (:inherit gnus-group-news-5-empty :weight bold))))
   `(gnus-group-news-low ((,class (:foreground "#888a85"))))

   `(gnus-group-mail-1 ((,class (:inherit gnus-group-news-1))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:inherit gnus-group-news-2))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:inherit gnus-group-news-3))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-low ((,class (:inherit gnus-group-news-low))))

   `(gnus-header-content ((,class (:foreground ,green-1))))
   `(gnus-header-from ((,class (:weight bold :foreground ,orange-1))))
   `(gnus-header-name ((,class (:inherit font-lock-builtin-face :weight bold))))
   `(gnus-header-newsgroups ((,class (:foreground "#888a85"))))
   `(gnus-header-subject ((,class (:foreground ,red-2 :weight bold))))

   ;; Message
   `(message-header-name ((,class (:inherit gnus-header-name))))
   `(message-header-subject ((,class (:inherit gnus-header-subject))))
   `(message-header-cc ((,class (:foreground ,orange-1))))
   `(message-header-other ((,class (:foreground ,orange-1))))
   `(message-header-to ((,class (:weight bold :foreground ,orange-1))))
   `(message-cited-text ((,class (:foreground "#888a85"))))
   `(message-separator ((,class (:weight bold :foreground ,green-1))))

   ;; Speedbar
   `(speedbar-button-face ((,class (:inherit bold))))
   `(speedbar-directory-face ((,class (:inherit diredp-dir-priv))))
   `(speedbar-file-face ((,class (:inherit diredp-file-name))))
   `(speedbar-highlight-face ((,class (:background ,orange-4))))
   `(speedbar-selected-face ((,class (:inherit speedbar-file-face :box (:line-width -1 :color ,fg) :weight bold))))
   `(speedbar-separator-face ((,class (:background ,blue-1 :foreground ,fg))))

   ;; textile-mode
   `(textile-acronym-face ((,class (:inherit font-lock-type-face))))
   `(textile-alignments-face ((,class (:inherit textile-acronym-face))))
   `(textile-class-face ((,class (:inherit font-lock-string-face :weight bold))))
   `(textile-code-face ((,class (:inherit org-code))))
   `(textile-image-face ((,class (:inherit font-lock-constant-face))))
   `(textile-lang-face ((,class (:inherit font-lock-keyword-face))))
   `(textile-link-face ((,class (:inherit link))))
   `(textile-ol-bullet-face ((,class (:inherit font-lock-function-name-face))))
   `(textile-pre-face ((,class (:inherit font-lock-string-face))))
   `(textile-ul-bullet-face ((,class (:inherit bold))))

   ;; whitespace
   `(whitespace-trailing ((,class (:inherit font-lock-comment-face :background "white"))))
   `(whitespace-tab ((,class (:inherit whitespace-trailing :background ,yellow-1))))
   `(whitespace-space-before-tab ((,class (:inherit whitespace-tab))))
   `(whitespace-space-after-tab ((,class (:inherit whitespace-tab))))

   ;; gomoku
   `(gomoku-O ((,class (:inherit bold :foreground ,red-2))))
   `(gomoku-X ((,class (:inherit bold :foreground ,green-1))))

   ;; ERT
   `(ert-test-result-expected ((,class (:foreground ,fg :background ,green-2))))
   `(ert-test-result-unexpected ((,class (:foreground ,fg :background ,pink-1))))

   ;; rhtml
   `(erb-delim-face ((,class (:inherit font-lock-preprocessor-face :weight bold))))
   `(erb-face ((,class (:background "white"))))
   `(erb-out-delim-face ((,class (:inherit erb-delim-face :foreground ,red-2 :weight bold))))
   `(erb-comment-face ((,class (:inherit bold :foreground ,green-1))))

   ;; term
   `(term-face ((,class (:inherit default))))
   `(term-color-black ((,class (:foreground ,fg))))
   `(term-color-green ((,class (:foreground ,green-1))))
   `(term-color-yellow ((,class (:foreground ,orange-1))))
   `(term-color-blue ((,class (:foreground ,blue-1))))
   `(term-color-magenta ((,class (:foreground ,purple-1))))
   `(term-color-cyan ((,class (:foreground ,blue-2))))

   ;; nrepl
   `(nrepl-error-face ((,class (:inherit font-lock-warning-face)))))

  (custom-theme-set-variables
   'quiet-light
   `(ansi-color-names-vector [,fg ,red-2 ,green-1 ,orange-1 ,blue-1 ,purple-1 ,blue-2 "#999999"])
   `(ansi-color-faces-vector [default bold font-lock-comment-face italic underline success warning error])
   '(frame-background-mode 'light)
   `(term-default-bg-color ,bg)
   `(term-default-fg-color ,fg)
   `(vc-annotate-background ,bg)
   '(vc-annotate-color-map '((20  . "#660000") (40  . "#9e0b0f") (60  . "#a0410d") (80  . "#a36209")
                             (100 . "#aba000") (120 . "#598527") (140 . "#1a7b30") (160 . "#007236")
                             (180 . "#00746b") (200 . "#0076a3") (220 . "#004b80") (240 . "#003471")
                             (260 . "#1b1464") (280 . "#440e62") (300 . "#630460") (320 . "#9e005d")
                             (340 . "#9e0039")))))

(provide-theme 'quiet-light)

;; Local Variables:
;; no-byte-compile: t
;; coding: utf-8
;; End:
