;;; tangotango-theme.el --- Tango Palette color theme for Emacs 24.

;; First derived from color-theme-tango.el,  created by danranx@gmail.com :
;; http://www.emacswiki.org/emacs/color-theme-tango.el

;; Copyright (C) 2011, 2012 Julien Barnier <julien@nozav.org>

;; Author: Julien Barnier
;; Adapted-By: Yesudeep Mangalapilly
;; Keywords: tango palette color theme emacs
;; URL: https://github.com/juba/color-theme-tangotango
;; Version: 0.0.4

;; kodx version 0.0.1
;; modified by Yegor Bayev <baev.egor@gmail.com>

;; This file is NOT part of GNU Emacs.

;; For screenshots and installation instructions :
;; http://blog.nozav.org/post/2010/07/12/Updated-tangotango-emacs-color-theme

;;; License:

;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.

;;; Code:

(deftheme tangotangokx
  "A color theme based on the Tango Palette colors.")

(custom-theme-set-faces
 'tangotangokx
 ;; Color codes :
 ;; - blue :       "#1e90ff"
 ;; - yellow :     "#fcaf3d"
 ;; - green :      "#6ac214"
 ;; - orange/red : "#ff6347"
;; `(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :height 90 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#eeeeec" :background "#2e3434" :stipple nil :inherit nil))))
 `(default ((t (:foreground "#d3d7cf" :background "#2e3434" :stipple nil :inherit nil))))
 ;; `(cursor ((t (:foreground "#222222" :background "#fce94f"))))
 `(cursor ((t (:foreground "#222222" :background "#ffaf00"))))
 `(fixed-pitch ((t (:inherit (default)))))
 `(variable-pitch ((t (:family "Sans Serif"))))
 `(escape-glyph ((((background dark)) (:foreground "#00ffff")) (((type pc)) (:foreground "#ff00ff")) (t (:foreground "#a52a2a"))))
 `(minibuffer-prompt ((t (:weight bold :foreground "#729fcf"))))
 `(highlight ((t (:background "#8b2323"))))
 `(region ((t (:background "#555753"))))
 `(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "#7f7f7f")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "#b3b3b3")) (((class color) (min-colors 8) (background light)) (:foreground "#00ff00")) (((class color) (min-colors 8) (background dark)) (:foreground "#ffff00"))))
 `(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "#ffff00")) (((class color) (min-colors 88) (background dark)) (:background "#00688b")) (((class color) (min-colors 16) (background light)) (:background "#ffff00")) (((class color) (min-colors 16) (background dark)) (:background "#00688b")) (((class color) (min-colors 8)) (:foreground "#000000" :background "#00ffff")) (t (:inverse-video t))))
 `(trailing-whitespace ((((class color) (background light)) (:background "#ff0000")) (((class color) (background dark)) (:background "#ff0000")) (t (:inverse-video t))))
 `(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground "#888a85"))))
 `(font-lock-constant-face ((t (:foreground "#8ae234"))))
 `(font-lock-doc-face ((t (:foreground "#888a85"))))
;; `(font-lock-function-name-face ((t (:weight bold :foreground "#edd400"))))
 `(font-lock-function-name-face ((t (:weight bold :foreground "#fcaf3d"))))
 `(font-lock-keyword-face ((t (:weight bold :foreground "#729fcf"))))
 `(font-lock-negation-char-face ((t nil)))
 `(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 `(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
;; `(font-lock-string-face ((t (:slant italic :foreground "#ad7fa8"))))
 `(font-lock-string-face ((t (:foreground "#ad7fa8"))))
 `(font-lock-type-face ((t (:weight bold :foreground "#8ae234"))))
;; `(font-lock-variable-name-face ((t (:foreground "#ff6347"))))
 `(font-lock-variable-name-face ((t (:foreground "#ff6347"))))
 `(font-lock-warning-face ((t (:weight bold :foreground "#f57900"))))
 `(button ((t (:inherit (link)))))
 `(link ((t (:foreground "#1e90ff" :underline (:color foreground-color :style line)))))
 `(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "#8b008b")) (((class color) (background dark)) (:foreground "#ee82ee"))))
 `(fringe ((t (:background "#1a1a1a"))))
 `(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "#333333" :background "#e5e5e5")) (((class color grayscale) (background dark)) (:box nil :foreground "#e5e5e5" :background "#333333")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "#000000" :background "#ff0000")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "#ff0000" :background "#000000"))))
 `(tooltip ((t (:background "#ffffe0" :foreground "#000000" :inherit (quote variable-pitch)))))
 `(mode-line ((t (:box (:line-width 1 :color nil :style released-button) :background "#222222" :foreground "#bbbbbc"))))
 `(mode-line-buffer-id ((t (:weight bold :foreground "#ffa500"))))
 `(mode-line-emphasis ((t (:weight bold))))
 `(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "#666666" :style released-button))) (t (:inherit (highlight)))))
 `(mode-line-inactive ((t (:background "#555753" :foreground "#bbbbbc"))))
 `(isearch ((t (:foreground "#2e3436" :background "#f57900"))))
 `(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "#ffc1c1")) (((class color) (min-colors 88) (background dark)) (:background "#8b0000")) (((class color) (min-colors 16)) (:background "#ff0000")) (((class color) (min-colors 8)) (:background "#ff0000")) (((class color grayscale)) (:foreground "#bebebe")) (t (:inverse-video t))))
 `(lazy-highlight ((t (:foreground "#2e3436" :background "#e9b96e"))))
 `(match ((t (:weight bold :foreground "#2e3436" :background "#e9b96e"))))
 `(next-error ((t (:inherit (region)))))
 `(query-replace ((t (:inherit (isearch)))))
 `(show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
 `(show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
 `(info-xref ((t (:foreground "#729fcf"))))
 `(info-xref-visited ((t (:foreground "#ad7fa8"))))
 `(diary-face ((t (:bold t :foreground "#cd5c5c"))))
 `(eshell-ls-clutter-face ((t (:bold t :foreground "#696969"))))
 `(eshell-ls-executable-face ((t (:bold t :foreground "#ff7f50"))))
 `(eshell-ls-missing-face ((t (:bold t :foreground "#000000"))))
 `(eshell-ls-special-face ((t (:bold t :foreground "#ffd700"))))
 `(eshell-ls-symlink-face ((t (:bold t :foreground "#ff0000"))))
 `(widget-button ((t (:bold t))))
 `(widget-mouse-face ((t (:bold t :foreground "#ff0000" :background "#8b2323"))))
 `(widget-field ((t (:foreground "#ffa500" :background "#4d4d4d"))))
 `(widget-single-line-field ((t (:foreground "#ffa500" :background "#4d4d4d"))))
 `(custom-group-tag ((t (:bold t :foreground "#fcaf3d" :height 1.3))))
 `(custom-variable-tag ((t (:bold t :foreground "#fcaf3d" :height 1.1))))
 `(custom-face-tag ((t (:bold t :foreground "#fcaf3d" :height 1.1))))
 `(custom-state-face ((t (:foreground "#729fcf"))))
 `(custom-button  ((t (:box (:line-width 1 :style released-button) :background "#7f7f7f" :foreground "#000000"))))
 `(custom-variable-button ((t (:inherit 'custom-button))))
 `(custom-button-mouse  ((t (:inherit 'custom-button :background "#999999"))))
 `(custom-button-unraised  ((t (:background "#7f7f7f" :foreground "#000000"))))
 `(custom-button-mouse-unraised  ((t (:inherit 'custom-button-unraised :background "#999999"))))
 `(custom-button-pressed  ((t (:inherit 'custom-button :box (:style pressed-button)))))
 `(custom-button-mouse-pressed-unraised  ((t (:inherit 'custom-button-unraised :background "#999999"))))
 `(custom-documentation ((t (:italic t))))
 `(message-cited-text ((t (:foreground "#fcaf3d"))))
 `(gnus-cite-face-1 ((t (:foreground "#ad7fa8"))))
 `(gnus-cite-face-2 ((t (:foreground "#8b4726"))))
 `(gnus-cite-face-3 ((t (:foreground "#8b864e"))))
 `(gnus-cite-face-4 ((t (:foreground "#668b8b"))))
 `(gnus-group-mail-1-empty((t (:foreground "#e0ffff"))))
 `(gnus-group-mail-1((t (:bold t :foreground "#e0ffff"))))
 `(gnus-group-mail-2-empty((t (:foreground "#40e0d0"))))
 `(gnus-group-mail-2((t (:bold t :foreground "#40e0d0"))))
 `(gnus-group-mail-3-empty((t (:foreground "#729fcf"))))
 `(gnus-group-mail-3((t (:bold t :foreground "#fcaf3d"))))
 `(gnus-group-mail-low-empty((t (:foreground "#1e90ff"))))
 `(gnus-group-mail-low((t (:bold t :foreground "#1e90ff"))))
 `(gnus-group-news-1-empty((t (:foreground "#e0ffff"))))
 `(gnus-group-news-1((t (:bold t :foreground "#e0ffff"))))
 `(gnus-group-news-2-empty((t (:foreground "#40e0d0"))))
 `(gnus-group-news-2((t (:bold t :foreground "#40e0d0"))))
 `(gnus-group-news-3-empty((t (:foreground "#729fcf"))))
 `(gnus-group-news-3((t (:bold t :foreground "#fcaf3d"))))
 `(gnus-group-news-low-empty((t (:foreground "#1e90ff"))))
 `(gnus-group-news-low((t (:bold t :foreground "#1e90ff"))))
 `(gnus-header-name ((t (:bold t :foreground "#729fcf"))))
 `(gnus-header-from ((t (:bold t :foreground "#fcaf3d"))))
 `(gnus-header-subject ((t (:foreground "#fcaf3d"))))
 `(gnus-header-content ((t (:italic t :foreground "#8ae234"))))
 `(gnus-header-newsgroups((t (:italic t :bold t :foreground "#009acd"))))
 `(gnus-signature((t (:italic t :foreground "#a9a9a9"))))
 `(gnus-summary-cancelled((t (:background "#000000" :foreground "#ffff00"))))
 `(gnus-summary-high-ancient((t (:bold t :foreground "#4169e1"))))
 `(gnus-summary-high-read((t (:bold t :foreground "#32cd32"))))
 `(gnus-summary-high-ticked((t (:bold t :foreground "#ff6347"))))
 `(gnus-summary-high-unread((t (:bold t :foreground "#ff0000"))))
 `(gnus-summary-low-ancient((t (:italic t :foreground "#32cd32"))))
 `(gnus-summary-low-read((t (:italic t :foreground "#4169e1"))))
 `(gnus-summary-low-ticked((t (:italic t :foreground "#8b0000"))))
 `(gnus-summary-low-unread((t (:italic t :foreground "#ff0000"))))
 `(gnus-summary-normal-ancient((t (:foreground "#4169e1"))))
 `(gnus-summary-normal-read((t (:foreground "#32cd32"))))
 `(gnus-summary-normal-ticked((t (:foreground "#cd5c5c"))))
 `(gnus-summary-normal-unread((t (:foreground "#ff0000"))))
 `(gnus-summary-selected ((t (:background "#8b2323" :foreground "#ff0000"))))
 `(message-header-name((t (:foreground "#ff6347"))))
 `(message-header-newsgroups((t (:italic t :bold t :foreground "#009acd"))))
 `(message-header-other((t (:foreground "#009acd"))))
 `(message-header-xheader((t (:foreground "#1874cd"))))
 `(message-header-subject ((t (:foreground "#ff0000"))))
 `(message-header-to ((t (:foreground "#ff0000"))))
 `(message-header-cc ((t (:foreground "#ff0000"))))
 `(org-hide ((t (:foreground "#2e3436"))))
 `(org-level-1 ((t (:bold t :foreground "#1e90ff" :height 1.5))))
 `(org-level-2 ((t (:bold t :foreground "#fcaf3d" :height 1.2))))
 `(org-level-3 ((t (:bold t :foreground "#6ac214" :height 1.0))))
 `(org-level-4 ((t (:bold nil :foreground "#ff6347" :height 1.0))))
 `(org-date ((t (:underline t :foreground "#cd00cd"))))
 `(org-footnote  ((t (:underline t :foreground "#cd00cd"))))
 `(org-link ((t (:foreground "#7ec0ee" :background "#2e3436" :underline nil))))
 `(org-special-keyword ((t (:foreground "#a52a2a"))))
 `(org-verbatim ((t (:foreground "#eeeeec" :underline t :slant italic))))
 `(org-block ((t (:foreground "#bbbbbc"))))
 `(org-quote ((t (:inherit org-block :slant italic))))
 `(org-verse ((t (:inherit org-block :slant italic))))
 `(org-todo ((t (:bold t :foreground "#ff0000"))))
 `(org-done ((t (:bold t :foreground "#228b22"))))
 `(org-agenda-structure ((t (:weight bold :foreground "#ff6347"))))
 `(org-agenda-date ((t (:foreground "#6ac214"))))
 `(org-agenda-date-weekend ((t (:weight normal :foreground "#1e90ff"))))
 `(org-agenda-date-today ((t (:weight bold :foreground "#fcaf3d"))))
 `(org-block-begin-line ((t ( :foreground "#888a85" :background "#252b2b"))))
 `(org-block-background ((t (:background "#252b2b"))))
 `(org-block-end-line ((t ( :foreground "#888a85" :background "#252b2b"))))
 `(anything-header ((t (:bold t :background "#262626" :foreground "#fcaf3d"))))
 `(anything-candidate-number ((t (:background "#f57900" :foreground "#000000"))))
 `(ess-jb-comment-face ((t (:background "#2e3436" :foreground "#888a85" :slant italic))))
 `(ess-jb-hide-face ((t (:background "#2e3436" :foreground "#243436"))))
 `(ess-jb-h1-face ((t (:height 1.6 :foreground "#1e90ff" :slant normal))))
 `(ess-jb-h2-face ((t (:height 1.4 :foreground "#6ac214" :slant normal))))
 `(ess-jb-h3-face ((t (:height 1.2 :foreground "#fcaf3d" :slant normal))))
 `(ecb-default-highlight-face ((t (:background "#729fcf"))))
 `(ecb-tag-header-face ((t (:background "#f57900"))))
 `(magit-header ((t (:foreground "#fcaf3d"))))
 `(magit-diff-add ((t (:foreground "#729fcf"))))
 `(magit-item-highlight ((t (:weight extra-bold :inverse-video t))))
 `(diff-header ((t (:background "#4d4d4d"))))
 `(diff-index ((t (:foreground "#fcaf3d" :bold t))))
 `(diff-file-header ((t (:foreground "#eeeeec" :bold t))))
 `(diff-hunk-header ((t (:foreground "#fcaf3d"))))
 `(diff-added ((t (:foreground "#8ae234"))))
 `(diff-removed ((t (:foreground "#f57900"))))
 `(diff-context ((t (:foreground "#888a85"))))
 `(diff-refine-change ((t (:bold t :background "#4d4d4d"))))
 `(ediff-current-diff-A ((t (:background "#555753"))))
 `(ediff-current-diff-Ancestor ((t (:background "#555753"))))
 `(ediff-current-diff-B ((t (:background "#555753"))))
 `(ediff-current-diff-C ((t (:background "#555753"))))
 `(ediff-even-diff-A ((t (:background "#4d4d4d"))))
 `(ediff-even-diff-Ancestor ((t (:background "#4d4d4d"))))
 `(ediff-even-diff-B ((t (:background "#4d4d4d"))))
 `(ediff-even-diff-C ((t (:background "#4d4d4d"))))
 `(ediff-odd-diff-A ((t (:background "#4d4d4d"))))
 `(ediff-odd-diff-Ancestor ((t (:background "#4d4d4d"))))
 `(ediff-odd-diff-B ((t (:background "#4d4d4d"))))
 `(ediff-odd-diff-C ((t (:background "#4d4d4d"))))
 `(ediff-fine-diff-A ((t (:background "#222222"))))
 `(ediff-fine-diff-Ancestor ((t (:background "#222222"))))
 `(ediff-fine-diff-B ((t (:background "#222222"))))
 `(ediff-fine-diff-C ((t (:background "#222222"))))
 `(minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
 `(mumamo-background-chunk-major ((t (:background nil))))
 `(mumamo-background-chunk-submode1 ((t (:background "#2E3440"))))
 `(mumamo-background-chunk-submode2 ((t (:background "#2E4034"))))
 `(mumamo-background-chunk-submode3 ((t (:background "#343434"))))
 `(rpm-spec-dir-face ((t (:foreground "#8ae234"))))
 `(rpm-spec-doc-face ((t (:foreground "#888a85"))))
 `(rpm-spec-ghost-face ((t (:foreground "#ff6347"))))
 `(rpm-spec-macro-face ((t (:foreground "#fcaf3d"))))
 `(rpm-spec-obsolete-tag-face ((t (:background "#f57900" :foreground "#ee3436" :weight bold))))
 `(rpm-spec-package-face ((t (:foreground "#ff6347"))))
 `(rpm-spec-section-face ((t (:foreground "#8ae234" :underline t :weight bold))))
 `(rpm-spec-tag-face ((t (:foreground "#1e90ff" :weight bold))))
 `(rpm-spec-var-face ((t (:foreground "#ff6347"))))
 )


(provide-theme 'tangotangokx)

;;; tangotango-theme.el ends here
