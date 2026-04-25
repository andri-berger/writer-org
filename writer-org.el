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
  "Check var face is set already")

(defvar-local writer-org--10 nil
  "Clean var set-face-remap header")

(defvar-local writer-org--11 nil
  "Clean var set-face-remap mode")

(defvar-local writer-org--12 nil
  "Offset from edges of window.")

(defvar-local writer-org--13 nil
  "Temporary var left-fringe-width.")

(defvar-local writer-org--14 nil
  "Temporary var left-margin-width.")

(defvar-local writer-org--15 nil
  "Temporary var right-margin-width.")


(defcustom writer-org-16 nil
  "Centering horizontally"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-17 50
  "Max-width in pixel/chars"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-18 0
  "OK Left fringe width"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-20 0
  "lines config header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-21 0
  "lines config mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-22 0
  "char/line/word header"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-23 0
  "char/line/word mode"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-24 " - "
  "First Separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-25 " -- "
  "Second separator header / mode"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-26 "writer-org"
  "fallback text if no org-parent"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-27 'unspecified
  "faces inherit header mode line"
  :group 'writer-org
  :type 'string)

(defcustom writer-org-28 'unspecified
  "OK Custom face of vertical line"
  :group 'writer-org
  :type 'string)



(defcustom writer-org-30 0
  "OK vertical gap fringe left"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-31 0
  "NOT YET Vertical gap at the edge"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-32 0
  "OK line-styles 0-4"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-33 0
  "OK hierarchy treshold"
  :group 'writer-org
  :type 'integer)

(defcustom writer-org-34 nil
  "OK LTR vs RTL Alignment"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-35 nil
  "Enable typing-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-36 nil
  "Enable cursor-mode"
  :group 'writer-org
  :type 'boolean)

(defcustom writer-org-37 nil
  "Enable org-mode"
  :group 'writer-org
  :type 'boolean)








(defun writer-org--40 (org-fn)
  "Lorem ipsum sit dolor amet."
  (remove-overlays
   nil nil 'writer-orgs t)
  (org-back-to-heading t)
  (apply org-fn)    
  (writer-org--51))

(defun writer-org--41 (org-fn)
  "Lorem ipsum sit dolor amet."
  (walk-windows
   (lambda (fn)
     (when (buffer-local-value
            'writer-org-mode
            (window-buffer fn))
       (with-selected-window fn
         (writer-org--42))))
   nil org-fn))

(defun writer-org--42 ()
  "OK Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org-16)
         (l1 writer-org-17)
         (l2 writer-org-18)
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

(defun writer-org--43 ()
  "OK Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org-20)
         (l1 writer-org-21)
         (l2 writer-org-22)
         (l3 writer-org-23)
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
                  writer-org-26)))
    (writer-org--44 'header-line-format
                    'header-line l0
                    l9 l10 l11)
    (writer-org--44 'mode-line-format
                    'mode-line l1
                    l9 l10 l11)))

(defun writer-org--44
    (f0 f1 f2 f3 f4 f5)
  "OK Lorem ipsum dolor sit amet."
  (when (memq f2 '(1 2 3 4 5 6 7))
    (let* ((l0 (memq f2 '(2 4 5 7)))
           (l1 (memq f2 '(3 4 6 7)))
           (l2 (memq f2 '(5 7)))
           (l3 (memq f2 '(6 7)))
           (l4 writer-org-24)
           (l5 writer-org-25)
           (l6 writer-org-27))
      (unless writer-org--05
        (setq writer-org--05 t)
        (set (if (eq f1 'mode-line)
                       'writer-org--11
                     'writer-org--10)
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

(defun writer-org--45 (f0 f1 f2)
  "OK Lorem ipsum dolor sit amet."
  (when (> f0 writer-org-33)
    (let* ((l2 writer-org-28)
           (l3 writer-org-30)
           (l4 writer-org-32)
           (l5 writer-org-34)
           (l0 writer-org--00)
           (l1 writer-org--01)
           (l6 "writer-org-%d")
           (l7 (+ writer-org-33 1))
           (l8 (make-overlay f1 f2))
           (l9 (+ (- f0 l7) (* l4 4)))
           (l10 (aref (if l5 l1 l0) l9))
           (l11 (intern (format l6 f0)))
           (l12 (- (frame-char-height) l3))
           (l13 (propertize " " 'display
                            (list 'left-fringe
                                  l10 l2))))
      (define-fringe-bitmap l11
        (make-vector l12 l10) l12 16)
      (overlay-put l8 'writer-org t)
      (overlay-put l8 'evaporate t)
      (overlay-put l8 'priority f0)
      (overlay-put l8 'line-prefix l13)
      (overlay-put l8 'wrap-prefix l13))))

(defun writer-org--46 ()
  "OK Lorem ipsum sit dolor amet."
  (org-with-wide-buffer
   (org-element-map
       (org-element-parse-buffer 
        'headline)
       'headline
     (lambda (h)
       (let* ((l0 writer-org-33)
              (l1 (1- (org-element-property
                      :contents-begin h)))
              (l2 (org-element-property :level h))
              (l3 (org-element-property :begin h))
              (l4 (org-element-property :end h))     
              (l5 (if (<= l2 l0) (+ l3 l2 1) l1))
              (l6 (if (<= l2 l0) l1 (- l3 1)))
              (l7 (make-overlay l6 l5)))
         (overlay-put l7 'writer-orgs t)
         (overlay-put l7 'evaporate t)
         (overlay-put l7 'display "")
         (writer-org--45 l2 l3 l4))))))

(defun writer-org--47 ()
  "Lorem ipsum dolor sit amet."
  (let* ((l0 writer-org--02)
         (l1 writer-org--03)
         (l2 writer-org--12)
         (l3 writer-org-35)
         (l4 writer-org-36)
         (l5 writer-org-37)
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
  (advice-add fn :around #'writer-org--40))
  (setq writer-org--13 left-fringe-width)
  (setq writer-org--14 left-margin-width)
  (setq writer-org--15 right-margin-width)
  (setq-local sentence-end-double-space nil)
  (setq-local display-line-numbers nil)
  (add-hook 'window-size-change-functions
            #'writer-org--41)
  (add-hook 'post-command-hook
            #'writer-org--43 t)  
  (writer-org--42)
  (writer-org--43)
  (writer-org--46))

(defun writer-org--disable ()
  "Lorem ipsum dolor sit amet."
  (let ((l0 writer-org--13)
        (l1 writer-org--14)
        (l2 writer-org--15)
        (l3 writer-org--10)
        (l4 writer-org--11)
        (l5 'post-command-hook)
        (l6 'window-size-change-functions)
  (remove-overlays nil nil 'writer-orgs t)
  (remove-overlays nil nil 'writer-org t)
  (remove-hook l5 #'writer-org--43 t)  
  (remove-hook l6 #'writer-org--40)
  (setq-local left-fringe-width l0)
  (setq-local left-margin-width l1)
  (setq-local right-margin-width l2)
  (face-remap-remove-relative l3)
  (face-remap-remove-relative l4))
  (setq writer-org--13 nil)
  (setq writer-org--14 nil)
  (setq writer-org--15 nil)
  (setq writer-org--10 nil)
  (setq writer-org--11 nil)
  (setq writer-org--05 nil)
  (setq writer-org--12 nil)
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
     fn #'writer-org--40))
  (force-mode-line-update t))
  

;;;###autoload
(defun writer-org-map ()
  "Lorem ipsum dolor sit amet."
  (interactive)
  (if writer-org--04
      (progn
        (remove-hook
         'post-command-hook
         #'writer-org--47)
        (setq writer-org--12 nil)
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
      (setq writer-org--12 offset))   
    (add-hook 'post-command-hook
              #'writer-org--47 nil t))
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

