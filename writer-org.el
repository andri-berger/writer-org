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

(defconst writer-org--20
  '[#b0000000000000010
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
    #b1110111011101110]
  "OK make-vector hash-table LTR")

(defconst writer-org--22
  '[#b0100000000000000
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
    #b0111011101110111]
  "OK make-vector hash-table RTL")

(defconst writer-org--00
  '(org-next-link
    org-next-item
    org-up-heading
    org-next-block
    org-previous-link
    org-previous-item
    org-previous-block
    org-forward-element
    org-backward-element
    org-forward-paragraph
    org-backward-paragraph
    org-next-visible-heading
    org-previous-visible-heading
    org-forward-heading-same-level
    org-backward-heading-same-level)
    "Lorem ipsum dolor sit amet.")

(defconst writer-org--01
  '(newline
    kill-line
    kill-word
    self-insert
    delete-char
    backward-kill-word
    newline-and-indent
    self-insert-command
    delete-backward-char
    backward-delete-char-untabify)
  "Lorem ipsum dolor sit amet.")

(defvar-local writer-org--02 nil
  "Temporary var left-margin-width.")

(defvar-local writer-org--03 nil
  "Temporary var right-margin-width.")

(defvar-local writer-org--04 nil
  "Global var ratio (unclear) ????.")

(defvar-local writer-org--10 nil
  "Clean var set-face-remap header")

(defvar-local writer-org--11 nil
  "Clean var set-face-remap mode")

(defvar-local writer-org--21 nil
  "Temporary var left-fringe-width.")




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



(defcustom writer-org-13 1
  "char/line/word header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-14 1
  "char/line/word mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-170 4
  "lines config header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-180 4
  "lines config mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-prefix "-"
  "First Separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-suffix " --- "
  "Second separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-heja "writer-org"
  "fallback text if no org-parent"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-11 'unspecified
  "faces inherit header mode line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-25 'default
  "OK Custom face of vertical line"
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
  "OK hierarchy treshold"
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





(defun writer-org--01 ()
  "Lorem ipsum dolor sit amet."
  (let* ((max writer-org-09)
         (marg (writer-org-08 2 1))
         (args (writer-org-08 0 1))
         (width (window-total-width))
         (margin (max (/ (- width max) 2) 0)))
    (setq-local left-margin-width (margin * args))
    (setq-local right-margin-width (margin * marg))
    (setq-local left-fringe-width (+ writer-org-21 26)))
  (when (eq (current-buffer) (window-buffer (selected-window)))
    (set-window-buffer (selected-window) (current-buffer))))

(defun writer-org--00 ()
  "Lorem ipsum dolor sit amet."
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
      (writer-test)
      (when (> (abs (- offset ratio)) 0)
        (when (or (and tt ratio0)
                  (and ss ratio1)
                  (and ratio2
                       (not (or tt ss))))
          (recenter ratio)))))

(defun writer-org--10
    (f0 f1 f2 f3 f4 f5 f6)
  "OK Lorem ipsum dolor sit amet."
  (when (memq f3 '(1 2 3 4 5 6 7))
    (let* ((l0 (memq f3 '(2 4 5 7)))
           (l1 (memq f3 '(3 4 6 7)))
           (l2 (memq f3 '(5 7)))
           (l3 (memq f3 '(6 7)))
           (l4 writer-org-prefix)
           (l5 writer-org-suffix))
      (if f2 (setq writer-org--10
                (face-remap-add-relative
                 f1 (list :overline
                         (when l2 t)
                         :underline
                         (when l3 t)
                         :inherit
                         writer-org-11)))
        (set (make-local-variable f0)
             (list (propertize
                    (format "%d%s%d%s%s"
                            f4 l4 f5 l5 f6)
                    'face (list :overline
                                (when l0 t)
                                :underline
                                (when l1
                                  '(:position t)
                                  )))))))))

(defun writer-test ()
  "Lorem ipsum dolor sit amet."
  (let* ((oxc writer-org-170)
         (os writer-org-180)
         (on writer-org-14)
         (om writer-org-13)
         (ch (org-before-first-heading-p))
         (aa (+ (count-words (point-min) (point)) 1))
         (cc (+ (count-lines (point-min) (point)) 1))
         (bb (+ (count-words (point-min) (point-max)) 1))
         (dd (+ (count-lines (point-min) (point-max)) 1))
         (bol (aref (vector "" (point-max) aa cc) om))
         (eol (aref (vector "" (point) bb dd) on))
         (srr (or (and (not ch)
                       (save-excursion
                         (org-back-to-heading t)
                         (org-get-heading t t t t)))
                  writer-org-heja)))
    (writer-org--10 'header-line-format
                    'header-line nil
                    oxc bol eol srr)
    (writer-org--10 'mode-line-format
                    'mode-line nil
                    os bol eol srr)))


(defun writer-org--20 (a b c)
  "Lorem ipsum dolor sit amet."
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
      (overlay-put ov 'writer-org t)
      (overlay-put ov 'evaporate t)
      (overlay-put ov 'priority a)
      (overlay-put ov 'line-prefix
                   (propertize " " 'display
                               (list 'left-fringe
                                     bitmap-symb
                                     writer-org-25)))
      (overlay-put ov 'wrap-prefix
                   (propertize " " 'display
                               (list 'left-fringe
                                     bitmap-symb
                                     writer-org-25))))))

(defun writer-org--21 (a b c)
  "Lorem ipsum sit dolor amet."
  (let* ((add (+ b a 1))
         (local writer-org-20)
         (check (< a (+ local 1)))
         (bol (if check b (- b 1)))
         (eol (if check add (- c 1)))
         (ov (make-overlay bol eol)))
    (overlay-put ov 'writer-org t)
    (overlay-put ov 'evaporate t)
    (overlay-put ov 'display "")))


(defun writer-org--22 ()
  "Lorem ipsum sit dolor amet."
  (org-with-wide-buffer
   (org-element-map
       (org-element-parse-buffer
        'headline)
       'headline
     (lambda (h)
       (writer-org--20
        (org-element-property :level h)
        (org-element-property :begin h)
        (org-element-property :end h))
       (writer-org--21
        (org-element-property :level h)
        (org-element-property :begin h)
        (org-element-property
         :contents-begin h))))))


(kill-local-variable 'header-line-format)
(face-remap-remove-relative writer-org--10)
(setq sentence-end-double-space nil)
(defun writer-testt ()
  (let ((oxc writer-org-170)
        (os writer-org-180))
    (writer-org--10 'header-line-format
                    'header-line t oxc
                    nil nil nil)
    (writer-org--10 'mode-line-format
                    'mode-line t os
                    nil nil nil)))







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
















;;;;; keybinding-functionalities
;;;;; keybinding-functionalities

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
    (add-hook 'post-command-hook
              (lambda () (writer-text 1)))
    (message "writer-org-34")))

(defun writer-org--23 (orig-fn &rest args)
  "Lorem ipsum sit dolor amet.."
    (remove-overlays
     (point-min)
     (point-max)
     'writer-org t)
    (outline-back-to-heading t)
    (apply orig-fn args)    
    (writer-org--22))



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
(advice-add 'org-demote :around #'writer-org--23)
(advice-add 'org-promote :around #'writer-org--23)
(advice-add 'org-cut-subtree :around #'writer-org--23)
(advice-add 'org-copy-subtree :around #'writer-org--23)
(advice-add 'org-paste-subtree :around #'writer-org--23)
(advice-add 'org-demote-subtree :around #'writer-org--23)
(advice-add 'org-promote-subtree :around #'writer-org--23)
(advice-add 'org-move-subtree-up :around #'writer-org--23)
(advice-add 'org-narrow-to-subtree :around #'writer-org--23)
(advice-add 'org-move-subtree-down :around #'writer-org--23)
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
  (remove-overlays (point-min) (point-max)
                   'writer-org t)
  (advice-remove 'org-demote #'writer-org--23)
  (advice-remove 'org-promote #'writer-org--23)
  (advice-remove 'org-cut-subtree #'writer-org--23)
  (advice-remove 'org-copy-subtree #'writer-org--23)
  (advice-remove 'org-paste-subtree #'writer-org--23)
  (advice-remove 'org-demote-subtree #'writer-org--23)
  (advice-remove 'org-promote-subtree #'writer-org--23)
  (advice-remove 'org-move-subtree-up #'writer-org--23)
  (advice-remove 'org-narrow-to-subtree #'writer-org--23)
  (advice-remove 'org-move-subtree-down #'writer-org--23)
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

