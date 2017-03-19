;;; css-format.el --- Toggle CSS inline/multiline block format
;;
;; Author: Cezar Halmagean
;; Maintainer: Cezar Halmagean
;; Created: 2012-15-04
;; Keywords: css
;; Version: 1.0
;;
;;; COPYRIGHT NOTICE
;;
;; This program is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2 of the License, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
;; for more details. http://www.gnu.org/copyleft/gpl.html
;;
;;; Install:
;;
;; This package depends on css-mode (included in Emacs 24).
;;
;; To install it, put this file in your load-path and add the
;; following line to your init file (usually $HOME/.emacs).
;;
;; (require 'css-format)
;;

(defun css-format-block-start-pos ()
  "Finds the opening curly brace that defines the start of a CSS code
block and returns it's location."
  (save-excursion
    (if (progn
          (beginning-of-line)
          (search-forward "{" (line-end-position) t))
        (goto-char (- (point) 1))
      (search-backward "{"))
    (point)))

(defun css-format-block-end-pos ()
  "Finds the closing curly brace that defines the end of a CSS code block
and returns it's location."
  (save-excursion
    (if (progn
          (beginning-of-line)
          (search-forward "}" nil t))
        (goto-char (- (point) 1))
      nil)
    (point)))

(defun css-format-inline ()
  "Convert from block to inline style."
  (interactive)
  (goto-char (css-format-block-start-pos))
  (re-search-forward "[ \n\t]+")
  (replace-match " ")
  (while (re-search-forward ";[ \n\t]+" (css-format-block-end-pos) t)
    (replace-match "; ")))

(defun css-format-block ()
  "Convert from inline to block style."
  (interactive)
  (goto-char (css-format-block-start-pos))
  (re-search-forward "\\([ ]+\\)[a-z]" (line-end-position))
  (replace-match "\n" nil nil nil 1)
  (css-indent-line)
  (while (re-search-forward ";[ ]+" (css-format-block-end-pos) t)
    (progn
      (replace-match ";\n")
      (css-indent-line))))

(provide 'css-format)

;;; css-format.el ends here
