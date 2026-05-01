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
;; Version 0.1
;; Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
;; eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
;; voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet
;; kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
;;
;;
;;; Code:


(defgroup writer-org nil
  "Writing layout for org buffers."
  :prefix "writer-org-"
  :group 'text)

(defconst writer-org--00
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

(defconst writer-org--01
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

(defconst writer-org--02
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

(defconst writer-org--03
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

(defvar-local writer-org--04 nil
  "Toggle hooking mode (keep track).")

(defvar-local writer-org--05 nil
  "Offset from edges of window.")

(defvar-local writer-org--06 nil
  "Temporary var left-fringe-width.")

(defvar-local writer-org--07 nil
  "Temporary var left-margin-width.")

(defvar-local writer-org--08 nil
  "Temporary var right-margin-width.")

(defvar-local writer-org--09 nil
  "Clean var set-face-remap header")

(defvar-local writer-org--10 nil
  "Clean var set-face-remap mode")

(defvar-local writer-org--11 nil
  "Check var face is set already")


(defcustom writer-org-0 nil
  "Enable centering in typing-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-1 nil
  "Enable anchoring in navigation-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-2 nil
  "Enable anchoring in org-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-3 nil
  "LTR vs RTL Alignment"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-4 nil
  "Centering horizontally"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-5 50
  "Max-width in pixel/chars"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-6 0
  "Left fringe width"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-7 0
  "Vertical gap at the edge"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-8 0
  "Vertical gap fringe left"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-9 0
  "Line-styles 0-4"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-10 0
  "Hierarchy treshold"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-11 0
  "lines config header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-12 0
  "lines config mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-13 0
  "char/line/word header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-14 0
  "char/line/word mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-15 "/"
  "First Separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-16 " // "
  "Second separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-17 "writer"
  "fallback text if no org-parent"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-18 'unspecified
  "Faces inherit header mode line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-19 'unspecified
  "Custom face of vertical line"
  :group 'writer-org
  :type 'string)


(defun writer-org--00 (org-fn)
  "Lorem ipsum sit dolor amet."
  (remove-overlays
   nil nil 'writer-orgs t)
  (org-back-to-heading t)
  (apply org-fn)    
  (writer-org--51))

(defun writer-org--01 (org-fn)
  "Lorem ipsum sit dolor amet."
  (walk-windows
   (lambda (fn)
     (when (buffer-local-value
            'writer-org-mode
            (window-buffer fn))
       (with-selected-window fn
         (writer-org--02))))
   nil org-fn))

(defun writer-org--02 ()
  "OK Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org-4)
         (l1 writer-org-5)
         (l2 writer-org-6)
         (l3 (if (eq l0 t) 0 1))
         (l4 (if (eq l0 t) 2 1))
         (l5 (window-total-width))
         (l6 (max (/ (- l5 l1) 2) 0)))
    (setq-local left-fringe-width (+ 26 l2))
    (setq-local left-margin-width (* l6 l3))
    (setq-local right-margin-width (* l6 l4)))
  (when (eq (current-buffer)
            (window-buffer
             (selected-window)))
    (set-window-buffer
     (selected-window)
     (current-buffer))))

(defun writer-org--03 ()
  "OK Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org-11)
         (l1 writer-org-12)
         (l2 writer-org-13)
         (l3 writer-org-14)
         (l4 (org-before-first-heading-p))
         (l5 (+ (count-words (point-min) (point)) 1))
         (l6 (+ (count-lines (point-min) (point)) 1))
         (l7 (+ (count-words (point-min) (point-max)) 1))
         (l8 (+ (count-lines (point-min) (point-max)) 1))
         (l9 (aref (vector "" (point-max) l5 l6) l2))
         (l10 (aref (vector "" (point) l7 l8) l3))
         (l11 (or (and (not l4)
                       (save-excursion
                         (org-back-to-heading t)
                         (org-get-heading t t)))
                  writer-org-17)))
    (writer-org--04 'header-line-format
                    'header-line l0
                    l9 l10 l11)
    (writer-org--04 'mode-line-format
                    'mode-line l1
                    l9 l10 l11)))

(defun writer-org--04
    (f0 f1 f2 f3 f4 f5)
  "OK Lorem ipsum dolor sit amet."
  (when (memq f2 '(1 2 3 4 5 6 7))
    (let* ((l0 (memq f2 '(2 4 5 7)))
           (l1 (memq f2 '(3 4 6 7)))
           (l2 (memq f2 '(5 7)))
           (l3 (memq f2 '(6 7)))
           (l4 writer-org-15)
           (l5 writer-org-16)
           (l6 writer-org-18))
      (unless writer-org--11
        (setq writer-org--11 t)
        (set (if (eq f1 'mode-line)
                       'writer-org--10
                     'writer-org--09)
                (face-remap-add-relative
                 f1 (list :overline (when l2 t)
                         :underline (when l3 t)
                         :inherit l6))))
      (set (make-local-variable f0)
             (list (propertize
                    (format "%d%s%d%s%s"
                            f3 l4 f4 l5 f5)
                    'face (list :overline (when l0 t)
                                :underline (when l1
                                  '(:position t)
                                  ))))))))

(defun writer-org--05 (f0 f1 f2 f3)
  "OK Lorem ipsum dolor sit amet."
  (when (> f0 writer-org-10)
    (let* ((l0 writer-org-3)
           (l1 writer-org-7)
           (l2 writer-org-8)
           (l3 writer-org-9)
           (l4 writer-org-19)
           (l5 writer-org--00)
           (l6 writer-org--01)
           (l7 (1+ writer-org-10))
           (l8 (make-overlay f2 f3))
           (l9 (frame-char-height))
           (l10 (- l9 (abs l1) l2))
           (l11 (+ (- f1 l7) (* l3 4)))
           (l12 (aref (if l0 l6 l5) l11))
           (l13 '["center" "top" "bottom"])
           (l14 (format "writer-org-%d" f1))
           (l15 (if aref (or f0 0) l13))
           (l16 (propertize " " 'display
                            (list 'left-fringe
                                  l12 l4))))
      (define-fringe-bitmap (intern (l14))
        (make-vector l10 l12) l10 16 l15)
      (overlay-put l8 'line-prefix l16)
      (overlay-put l8 'wrap-prefix l16)
      (overlay-put l8 'writer-org t)
      (overlay-put l8 'evaporate t)
      (overlay-put l8 'priority f1))))

(defun writer-org--06 ()
  "OK Lorem ipsum sit dolor amet."
  (org-with-wide-buffer
   (org-element-map
       (org-element-parse-buffer 
        'headline)
       'headline
     (lambda (fn)
       (let* ((l0 writer-org-7)
              (l1 writer-org-10)
              (l2 (1- (org-element-property
                      :contents-begin fn)))
              (l4 (org-element-property :end fn))
              (l3 (org-element-property :begin fn))              
              (l5 (org-element-property :level fn))
              (l6 (if (<= l5 l1) (+ l3 l5 1) l2))
              (l7 (if (<= l5 l1) l2 (- l3 1)))
              (l8 (make-overlay l7 l6))
              (l9 (if (minusp l0) 2 0))
              (l10 (if (plusp l0) 1 l9)))
         (overlay-put l8 'display "")
         (overlay-put l8 'evaporate t)
         (overlay-put l8 'writer-orgs t)
         (writer-org--05 0 l2 (1+ l3) l4)
         (writer-org--05 l10 l2 l3 l3))))))

(defun writer-org--07 ()
  "Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org--02)
         (l1 writer-org--03)
         (l2 writer-org--05)
         (l3 writer-org-0)
         (l4 writer-org-1)
         (l5 writer-org-2)
         (l6 this-command)
         (l7 (memq l6 l0))
         (l8 (memq l6 l1))
         (l9 (count-lines
              (window-start)
              (point))))
    (when (> (abs (- l9 l2)) 0)
      (when (or (and l7 l3)
                  (and l8 l4)
                  (and l5
                       (not
                        (or l67 l67))))
          (recenter l1)))))


(defun writer-org--enable ()
  "Lorem ipsum dolor sit amet."
  (dolist (fn '(org-demote
                org-promote
                org-cut-subtree
                org-copy-subtree
                org-paste-subtree
                org-demote-subtree
                org-promote-subtree
                org-move-subtree-up
                org-narrow-to-subtree
                org-move-subtree-down))
  (advice-add fn :around #'writer-org--00))
  (setq writer-org--06 left-fringe-width)
  (setq writer-org--07 left-margin-width)
  (setq writer-org--08 right-margin-width)
  (setq-local sentence-end-double-space nil)
  (setq-local display-line-numbers nil)
  (add-hook 'window-size-change-functions
            #'writer-org--01)
  (add-hook 'post-command-hook
            #'writer-org--03 t)  
  (writer-org--02)
  (writer-org--03)
  (writer-org--06))

(defun writer-org--disable ()
  "Lorem ipsum dolor sit amet."
  (let ((l0 writer-org--06)
        (l1 writer-org--07)
        (l2 writer-org--08)
        (l3 writer-org--09)
        (l4 writer-org--10)
        (l5 'post-command-hook)
        (l6 'window-size-change-functions)
  (remove-overlays nil nil 'writer-orgs t)
  (remove-overlays nil nil 'writer-org t)
  (remove-hook l5 #'writer-org--03 t)  
  (remove-hook l6 #'writer-org--00)
  (setq-local left-fringe-width l0)
  (setq-local left-margin-width l1)
  (setq-local right-margin-width l2)
  (face-remap-remove-relative l3)
  (face-remap-remove-relative l4))
  (setq writer-org--05 nil)
  (setq writer-org--06 nil)
  (setq writer-org--07 nil)
  (setq writer-org--08 nil)
  (setq writer-org--09 nil)
  (setq writer-org--10 nil)
  (setq writer-org--11 nil)
  (when (eq (current-buffer)
            (window-buffer
             (selected-window)))
    (set-window-buffer
     (selected-window)
     (current-buffer))))

(defun writer-org--disabled ()
  "Lorem ipsum dolor sit amet."
  (dolist (fn '(scroll-margin
                mode-line-format
                header-line-format
                display-line-numbers
                maximum-scroll-margin
                scroll-conservatively
                scroll-up-aggressively
                scroll-down-aggressively
                sentence-end-double-space))
              (kill-local-variable fn))
  (dolist (fn '(org-demote
                org-promote
                org-cut-subtree
                org-copy-subtree
                org-paste-subtree
                org-demote-subtree
                org-promote-subtree
                org-move-subtree-up
                org-narrow-to-subtree
                org-move-subtree-down))
    (advice-remove
     fn #'writer-org--00))
  (force-mode-line-update t))
  

;;;###autoload
(defun writer-org-map ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (if writer-org--04
      (progn
        (remove-hook
         'post-command-hook
         #'writer-org--07)
        (setq writer-org--05 nil)
        (setq writer-org--04 nil))
    (setq writer-org--04 t)
    (setq-local scroll-margin 0)
    (setq-local maximum-scroll-margin 0)
    (setq-local scroll-conservatively 0)
    (setq-local scroll-up-aggressively 0)
    (setq-local scroll-down-aggressively 0)
    (let* ((start (window-start))
           (offset (count-lines
                    start (point))))
      (setq writer-org--05 offset))
    (add-hook 'post-command-hook
              #'writer-org--07 nil t))
  (message "hooked"))

;;;###autoload
(define-minor-mode writer-org-mode
  "Writing layout mode for org buffers."
  :keymap (make-sparse-keymap)
  :lighter " writer-org"
  :group 'writer-org
  (if writer-org-mode
      (progn
        (writer-org--enable)
        (message "enabled"))
    (writer-org--disabled)
    (writer-org--disable)
    (message "disabled")))

;;;###autoload
(defun writer-org-load ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (writer-org--disabled)
  (writer-org--disable)
  (writer-org--enable)
  (message "loaded"))

(provide 'writer-org)
;;; writer-org.el ends here

