;;; ematrix.el --- Refined graphite theme for Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2026 Zi Liang

;; Author: Zi Liang <2273067585@qq.com>
;; Version: 0.2.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme
;; URL: https://github.com/liangzid/ematrix

;;; Commentary:
;;
;; EMatrix provides a restrained graphite color theme and a balanced font
;; stack for long programming and research-writing sessions.

;;; Code:

(require 'cl-lib)
(require 'ematrix-theme)

(defgroup ematrix nil
  "Graphite theme and typography for Emacs."
  :group 'faces
  :prefix "ematrix-")

(defcustom ematrix-default-font nil
  "Preferred monospace font family.
When nil, select the first installed family from `ematrix-font-candidates'."
  :type '(choice (const :tag "Automatic" nil)
                 (string :tag "Font family"))
  :group 'ematrix)

(defcustom ematrix-default-font-size 14
  "Default monospace font size in points."
  :type 'integer
  :group 'ematrix)

(defcustom ematrix-font-candidates
  '("Maple Mono" "JetBrainsMono Nerd Font Mono" "IBM Plex Mono"
    "Cascadia Code" "Iosevka" "Fira Code" "monospace")
  "Monospace font families in preference order."
  :type '(repeat string)
  :group 'ematrix)

(defcustom ematrix-variable-pitch-font nil
  "Preferred variable-pitch font family.
When nil, select the first installed family from
`ematrix-variable-pitch-font-candidates'."
  :type '(choice (const :tag "Automatic" nil)
                 (string :tag "Font family"))
  :group 'ematrix)

(defcustom ematrix-variable-pitch-font-candidates
  '("Inter" "Noto Sans" "Source Sans 3" "DejaVu Sans" "sans-serif")
  "Variable-pitch font families in preference order."
  :type '(repeat string)
  :group 'ematrix)

(defcustom ematrix-cjk-font "Noto Sans CJK SC"
  "Preferred CJK font family.
The neutral sans-serif default is intended to harmonize with Maple Mono."
  :type 'string
  :group 'ematrix)

(defun ematrix--first-installed-font (families)
  "Return the first installed font in FAMILIES."
  (cl-find-if (lambda (family)
                (find-font (font-spec :family family)))
              families))

(defun ematrix--monospace-font-family ()
  "Return the configured or first available monospace font family."
  (or ematrix-default-font
      (ematrix--first-installed-font ematrix-font-candidates)
      "monospace"))

(defun ematrix--variable-pitch-font-family ()
  "Return the configured or first available variable-pitch font family."
  (or ematrix-variable-pitch-font
      (ematrix--first-installed-font ematrix-variable-pitch-font-candidates)
      "sans-serif"))

(defun ematrix-apply-font-to-frame (&optional frame)
  "Apply the EMatrix typography to FRAME or the selected frame."
  (let* ((target-frame (or frame (selected-frame)))
         (mono-family (ematrix--monospace-font-family))
         (variable-family (ematrix--variable-pitch-font-family))
         (font-name (format "%s-%d" mono-family ematrix-default-font-size)))
    ;; Establish the frame fontset before assigning its CJK fallback.
    (set-frame-font font-name t (list target-frame) t)
    (set-face-attribute 'default target-frame :weight 'regular)
    (set-face-attribute 'fixed-pitch target-frame :family mono-family)
    (set-face-attribute 'fixed-pitch-serif target-frame :family mono-family)
    (set-face-attribute 'variable-pitch target-frame :family variable-family)
    (when (and ematrix-cjk-font
               (find-font (font-spec :family ematrix-cjk-font)))
      (dolist (charset '(kana han cjk-misc bopomofo))
        ;; Set both the default fontset for future frames and this frame.
        (set-fontset-font t charset
                          (font-spec :family ematrix-cjk-font)
                          nil 'prepend)
        (set-fontset-font (frame-parameter target-frame 'font) charset
                          (font-spec :family ematrix-cjk-font)
                          nil 'prepend)))))

;;;###autoload
(defun ematrix-set-font ()
  "Apply EMatrix typography to existing and future graphical frames."
  (interactive)
  (let* ((mono-family (ematrix--monospace-font-family))
         (font-name (format "%s-%d" mono-family ematrix-default-font-size)))
    (setf (alist-get 'font default-frame-alist) font-name)
    (add-hook 'after-make-frame-functions #'ematrix-apply-font-to-frame)
    (dolist (frame (frame-list))
      (when (display-graphic-p frame)
        (ematrix-apply-font-to-frame frame)))
    ;; Font choices may have been cached before the theme finished loading.
    (clear-font-cache)
    (message "EMatrix font: %s %dpt; CJK: %s"
             mono-family ematrix-default-font-size ematrix-cjk-font)))

;;;###autoload
(defun ematrix-enable ()
  "Enable the EMatrix theme and apply its typography."
  (interactive)
  (load-theme 'ematrix t)
  (ematrix-set-font))

(provide 'ematrix)
;;; ematrix.el ends here
