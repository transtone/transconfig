;;;; color-theme-irblack-2.el
;; -*- mode: elisp -*-
;; Copyright (c) 2010-01 transtone <zm3345@gmail.com>
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA
;;

(defun color-theme-irblack-2 ()
  "A color theme based on Tango Palette."
  (interactive)
  (color-theme-install
   '(color-theme-irblack-2
     (;; (background-color . "#121212")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#FFA560")
      (foreground-color . "#F6F3E8")
      (mouse-color . "#660000"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-comment-face ((t (:foreground "#8c8c8c"  :italic t ))))
     (font-lock-constant-face ((t (:foreground "#99CC99"))))
     (font-lock-doc-string-face ((t (:foreground "#A8FF60"))))
     (font-lock-string-face ((t (:foreground "#A8FF60"))))
;;     (font-lock-function-name-face ((t (:foreground "#729fcf"))))
     (font-lock-function-name-face ((t (:foreground "#FFB774"))))
     (font-lock-builtin-face ((t (:foreground "#96CBFE"))))
     (font-lock-keyword-face ((t (:foreground "#66B5FF"))))
     (font-lock-preprocessor-face ((t (:foreground "#66B5FF"))))
     (font-lock-type-face ((t (:foreground "#FFFFB6"))))
     (font-lock-variable-name-face ((t (:foreground "#C6C5FE"))))
     (font-lock-warning-face ((t (:background "#CC1503" :foreground "#FFFFFF"))))
     (font-lock-reference-face ((t (:foreground "#99CC99"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "#FF6C60"))))

     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "#111111"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#3465a4"))))
     (mode-line-inactive ((t (:foreground "#cccddd" :background "#111111"))))
     (region ((t (:background "#555753"))))

     (flyspell-duplicate ((t (:foreground "#fcaf3e"))))
     (flyspell-incorrect ((t (:foreground "#cc0000"))))

     (org-date ((t (:foreground "LightSteelBlue" :underline t))))
     (org-hide ((t (:foreground "#2e3436"))))
     (org-todo ((t (:inherit font-lock-keyword-face :bold t))))
     (org-level-1 ((t (:inherit font-lock-function-name-face))))
     (org-level-2 ((t (:inherit font-lock-variable-name-face))))
     (org-level-3 ((t (:inherit font-lock-keyword-face))))
     (org-level-4 ((t (:inherit font-lock-string-face))))
     (org-level-5 ((t (:inherit font-lock-constant-face))))

     (linum ((t (:foreground "#86453A"))))

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
     
     
     ;; nxml
     (nxml-delimiter ((t (:foreground "#96CBFE"))))
     (nxml-name ((t (:foreground "#96CBFE"))))
     (nxml-element-local-name ((t (:foreground "#96CBFE"))))
     (nxml-attribute-local-name ((t (:foreground "#FFD7B1"))))


     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (paren-face-match ((t (:inherit show-paren-match-face))))
     (paren-face-match-light ((t (:inherit show-paren-match-face))))
     (paren-face-mismatch ((t (:inherit show-paren-mismatch-face))))
     (persp-selected-face ((t (:foreground "#729fcf"))))
     (show-paren-match-face ((t (:background "#729fcf" :foreground "#eeeeec"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#729fcf"))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     )))

(provide 'color-theme-irblack-2)