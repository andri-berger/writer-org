;;; writer-org.el --- Writer Mode -*- lexical-binding: t -*-

;; Copyright (C) 2026-2026 Free Software Foundation, Inc.

;; Author: Andri Berger <andri.roeberger@gmail.com>
;; Maintainer: Andri Berger <andri.roeberger@gmail.com>
;; URL: https://github.com/andri-berger/writer-org
;; Last-Updated: 2026-01-01
;; Created: 2026-01-01
;; Version: 0.1
;; Package-Requires: ((emacs "30.0"))
;; Keywords: org-mode, org-writer

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Lorem ipsum dolor sit amet, consetetur sadpscing elitr, sed diam nonumy
;; eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
;; voluptua.
;;
;;
;;; News:
;;
;; Version 0.3
;; Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
;; eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
;; voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet
;; clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit. 
;;
;; Version 0.2
;; Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
;; eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
;; voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet
;; kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
;;
;; Version 0.1
;; Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
;; eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
;; voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet
;; kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 

;;
;;; Code:




(defgroup writer-org nil
  "Writing layout for org buffers."
  :prefix "writer-org-"
  :group 'text)

(defvar writer-org--00
  '(org-next-visible-heading
    org-previous-visible-heading
    org-forward-heading-same-level
    org-backward-heading-same-level
    org-up-heading
    org-next-block
    org-previous-block
    org-forward-element
    org-backward-element
    org-forward-paragraph
    org-backward-paragraph
    org-next-item
    org-previous-item
    org-next-link
    org-previous-link)
    "Lorem ipsum dolor sit amet.")

(defvar writer-org--01
  '(newline
    self-insert
    delete-char
    delete-variants
    newline-and-indent
    self-insert-command
    backward-delete-char-untabify)
    "Lorem ipsum dolor sit amet.")

(defvar-local writer-org--02 nil
  "Lorem ipsum dolor sit amet.")

(defvar-local writer-org--03 nil
  "Lorem ipsum dolor sit amet.")

(defvar-local writer-org--04 nil
  "Lorem ipsum dolor sit amet.")

(defcustom writer-org-05 nil
  "Enable typing-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-06 nil
  "Enable cursor-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-07 nil
  "Enable org-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-08 nil
  "Centering horizontally"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-09 50
  "Max-width in pixel"
  :group 'writer-org
  :type 'integer)


(defun writer-org--00 ()
  "Lorem ipsum dolor sit amet."
  (unless writer-org-mode
    (let* ((rati this-command)
           (ratio writer-org--04)
           (ratio0 writer-org-05)
           (ratio1 writer-org-06)
           (ratio2 writer-org-07)
           (ratios0 writer-org--00)
           (ratios1 writer-org--01)
           (start (window-start))
           (offset (count-lines
                    start (point)))
           (tt (memq rati ratios0))
           (ss (memq rati ratios1)))
      (when (> (abs (- offset ratio)) 0)
        (when (or (and tt ratio0)
                  (and ss ratio1)
                  (and ratio2 and
                       (not (or tt ss))))
          (recenter ratio))))))

(defun writer-org--01 ()
  "Lorem ipsum dolor sit amet."
  (let* ((max writer-org-09)
         (marg (writer-org-08 2 1))
         (args (writer-org-08 0 1))
         (width (window-total-width))
         (margin (max 0 (/ (- width max) 2))))
    (setq-local left-margin-width (margin * args))
    (setq-local right-margin-width (margin * marg))
    (setq-local left-fringe-width (+ writer-org-21 26)))
  (when (eq (current-buffer) (window-buffer (selected-window)))
    (set-window-buffer (selected-window) (current-buffer))))

(defvar-local writer-org--10 nil
  "Lorem ipsum dolor sit amet.")

(defcustom writer-org-11 'default
  "faces inherit header line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-12 'default
  "faces inherit mode line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-13 nil
  "line/word/sentence/org header"
  :group 'writer-org
  :type '(choice (const :tag "None" nil)
                 (const :tag "Line" line)
                 (const :tag "Word" word)
                 (const :tag "Sentence" sentence)
                 (const :tag "Org Mode 0" org-mode-0)
                 (const :tag "Org Mode 1" org-mode-1)))

(defcustom writer-org-14 nil
  "line/word/sentence/org mode"
  :group 'writer-org
  :type '(choice (const :tag "None" nil)
                 (const :tag "Line" line)
                 (const :tag "Word" word)
                 (const :tag "Sentence" sentence)
                 (const :tag "Org Mode 0" org-mode-0)
                 (const :tag "Org Mode 1" org-mode-1)))

(defcustom writer-org-15 nil
  "text org-mode header"
  :group 'writer-org
  :type '(choice (const :tag "None" nil)
                 (const :tag "Left" left)
                 (const :tag "Right" right)
                 (const :tag "Center" center)))

(defcustom writer-org-16 nil
  "text org-mode mode"
  :group 'writer-org
  :type '(choice (const :tag "None" nil)
                 (const :tag "Left" left)
                 (const :tag "Right" right)
                 (const :tag "Center" center)))

(defcustom writer-org-17 'left
  "lines config header"
  :group 'writer-org
  :type '(choice (const :tag "Left" left)
                 (const :tag "Right" right)
                 (const :tag "Center" center)))

(defcustom writer-org-18 'left
  "lines config mode"
  :group 'writer-org
  :type '(choice (const :tag "Left" left)
                 (const :tag "Right" right)
                 (const :tag "Center" center)))


(defun writer-org--10 ()
(setq writer-org--10
            (face-remap-add-relative 'header-line
                                     :underline '(:style line :position t)
                                     :overline t))  
(setq-local header-line-format
            '((:eval (propertize
                      (format "%d/%d %d/%d Lorem Ipsum dolor sit!"
                              (+ 1 (count-words (point-min) (point)))
                              (+ 1 (count-words (point-min) (point-max)))
                              (+ 1 (count-lines (point-min) (point)))
                              (+ 1 (count-lines (point-min) (point-max))))
                      'face '(:underline (:inherit default :position t)))))))

(defun writer-org--11 ()
(setq writer-org--10
            (face-remap-add-relative 'mode-line
                                     :underline '(:style line :position t)
                                     :overline t))  
(setq-local mode-line-format
            '((:eval (propertize
                      (format "%d/%d %d/%d Lorem Ipsum dolor sit!"
                              (+ 1 (count-words (point-min) (point)))
                              (+ 1 (count-words (point-min) (point-max)))
                              (+ 1 (count-lines (point-min) (point)))
                              (+ 1 (count-lines (point-min) (point-max))))
                      'face '(:underline (:inherit default :position t)))))))





(defconst writer-org--20
  (vector #b0000000000000010
          #b0000000000100010
          #b0000001000100010
          #b0010001000100010
          #b0000000000000110
          #b0000000001100110
          #b0000011001100110
          #b0110000001100110
          #b0000000000000110
          #b0000000011000110
          #b0001100011000110
          #b0001100011000110
          #b0000000000001110
          #b0000000111001110
          #b0011100111001110
          #b0011100111001110
          #b0000000000001110
          #b0000000011101110
          #b0000111011101110
          #b1110111011101110)
  "OK make-vector hash-table LTR")

(defconst writer-org--22
  (vector #b0100000000000000
          #b0100010000000000
          #b0100010001000000
          #b0100010001000100
          #b0110000000000000
          #b0110011000000000
          #b0110011001100000
          #b0110011001100110
          #b0110000000000000
          #b0110001100000000
          #b0110001100011000
          #b0110001100011000
          #b0111000000000000
          #b0111001110000000
          #b0111001110011100
          #b0111001110011100
          #b0111000000000000
          #b0111011100000000
          #b0111011101110000
          #b0111011101110111)
  "OK make-vector hash-table RTL")

(defvar-local writer-org--21 nil
  "OK Left fringe width temp holder.")

(defcustom writer-org-25 'default
  "OK Custom face of vertical line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-26 'default
  "OK Custom face of left fridge"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-21 0
  "OK Left fringe width"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-22 0
  "OK vertical gap fringe left"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-20 1
  "hierarchy treshold"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-23 1
  "OK line-styles 0-4"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-24 nil
  "OK LTR vs RTL Alignment"
  :group 'writer-org
  :type 'boolean)


(defun writer-org--21s (a b c)
"Lorem ipsum dolor sit amet"
  (when (> a writer-org-20)
    (let* ((ff writer-org--20)
           (gg writer-org--22)
           (gap writer-org-22)
           (bols writer-org-24)
           (styl writer-org-23)
           (ov (make-overlay b c))
           (thr (+ writer-org-20 1))
           (get (+ (- a thr) (* styl 4)))
         (yess (aref (if bols gg ff) get))
         (y (format "writer-org-bm-%d" a))
         (xx (- (frame-char-height) gap))
         (bitmap-symb (intern y)))
      (define-fringe-bitmap bitmap-symb
        (make-vector xx yess) xx 16)
      (overlay-put ov 'priority a)
      (overlay-put ov 'evaporate t)
      (overlay-put ov 'line-prefix
                 (propertize " " 'display
                             (list 'left-fringe
                                   bitmap-symb
                                   writer-org-25)
                             'face writer-org-26))
      (overlay-put ov 'wrap-prefix
                 (propertize " " 'display
                             (list 'left-fringe
                                   bitmap-symb
                                   writer-org-25)
                             'face writer-org-26)))))


(defun writer-org--21r (a b)
  "Lorem ipsum sit dolor amet."
  (let* ((local writer-org-20)
         (check (< a (+ local 1)))
         (st (- (line-end-position) 0))
         (sl (line-beginning-position))
         (eol (if check (+ a b 1) st))
         (bol (if check a (- sl 1)))
         (ov (make-overlay bol eol)))
    (overlay-put ov 'my-heading t)
    (overlay-put ov 'evaporate t)
    (overlay-put ov 'display "")))


(defun add-00s ()
  "Collapse heading lines to zero height. Body and children untouched.
Uses before-string overlay with display spec — closest to CSS display:none."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward
            org-heading-regexp nil t)
      (let* ((local writer-org-20)
             (test (+ (match-end 1) 1))
             (test0 (match-beginning 1))
             (lev (org-current-level))
             (l (line-beginning-position))
             (eol (if (<= lev (+ local 0))
                      test (line-end-position)))
             (bol (if (<= lev (+ local 0))
                    test0 (- l 1)))
             (ov (make-overlay bol eol)))
        (overlay-put ov 'display "")
        (overlay-put ov 'my-heading t)
        (overlay-put ov 'evaporate t)))))


(defun writer-org--23s ()
  (org-with-wide-buffer
   (org-element-map
       (org-element-parse-buffer 'headline)
       'headline
     (lambda (h)
       (writer-org--21r
        (org-element-property :level h)
        (org-element-property :begin h))
       ;; (writer-org--21s
       ;;  (org-element-property :level h)
       ;;  (org-element-property :begin h)
       ;;  (org-element-property :end h))
       ))))



;;;;;; tie to key org-keybindings
;;;;;; tie to key org-keybindings

(defun add-000 ()
  "Collapse heading lines to zero height. Body and children untouched.
Uses before-string overlay with display spec — closest to CSS display:none."
  (remove-overlays
   (point-min)
   (point-max)
   'my-heading t))

(defun add-1 ()
  "Remove all overlays on the current line."
    (add-000)
    (outline-back-to-heading t)
    (org-move-subtree-down)
    (forward-line 1)
    (add-00s))

(defun add-2 ()
  "Remove all overlays on the current line."
    (add-000)
    (outline-back-to-heading t)
    (org-move-subtree-up)
    (add-00))










;; create new sqlite database (if not exists)
;; move point to region (cycle)
;; (save-excursion body)
;; sql;; sqlite.open [];; sqlite-execute
;; line-beginning-position
;; line-end-position
;; forward-line
;; window-start
;; window-end
;; window-end nil t


(defun writer-org-30 ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (when (use-region-p)
    (unless writer-org-mode
      (let ((as (region-end))
            (at (region-beginning)))
        (goto-char (region-beginning))
        (insert (make-string 3 32))
        (goto-char (- (point) 2))
        (let ((ov (make-overlay
                 (- (point) 1)
                 (+ (point) 1)))
            (ovs (make-overlay
                  (+ at 3)
                  (+ as 3))))
          (overlay-put ovs 'face 'region)
          (overlay-put ov 'face 'region)
          (overlay-put ov 'priority 50)
          (overlay-put ovs 'priority 50)))
      (message "writer-org-30"))))

(defun writer-org-31 ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (unless writer-org-mode
    (message "writer-org-31")))

(defun writer-org-32 ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (when writer-org-mode
    (message "writer-org-32")))

(defun writer-org-33 ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (when writer-org-mode
    (message "writer-org-33")))

(defun writer-org-34 ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (unless writer-org-mode
    (setq-local scroll-margin 0)
    (setq-local maximum-scroll-margin 0)
    (setq-local scroll-conservatively 0)
    (setq-local scroll-up-aggressively 0)
    (setq-local scroll-down-aggressively 0)
    (let* ((start (window-start))
           (offset (count-lines
                    start (point))))
      (setq writer-org--04 offset))    
    (add-hook 'post-command-hook
              #'writer-org--00 nil t)
    (message "writer-org-34")))



(defun writer-org--redefine-bitmaps ()
  (dolist (i '(1 2 3))
    (define-fringe-bitmap
      (intern (format "writer-org-bm-%d" i))
      (make-vector (frame-char-height)
                   (aref writer-org--bitmaps (1- i)))
      (frame-char-height) 16)))

;; redefine on text scale change
(add-hook 'text-scale-mode-hook #'writer-org--redefine-bitmaps)



(defun writer-org--40 ()
  "compute sentence"
  )

(defun writer-org--41 (frame)
  (walk-windows
   (lambda (win)
     (when (buffer-local-value
            'writer-org-mode (window-buffer win))
       (with-selected-window win
         (writer-org--01))))
   nil frame)
  (message "writer-org-hook"))

(defun writer-org-enable ()
  "Lorem ipsum dolor sit amet."
  (setq writer-org--21 left-fringe-width)
  (setq writer-org--02 left-margin-width)
  (setq writer-org--03 right-margin-width)
  (writer-org--10)
  (writer-org--11)
  (writer-org--20)
  (writer-org--21)
  (writer-org--22)
  (writer-org-30)
  (writer-org-31)
  (writer-org-32)
  (writer-org-33)
  (writer-org-34)
  (add-hook
   'window-size-change-functions
   #'writer-org--41)
  (message "writer-org-enable"))

(defun writer-org-disable ()
  "Lorem ipsum dolor sit amet."
  (setq-local left-fringe-width writer-org--21)
  (setq-local left-margin-width writer-org--02)
  (setq-local right-margin-width writer-org--03)
  (setq writer-org--02 nil)
  (setq writer-org--03 nil)
  (when (eq (current-buffer)
            (window-buffer (selected-window)))
    (set-window-buffer (selected-window) (current-buffer)))
  (remove-hook 'window-size-change-functions #'writer-org-hook)
  (remove-hook 'post-command-hook #'writer-org--01 t)
  (face-remap-remove-relative my-mode--headers)
  (kill-local-variable 'header-line-format)
  (setq-local writer-org--10 nil)
  (kill-local-variable 'scroll-margin)
  (kill-local-variable 'maximum-scroll-margin)
  (kill-local-variable 'scroll-conservatively)
  (kill-local-variable 'scroll-up-aggressively)
  (kill-local-variable 'scroll-down-aggressively)
  (remove-overlays)
  (message "writer-org-disable"))


;;;###autoload
(define-minor-mode writer-org-mode
  "Writing layout mode for org buffers."
  :keymap (make-sparse-keymap)
  :lighter " writer"
  :group 'writer-org
  (if writer-org-mode
      (progn
        (writer-org-enable)
        (message "enabled"))
    (writer-org-disable)
    (message "disabled")))

;;;###autoload
(defun writer-org-reload ()
  "Re-apply current configuration to active buffer."
  (interactive)
  (writer-org-disable)
  (writer-org-enable)
  (message "reloaded"))

(provide 'writer-org)
;;; writer-org.el ends here

