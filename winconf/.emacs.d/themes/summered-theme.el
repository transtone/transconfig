;;; summered-emacs.el --- Summered for Emacs.

;; Copyright (C) 2012 Arthur Leonard Andersen

;; Author: Arthur Leonard Andersen <leoc.git@gmail.com>
;; URL: http://github.com/leoc/summered-emacs
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A nice summer feeling color theme for emacs heavily inspired by Sunburst.
;;
;;; Installation:
;;
;;   Just drop the summered-emacs.el somewhere that the emacs
;; `load-theme` command can find it.
;;
;; Don't forget that the theme requires Emacs 24.
;;
;;; Credits
;;
;;   Soryu created the Sunburst Colortheme for TextMate which
;; summered is based on.
;;
;;; Code

(deftheme summered "The Summered color theme")

(let ((class '((class color) (min-colors 89)))
      ;; Summered palette
      ;; colors with +x are lighter, colors with -x are darker
      (summered-fg-3      "#808080")
      (summered-fg-2      "#999999")
      (summered-fg-1      "#aaaaaa")
      (summered-fg        "#d0d0d0")
      (summered-fg+1      "#e6e5e4")
      (summered-fg+2      "#f0f0f0")
      (summered-bg-1      "#000000")
      (summered-bg-05     "#090909")
      (summered-bg        "#111111")
      (summered-bg+1      "#222222")
      (summered-bg+2      "#333333")
      (summered-bg+3      "#444444")
      (summered-red-3     "#661100")
      (summered-red-2     "#801500")
      (summered-red-1     "#991900")
      (summered-red       "#b33319")
      (summered-red+1     "#bb3a14")
      (summered-red+2     "#cd3f14")
      (summered-red+3     "#da583e")
      (summered-red+4     "#cf6a4c")
      (summered-orange-2  "#ad581f")
      (summered-orange-1  "#c36322")
      (summered-orange    "#dd7b3b")
      (summered-orange+1  "#fd9b3b")
      (summered-orange+2  "#ffb55b")
      (summered-yellow-8  "#4a410d")
      (summered-yellow-2  "#e9c062")
      (summered-yellow-1  "#dad085")
      (summered-yellow    "#ece193")
      (summered-yellow+1  "#fcf183")
      (summered-yellow+2  "#ffff63")
      (summered-green-1   "#4b8131")
      (summered-green     "#65b042")
      (summered-green+1   "#7bba5e")
      (summered-green+2   "#8ac270")
      (summered-green+3   "#99c982")
      (summered-green+4   "#a7d194")
      (summered-cyan-2    "#6C7C93")
      (summered-cyan-1    "#8b98ab")
      (summered-cyan      "#7694A2")
      (summered-cyan      "#80B2CB")
      (summered-cyan      "#A5D9F3")
      (summered-blue+3    "#9ed1fa")
      (summered-blue+2    "#6eb9f7")
      (summered-blue+1    "#5b9fd7")
      (summered-blue      "#3387cc")
      (summered-blue-1    "#206DAC")
      (summered-blue-2    "#1C5F97")
      (summered-blue-3    "#1F517A")
      (summered-magenta-2 "#675969")
      (summered-magenta-1 "#7A6A7C")
      (summered-magenta   "#9b859d")
      (summered-magenta+1 "#B594B8")
      (summered-magenta+2 "#C8A9CB"))
  (custom-theme-set-faces
   'summered
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,summered-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,summered-yellow-2
                                        :underline t
                                        :weight normal))))

   ;;; basic coloring
   `(default ((,class (:foreground ,summered-fg :background ,summered-bg))))
   `(cursor ((,class (:foreground ,summered-fg))))
   `(escape-glyph-face ((,class (:foreground ,summered-red))))
   `(fringe ((,class (:foreground ,summered-fg :background ,summered-bg+1))))
   `(header-line ((,class (:foreground ,summered-fg+1
                                       :background ,summered-bg-1
                                       :box (:line-width -1
                                             :style released-button)))))
   `(highlight ((,class (:background ,summered-bg+1))))
   `(highline-face ((,class (:background ,summered-yellow-8))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,summered-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,summered-green))))
   `(compilation-error-face ((,class (:foreground ,summered-red-1
                                                  :weight bold
                                                  :underline t))))
   `(compilation-face ((,class (:foreground ,summered-fg))))
   `(compilation-info-face ((,class (:foreground ,summered-blue))))
   `(compilation-info ((,class (:foreground ,summered-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,summered-green))))
   `(compilation-line-face ((,class (:foreground ,summered-yellow))))
   `(compilation-line-number ((,class (:foreground ,summered-yellow))))
   `(compilation-message-face ((,class (:foreground ,summered-blue))))
   `(compilation-warning-face ((,class (:foreground ,summered-yellow-1
                                                    :weight bold
                                                    :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,summered-fg))))
   `(grep-error-face ((,class (:foreground ,summered-red-1
                                           :weight bold
                                           :underline t))))
   `(grep-hit-face ((,class (:foreground ,summered-blue))))
   `(grep-match-face ((,class (:foreground ,summered-orange
                                           :weight bold))))
   `(match ((,class (:background ,summered-bg-1
                     :foreground ,summered-orange
                                 :weight bold))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,summered-yellow
                       :background ,summered-bg-1))))
   `(isearch-fail ((,class (:foreground ,summered-fg
                            :background ,summered-red-3))))
   `(lazy-highlight ((,class (:foreground ,summered-yellow
                              :background ,summered-bg+2))))

   `(menu ((,class (:foreground ,summered-fg :background ,summered-bg))))
   `(minibuffer-prompt ((,class (:foreground ,summered-yellow))))
   `(mode-line
     ((,class (:foreground ,summered-fg+1
                           :background ,summered-bg+2
                           :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,summered-yellow
                                               :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,summered-fg-3
                           :background ,summered-bg
                           :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,summered-yellow-8))))
   `(secondary-selection ((,class (:background ,summered-bg+2))))
   `(trailing-whitespace ((,class (:background ,summered-red))))
   `(vertical-border ((,class (:foreground ,summered-fg))))


   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,summered-orange))))
   `(font-lock-comment-face ((,class (:foreground ,summered-fg-3))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,summered-fg-3))))
   `(font-lock-constant-face ((,class (:foreground ,summered-green+3))))
   `(font-lock-doc-face ((,class (:foreground ,summered-magenta+2))))
   `(font-lock-doc-string-face ((,class (:foreground ,summered-magenta))))
   `(font-lock-function-name-face ((,class (:foreground ,summered-yellow-2
                                                        :weight) bold)))
   `(font-lock-keyword-face ((,class (:foreground ,summered-red+4
                                                  :weight bold))))
   `(font-lock-reference-face ((,class (:foreground ,summered-cyan-1))))
   `(font-lock-negation-char-face ((,class (:foreground ,summered-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,summered-fg-1))))
   `(font-lock-string-face ((,class (:foreground ,summered-green))))
   `(font-lock-type-face ((,class (:foreground ,summered-yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,summered-blue))))
   `(font-lock-warning-face ((,class (:foreground ,summered-fg+1
                                      :background ,summered-red-3
                                      :weight bold :underline t))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,summered-fg))))
   `(ack-file ((,class (:foreground ,summered-blue))))
   `(ack-line ((,class (:foreground ,summered-yellow))))
   `(ack-match ((,class (:foreground ,summered-orange
                                     :background ,summered-bg-1
                                     :weigth bold))))

   ;; auto-complete
   `(ac-candidate-face ((,class (:background ,summered-bg+3
                                             :foreground "black"))))
   `(ac-selection-face ((,class (:background ,summered-blue-3
                                             :foreground ,summered-fg))))
   `(popup-tip-face ((,class (:background ,summered-yellow-2
                                          :foreground "black"))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,summered-blue-3))))
   `(popup-scroll-bar-background-face ((,class (:background ,summered-bg-1))))
   `(popup-isearch-match ((,class (:background ,summered-bg
                                               :foreground ,summered-fg))))

   ;; diff
   `(diff-added ((,class (:foreground ,summered-green+4))))
   `(diff-changed ((,class (:foreground ,summered-yellow))))
   `(diff-removed ((,class (:foreground ,summered-red+4))))
   `(diff-header ((,class (:background ,summered-bg+1))))
   `(diff-file-header
     ((,class (:background ,summered-bg+2 :foreground ,summered-fg :bold t))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,summered-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,summered-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,summered-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,summered-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,summered-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,summered-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,summered-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,summered-red+3
                                           :weight bold
                                           :underline t))))
   `(flymake-warnline ((,class (:foreground ,summered-yellow+2
                                            :weight bold
                                            :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,summered-yellow+2
                                              :weight bold
                                              :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,summered-red+3
                                              :weight bold
                                              :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,summered-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,summered-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,summered-yellow))))
   `(erc-keyword-face ((,class (:foreground ,summered-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,summered-yellow
                                                 :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,summered-orange :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,summered-green))))
   `(erc-pal-face ((,class (:foreground ,summered-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,summered-red
                                           :background ,summered-bg
                                           :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,summered-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1-face ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty-face ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2-face ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty-face ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3-face ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty-face ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4-face ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty-face ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5-face ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty-face ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6-face ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty-face ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low-face ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty-face ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1-face ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2-face ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3-face ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4-face ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5-face ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6-face ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low-face ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content-face ((,class (:inherit message-header-other))))
   `(gnus-header-from-face ((,class (:inherit message-header-from))))
   `(gnus-header-name-face ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups-face ((,class (:inherit message-header-other))))
   `(gnus-header-subject-face ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled-face ((,class (:foreground ,summered-orange))))
   `(gnus-summary-high-ancient-face ((,class (:foreground ,summered-blue))))
   `(gnus-summary-high-read-face ((,class (:foreground ,summered-green :weight bold))))
   `(gnus-summary-high-ticked-face ((,class (:foreground ,summered-orange :weight bold))))
   `(gnus-summary-high-unread-face ((,class (:foreground ,summered-fg :weight bold))))
   `(gnus-summary-low-ancient-face ((,class (:foreground ,summered-blue))))
   `(gnus-summary-low-read-face ((t (:foreground ,summered-green))))
   `(gnus-summary-low-ticked-face ((,class (:foreground ,summered-orange :weight bold))))
   `(gnus-summary-low-unread-face ((,class (:foreground ,summered-fg))))
   `(gnus-summary-normal-ancient-face ((,class (:foreground ,summered-blue))))
   `(gnus-summary-normal-read-face ((,class (:foreground ,summered-green))))
   `(gnus-summary-normal-ticked-face ((,class (:foreground ,summered-orange :weight bold))))
   `(gnus-summary-normal-unread-face ((,class (:foreground ,summered-fg))))
   `(gnus-summary-selected-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(gnus-cite-1-face ((,class (:foreground ,summered-blue))))
   `(gnus-cite-10-face ((,class (:foreground ,summered-yellow-1))))
   `(gnus-cite-11-face ((,class (:foreground ,summered-yellow))))
   `(gnus-cite-2-face ((,class (:foreground ,summered-blue-1))))
   `(gnus-cite-3-face ((,class (:foreground ,summered-blue-2))))
   `(gnus-cite-4-face ((,class (:foreground ,summered-green+2))))
   `(gnus-cite-5-face ((,class (:foreground ,summered-green+1))))
   `(gnus-cite-6-face ((,class (:foreground ,summered-green))))
   `(gnus-cite-7-face ((,class (:foreground ,summered-red))))
   `(gnus-cite-8-face ((,class (:foreground ,summered-red-1))))
   `(gnus-cite-9-face ((,class (:foreground ,summered-red-2))))
   `(gnus-group-news-1-empty-face ((,class (:foreground ,summered-yellow))))
   `(gnus-group-news-2-empty-face ((,class (:foreground ,summered-green+3))))
   `(gnus-group-news-3-empty-face ((,class (:foreground ,summered-green+1))))
   `(gnus-group-news-4-empty-face ((,class (:foreground ,summered-blue-2))))
   `(gnus-group-news-5-empty-face ((,class (:foreground ,summered-blue-3))))
   `(gnus-group-news-6-empty-face ((,class (:foreground ,summered-bg+2))))
   `(gnus-group-news-low-empty-face ((,class (:foreground ,summered-bg+2))))
   `(gnus-signature-face ((,class (:foreground ,summered-yellow))))
   `(gnus-x-face ((,class (:background ,summered-fg :foreground ,summered-bg))))

   ;; helm
   `(helm-selection ((,class (:background ,summered-bg-1))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,summered-bg-1))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,summered-fg+1 :weight bold))))
   `(ido-only-match ((,class (:foreground ,summered-green+1))))
   `(ido-subdir ((,class (:foreground ,summered-cyan))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,summered-yellow+2))))
   `(js2-error-face ((,class (:foreground ,summered-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,summered-green-1))))
   `(js2-jsdoc-type-face ((,class (:foreground ,summered-green+2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,summered-green+3))))
   `(js2-function-param-face ((,class (:foreground, summered-yellow))))
   `(js2-external-variable-face ((,class (:foreground ,summered-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,summered-green+2))))
   `(jabber-roster-user-online ((,class (:foreground ,summered-blue-1))))
   `(jabber-roster-user-dnd ((,class (:foreground ,summered-red+1))))
   `(jabber-rare-time-face ((,class (:foreground ,summered-green+1))))
   `(jabber-chat-prompt-local ((,class (:foreground ,summered-blue-1))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,summered-red+1))))
   `(jabber-activity-face((,class (:foreground ,summered-red+1))))
   `(jabber-activity-personal-face ((,class (:foreground ,summered-blue+1))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,summered-green+2 :background ,summered-bg))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,summered-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,summered-orange :weight bold))))

   ;; message-mode
   `(message-cited-text-face ((,class (:inherit font-lock-comment))))
   `(message-header-name-face ((,class (:foreground ,summered-green+1))))
   `(message-header-other-face ((,class (:foreground ,summered-green))))
   `(message-header-to-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(message-header-from-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(message-header-cc-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(message-header-newsgroups-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(message-header-subject-face ((,class (:foreground ,summered-orange :weight bold))))
   `(message-header-xheader-face ((,class (:foreground ,summered-green))))
   `(message-mml-face ((,class (:foreground ,summered-yellow :weight bold))))
   `(message-separator-face ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,summered-orange))))
   `(mew-face-header-from ((,class (:foreground ,summered-yellow))))
   `(mew-face-header-date ((,class (:foreground ,summered-green))))
   `(mew-face-header-to ((,class (:foreground ,summered-red))))
   `(mew-face-header-key ((,class (:foreground ,summered-green))))
   `(mew-face-header-private ((,class (:foreground ,summered-green))))
   `(mew-face-header-important ((,class (:foreground ,summered-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,summered-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,summered-red))))
   `(mew-face-header-xmew ((,class (:foreground ,summered-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,summered-red))))
   `(mew-face-body-url ((,class (:foreground ,summered-orange))))
   `(mew-face-body-comment ((,class (:foreground ,summered-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,summered-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,summered-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,summered-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,summered-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,summered-red))))
   `(mew-face-mark-review ((,class (:foreground ,summered-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,summered-green))))
   `(mew-face-mark-delete ((,class (:foreground ,summered-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,summered-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,summered-green))))
   `(mew-face-mark-unread ((,class (:foreground ,summered-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,summered-green))))
   `(mew-face-eof-part ((,class (:foreground ,summered-yellow))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,summered-yellow))))
   `(nav-face-button-num ((,class (:foreground ,summered-cyan))))
   `(nav-face-dir ((,class (:foreground ,summered-green))))
   `(nav-face-hdir ((,class (:foreground ,summered-red))))
   `(nav-face-file ((,class (:foreground ,summered-fg))))
   `(nav-face-hfile ((,class (:foreground ,summered-red-3))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,summered-fg :weight bold))))
   `(org-checkbox ((,class (:background ,summered-bg+2 :foreground "white"
                                        :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,summered-cyan-2 :underline t))))
   `(org-deadline-announce ((,class (:foreground ,summered-red-1))))
   `(org-formula ((,class (:foreground ,summered-yellow-2))))
   `(org-headline-done ((,class (:foreground ,summered-green+3))))
   `(org-hide ((,class (:foreground ,summered-bg-1))))
   `(org-level-1 ((,class (:foreground ,summered-orange+2 :weight bold))))
   `(org-level-2 ((,class (:foreground ,summered-blue+1))))
   `(org-level-3 ((,class (:foreground ,summered-red+2))))
   `(org-level-4 ((,class (:foreground ,summered-fg-3))))
   `(org-level-5 ((,class (:foreground ,summered-yellow+1))))
   `(org-level-6 ((,class (:foreground ,summered-green-1))))
   `(org-level-7 ((,class (:foreground ,summered-orange))))
   `(org-level-8 ((,class (:foreground ,summered-green+3))))
   `(org-link ((,class (:foreground ,summered-yellow-2 :underline t))))
   `(org-scheduled ((,class (:foreground ,summered-green+4))))
   `(org-scheduled-previously ((,class (:foreground ,summered-red-3))))
   `(org-scheduled-today ((,class (:foreground ,summered-blue+1))))
   `(org-special-keyword ((,class (:foreground ,summered-fg+1))))
   `(org-table ((,class (:foreground ,summered-fg-1))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,summered-orange))))
   `(org-todo ((,class (:bold t :foreground ,summered-red+4 :weight bold))))
   `(org-done ((,class (:bold t :foreground ,summered-green+3 :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,summered-red :weight bold))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,summered-cyan))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,summered-yellow))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,summered-blue+1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,summered-red+1))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,summered-orange))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,summered-blue-1))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,summered-green+4))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,summered-red-3))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,summered-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,summered-green+2))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,summered-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,summered-red-3))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,summered-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,summered-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,summered-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,summered-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,summered-red))))
   `(rpm-spec-package-face ((,class (:foreground ,summered-red))))
   `(rpm-spec-section-face ((,class (:foreground ,summered-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,summered-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,summered-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,summered-orange))))
   `(rst-level-2-face ((,class (:foreground ,summered-green+1))))
   `(rst-level-3-face ((,class (:foreground ,summered-blue-1))))
   `(rst-level-4-face ((,class (:foreground ,summered-yellow-2))))
   `(rst-level-5-face ((,class (:foreground ,summered-cyan))))
   `(rst-level-6-face ((,class (:foreground ,summered-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,summered-red-3 :background ,summered-bg :weight bold))))
   `(show-paren-match ((,class (:foreground ,summered-blue-1 :background ,summered-bg :weight bold))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,summered-red))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,summered-bg :foreground ,summered-bg+1))))
   `(whitespace-hspace ((,class (:background ,summered-bg :foreground ,summered-bg+1))))
   `(whitespace-tab ((,class (:background ,summered-bg :foreground ,summered-red))))
   `(whitespace-newline ((,class (:foreground ,summered-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,summered-red :background ,summered-bg))))
   `(whitespace-line ((,class (:background ,summered-bg-05 :foreground ,summered-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,summered-orange :foreground ,summered-orange))))
   `(whitespace-indentation ((,class (:background ,summered-yellow :foreground ,summered-red))))
   `(whitespace-empty ((,class (:background ,summered-yellow :foreground ,summered-red))))
   `(whitespace-space-after-tab ((,class (:background ,summered-yellow :foreground ,summered-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,summered-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,summered-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,summered-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,summered-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,summered-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,summered-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,summered-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,summered-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,summered-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,summered-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,summered-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,summered-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,summered-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,summered-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,summered-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,summered-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,summered-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,summered-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,summered-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,summered-fg
                                                              :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,summered-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,summered-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,summered-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,summered-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,summered-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   `(which-func ((,class (:foreground ,summered-green+1))))

  ;;; custom theme variables
   (custom-theme-set-variables
    'summered
    `(ansi-color-names-vector [,summered-bg ,summered-red ,summered-green ,summered-yellow
                                            ,summered-blue ,summered-magenta ,summered-cyan ,summered-fg])
    ;; fill-column-indicator
    `(fci-rule-color ,summered-bg-05))))

;;;autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'summered)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; summered-theme.el ends here.
