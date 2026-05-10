;;; ematrix.el --- Matrix theme from OpenCode  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Zi Liang

;; Author: Zi Liang <2273067585@qq.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme
;; URL: https://github.com/anomalyco/opencode

;;; Commentary:
;;
;; EMatrix — Emacs theme replicating the OpenCode "Matrix" color scheme.
;; Load with:
;;
;;   (add-to-list 'load-path "~/code/ematrix")
;;   (require 'ematrix)
;;   (use-package ematrix
;;     :load-path "~/code/ematrix"
;;     :config
;;     (load-theme 'ematrix t)
;;     ;; Optionally set font:
;;     ;; (ematrix-set-font))
;;
;; Font stack matches OpenCode: Berkeley Mono -> IBM Plex Mono -> system mono.

;;; Code:

(require 'ematrix-theme)

(defgroup ematrix nil
  "Matrix theme from OpenCode."
  :group 'faces
  :prefix "ematrix-")

(defcustom ematrix-default-font nil
  "Default font family for EMatrix theme.
If nil, uses the OpenCode font stack: Berkeley Mono, IBM Plex Mono,
then system monospace.  Set to a string like \"Cascadia Code\" to override."
  :type '(choice (const :tag "OpenCode stack" nil)
                 (string :tag "Custom font"))
  :group 'ematrix)

(defcustom ematrix-default-font-size 13
  "Default font size for EMatrix theme."
  :type 'integer
  :group 'ematrix)

(defcustom ematrix-variable-pitch-font nil
  "Variable-pitch font for EMatrix.
If nil, uses the same monospace stack."
  :type '(choice (const :tag "Same as monospace" nil)
                 (string :tag "Custom font"))
  :group 'ematrix)

(defcustom ematrix-chinese-font "LXGW WenKai Mono"
  "Chinese/CJK font for EMatrix theme."
  :type 'string
  :group 'ematrix)

;;;###autoload
(defun ematrix-set-font ()
  "Set the default font to match OpenCode's Matrix theme font stack."
  (interactive)
  (let* ((font-family (or ematrix-default-font
                          (cl-some (lambda (f) (when (find-font (font-spec :family f)) f))
                                   '("Berkeley Mono" "IBM Plex Mono" "Cascadia Code"
                                     "Fira Code" "JetBrains Mono"))
                          "monospace"))
         (font-spec-str (format "%s-%d" font-family ematrix-default-font-size)))
    (set-face-attribute 'default nil :font font-spec-str)
    (when ematrix-chinese-font
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family ematrix-chinese-font))))
    (when ematrix-variable-pitch-font
      (set-face-attribute 'variable-pitch nil :family ematrix-variable-pitch-font))
    (message "EMatrix font set to %s (size %d)" font-family ematrix-default-font-size)))

;;;###autoload
(defun ematrix-enable ()
  "Enable the EMatrix theme."
  (interactive)
  (load-theme 'ematrix t)
  (message "EMatrix theme enabled."))

(provide 'ematrix)
;;; ematrix.el ends here
