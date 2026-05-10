;;; ematrix-theme.el --- Matrix-inspired theme from OpenCode  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Zi Liang

;; Author: Zi Liang <2273067585@qq.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme
;; URL: https://github.com/anomalyco/opencode

;;; Commentary:
;;
;; A dark theme replicating the OpenCode "Matrix" color scheme.
;; Colors sourced from https://github.com/anomalyco/opencode
;;   packages/ui/src/theme/themes/matrix.json
;;
;; Dark green-tinted background with bright green foreground,
;; purple keywords, teal functions, orange constants.
;;
;; Usage:
;;   (load-theme 'ematrix t)

;;; Code:

(deftheme ematrix
  "Dark Matrix theme from OpenCode TUI.")

(let* ((bg       "#0a0e0a")   ; neutral dark
       (bg-alt   "#0e120e")   ; slightly lighter surface
       (bg-sel   "#203022")   ; selection background
       (fg       "#62ff94")   ; ink / foreground
       (fg-dim   "#8ca391")   ; text-weak / comments
       (fg-alt   "#4a5c4d")   ; very dim (line numbers)
       (black    "#0a0e0a")
       (red      "#ff4b4b")   ; error
       (orange   "#ffa83d")   ; constant
       (yellow   "#e6ff57")   ; warning / type
       (green    "#1cc24b")   ; string / success
       (teal     "#24f6d9")   ; operator / property / function
       (cyan     "#00efff")   ; heading level 1
       (blue     "#30b3ff")   ; info / link / primitive
       (purple   "#c770ff")   ; accent / keyword
       (diff-add "#77ffaf")   ; diff added
       (diff-del "#ff7171"))  ; diff removed

  (custom-theme-set-faces
   'ematrix

   ;; --- Base ---
   `(default          ((t (:background ,bg       :foreground ,fg))))
   `(cursor           ((t (:background ,fg))))
   `(region           ((t (:background ,bg-sel))))
   `(highlight        ((t (:background ,bg-sel))))
   `(secondary-selection ((t (:background ,bg-sel))))
   `(fringe           ((t (:background ,bg))))
   `(vertical-border  ((t (:foreground ,bg-alt))))
   `(window-divider   ((t (:foreground ,bg-alt))))
   `(minibuffer-prompt ((t (:foreground ,purple :weight bold))))
   `(escape-glyph     ((t (:foreground ,orange))))
   `(homoglyph        ((t (:foreground ,orange))))
   `(shadow           ((t (:foreground ,fg-dim))))
   `(trailing-whitespace ((t (:background ,red))))
   `(whitespace-tab   ((t (:foreground ,fg-alt))))
   `(whitespace-space ((t (:foreground ,fg-alt))))
   `(whitespace-newline ((t (:foreground ,fg-alt))))

   ;; --- Modeline ---
   `(mode-line           ((t (:background ,bg-alt :foreground ,fg :box nil))))
   `(mode-line-inactive  ((t (:background ,bg     :foreground ,fg-dim :box nil))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis  ((t (:weight bold))))
   `(mode-line-highlight ((t (:box (:line-width 1 :color ,fg)))))

   ;; --- Header Line ---
   `(header-line         ((t (:background ,bg-alt :foreground ,fg-dim))))
   `(header-line-highlight ((t (:background ,bg-sel))))

   ;; --- Line Numbers ---
   `(line-number              ((t (:foreground ,fg-alt :background ,bg))))
   `(line-number-current-line ((t (:foreground ,fg :background ,bg :weight bold))))
   `(line-number-major-tick   ((t (:foreground ,fg :background ,bg :weight bold))))

   ;; --- Font Lock (syntax highlighting) ---
   `(font-lock-comment-face        ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,fg-dim))))
   `(font-lock-keyword-face        ((t (:foreground ,purple :weight bold))))
   `(font-lock-string-face         ((t (:foreground ,green))))
   `(font-lock-builtin-face        ((t (:foreground ,blue))))
   `(font-lock-variable-name-face  ((t (:foreground ,fg))))
   `(font-lock-type-face           ((t (:foreground ,yellow))))
   `(font-lock-constant-face       ((t (:foreground ,orange))))
   `(font-lock-function-name-face  ((t (:foreground ,teal))))
   `(font-lock-operator-face       ((t (:foreground ,teal))))
   `(font-lock-property-name-face  ((t (:foreground ,teal))))
   `(font-lock-warning-face        ((t (:foreground ,yellow :weight bold))))
   `(font-lock-negation-char-face  ((t (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face   ((t (:foreground ,orange))))
   `(font-lock-doc-face            ((t (:foreground ,fg-dim :slant italic))))
   `(font-lock-doc-markup-face     ((t (:foreground ,fg-dim))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))

   ;; --- Search / Replace ---
   `(isearch        ((t (:background ,purple :foreground ,black :weight bold))))
   `(isearch-fail   ((t (:background ,red    :foreground ,black))))
   `(lazy-highlight ((t (:background ,bg-sel))))
   `(match          ((t (:background ,purple :foreground ,black :weight bold))))
   `(query-replace  ((t (:background ,purple :foreground ,black))))

   ;; --- Completion ---
   `(completions-common-part    ((t (:foreground ,blue))))
   `(completions-first-difference ((t (:foreground ,teal :weight bold))))

   ;; --- Links ---
   `(link        ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,purple :underline t))))

   ;; --- Errors / Warnings ---
   `(error   ((t (:foreground ,red    :weight bold))))
   `(warning ((t (:foreground ,yellow :weight bold))))
   `(success ((t (:foreground ,green  :weight bold))))

   ;; --- Parens ---
   `(show-paren-match     ((t (:background ,bg-sel :foreground ,fg :weight bold))))
   `(show-paren-mismatch  ((t (:background ,red    :foreground ,black :weight bold))))
   `(show-paren-match-expression ((t (:background ,bg-sel))))

   ;; --- Widgets / UI ---
   `(tooltip              ((t (:background ,bg-alt :foreground ,fg))))
   `(widget-field         ((t (:background ,bg-alt :foreground ,fg))))
   `(button               ((t (:foreground ,blue :underline t))))
   `(custom-button        ((t (:foreground ,blue :underline t))))
   `(custom-changed       ((t (:foreground ,yellow))))
   `(custom-modified      ((t (:foreground ,yellow))))
   `(custom-state         ((t (:foreground ,green))))
   `(custom-variable-tag  ((t (:foreground ,teal :weight bold))))

   ;; --- Dired ---
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink   ((t (:foreground ,teal))))
   `(dired-marked    ((t (:foreground ,yellow :weight bold))))
   `(dired-flagged   ((t (:foreground ,red :weight bold))))

   ;; --- Diff ---
   `(diff-added          ((t (:background "#0e2a14" :foreground ,diff-add))))
   `(diff-removed        ((t (:background "#2a0e0e" :foreground ,diff-del))))
   `(diff-changed        ((t (:background "#1a1a0e" :foreground ,yellow))))
   `(diff-file-header    ((t (:background ,bg-alt :foreground ,fg :weight bold))))
   `(diff-header         ((t (:background ,bg-alt :foreground ,fg))))
   `(diff-hunk-header    ((t (:background ,bg-sel :foreground ,teal))))
   `(diff-function       ((t (:background ,bg-sel :foreground ,blue))))
   `(diff-context        ((t (:foreground ,fg-dim))))
   `(diff-refine-added   ((t (:background "#1a4a2a"))))
   `(diff-refine-removed ((t (:background "#4a1a1a"))))

   ;; --- Magit ---
   `(magit-section-heading        ((t (:foreground ,teal :weight bold))))
   `(magit-section-highlight      ((t (:background ,bg-sel))))
   `(magit-branch-current         ((t (:foreground ,green :weight bold))))
   `(magit-branch-local           ((t (:foreground ,blue))))
   `(magit-branch-remote          ((t (:foreground ,teal))))
   `(magit-diff-added             ((t (:foreground ,diff-add))))
   `(magit-diff-removed           ((t (:foreground ,diff-del))))
   `(magit-diff-hunk-heading      ((t (:background ,bg-sel :foreground ,teal))))
   `(magit-log-author             ((t (:foreground ,orange))))
   `(magit-log-date               ((t (:foreground ,fg-dim))))
   `(magit-log-graph              ((t (:foreground ,fg-dim))))
   `(magit-hash                   ((t (:foreground ,blue))))

   ;; --- Org Mode ---
   `(org-level-1            ((t (:foreground ,cyan   :weight bold :height 1.4))))
   `(org-level-2            ((t (:foreground ,yellow :weight bold :height 1.3))))
   `(org-level-3            ((t (:foreground ,teal   :weight bold :height 1.2))))
   `(org-level-4            ((t (:foreground ,purple :weight semi-bold :height 1.1))))
   `(org-level-5            ((t (:foreground ,blue   :weight semi-bold))))
   `(org-level-6            ((t (:foreground ,orange))))
   `(org-level-7            ((t (:foreground ,green))))
   `(org-level-8            ((t (:foreground ,fg-dim))))
   `(org-document-title     ((t (:foreground ,cyan   :weight bold :height 1.6))))
   `(org-document-info      ((t (:foreground ,fg-dim))))
   `(org-document-info-keyword ((t (:foreground ,fg-dim))))
   `(org-link               ((t (:foreground ,blue :underline t))))
   `(org-date               ((t (:foreground ,teal :underline t))))
   `(org-todo               ((t (:foreground ,orange :background ,bg-sel :weight bold :box (:line-width 1 :color ,orange)))))
   `(org-done               ((t (:foreground ,green  :weight bold))))
   `(org-headline-done      ((t (:foreground ,fg-dim :strike-through t))))
   `(org-block              ((t (:background ,bg-alt :foreground ,fg :extend t))))
   `(org-block-begin-line   ((t (:foreground ,fg-dim :background ,bg-alt :extend t))))
   `(org-block-end-line     ((t (:foreground ,fg-dim :background ,bg-alt :extend t))))
   `(org-code               ((t (:foreground ,green :background ,bg-alt))))
   `(org-verbatim           ((t (:foreground ,green :background ,bg-alt))))
   `(org-meta-line          ((t (:foreground ,fg-dim))))
   `(org-drawer             ((t (:foreground ,fg-dim))))
   `(org-special-keyword    ((t (:foreground ,fg-dim))))
   `(org-property-value     ((t (:foreground ,fg-dim))))
   `(org-table              ((t (:foreground ,blue))))
   `(org-formula            ((t (:foreground ,orange))))
   `(org-tag                ((t (:foreground ,purple :weight normal))))
   `(org-checkbox           ((t (:foreground ,teal :weight bold))))
   `(org-list-dt            ((t (:foreground ,teal :weight bold))))
   `(org-archived           ((t (:foreground ,fg-dim))))
   `(org-scheduled          ((t (:foreground ,green))))
   `(org-scheduled-today    ((t (:foreground ,teal :weight bold))))
   `(org-scheduled-previously ((t (:foreground ,red))))
   `(org-deadline-announce  ((t (:foreground ,red))))
   `(org-agenda-date        ((t (:foreground ,teal))))
   `(org-agenda-date-today  ((t (:foreground ,teal :weight bold :height 1.2))))
   `(org-agenda-date-weekend ((t (:foreground ,fg-dim))))
   `(org-agenda-current-time ((t (:foreground ,purple :weight bold))))
   `(org-agenda-structure   ((t (:foreground ,blue :weight bold))))
   `(org-time-grid          ((t (:foreground ,fg-dim))))
   `(org-warning            ((t (:foreground ,yellow :weight bold))))

   ;; --- Markdown ---
   `(markdown-header-face-1            ((t (:foreground ,cyan   :weight bold :height 1.4))))
   `(markdown-header-face-2            ((t (:foreground ,yellow :weight bold :height 1.3))))
   `(markdown-header-face-3            ((t (:foreground ,teal   :weight bold :height 1.2))))
   `(markdown-header-face-4            ((t (:foreground ,purple :weight semi-bold :height 1.1))))
   `(markdown-header-face-5            ((t (:foreground ,blue   :weight semi-bold))))
   `(markdown-header-face-6            ((t (:foreground ,orange))))
   `(markdown-link-face                ((t (:foreground ,blue :underline t))))
   `(markdown-inline-code-face         ((t (:foreground ,green :background ,bg-alt))))
   `(markdown-code-face                ((t (:background ,bg-alt :extend t))))
   `(markdown-blockquote-face          ((t (:foreground ,fg-dim :slant italic))))
   `(markdown-italic-face              ((t (:foreground ,orange :slant italic))))
   `(markdown-bold-face                ((t (:foreground ,yellow :weight bold))))
   `(markdown-markup-face              ((t (:foreground ,fg-dim))))
   `(markdown-list-face                ((t (:foreground ,blue))))
   `(markdown-pre-face                 ((t (:background ,bg-alt :extend t))))

   ;; --- Company ---
   `(company-tooltip            ((t (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection  ((t (:background ,bg-sel :foreground ,fg))))
   `(company-tooltip-common     ((t (:foreground ,blue))))
   `(company-tooltip-annotation ((t (:foreground ,fg-dim))))
   `(company-scrollbar-fg       ((t (:background ,fg-alt))))
   `(company-scrollbar-bg       ((t (:background ,bg))))

   ;; --- Vertico / Ivy / Counsel ---
   `(vertico-current   ((t (:background ,bg-sel :foreground ,fg :weight bold))))
   `(ivy-current-match ((t (:background ,bg-sel :foreground ,fg :weight bold))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,blue))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,teal))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,purple))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,orange))))
   `(ivy-posframe           ((t (:background ,bg-alt :foreground ,fg))))
   `(ivy-posframe-border    ((t (:background ,purple))))
   `(ivy-posframe-cursor    ((t (:background ,fg))))
   `(counsel-outline-1      ((t (:foreground ,cyan))))
   `(counsel-outline-2      ((t (:foreground ,yellow))))
   `(counsel-outline-3      ((t (:foreground ,teal))))
   `(counsel-outline-4      ((t (:foreground ,purple))))

   ;; --- Marginalia ---
   `(marginalia-key          ((t (:foreground ,teal :weight bold))))
   `(marginalia-file-name    ((t (:foreground ,fg))))
   `(marginalia-file-size    ((t (:foreground ,fg-dim))))
   `(marginalia-mode         ((t (:foreground ,purple))))
   `(marginalia-date         ((t (:foreground ,fg-dim))))

   ;; --- Doom Modeline ---
   `(doom-modeline-bar           ((t (:background ,teal))))
   `(doom-modeline-buffer-file   ((t (:foreground ,fg :weight bold))))
   `(doom-modeline-buffer-path   ((t (:foreground ,fg-dim))))
   `(doom-modeline-info          ((t (:foreground ,blue))))
   `(doom-modeline-warning       ((t (:foreground ,yellow))))
   `(doom-modeline-urgent        ((t (:foreground ,red))))
   `(doom-modeline-project-dir   ((t (:foreground ,purple :weight bold))))
   `(doom-modeline-buffer-major-mode ((t (:foreground ,teal :weight bold))))

   ;; --- Eglot ---
   `(eglot-highlight-symbol-face ((t (:background ,bg-sel))))

   ;; --- Git Gutter ---
   `(git-gutter:added    ((t (:foreground ,diff-add :weight bold))))
   `(git-gutter:deleted  ((t (:foreground ,diff-del :weight bold))))
   `(git-gutter:modified ((t (:foreground ,yellow  :weight bold))))

   ;; --- Rainbow Delimiters ---
   `(rainbow-delimiters-depth-1-face  ((t (:foreground ,teal))))
   `(rainbow-delimiters-depth-2-face  ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-3-face  ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-4-face  ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-5-face  ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-6-face  ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-7-face  ((t (:foreground ,teal))))
   `(rainbow-delimiters-depth-8-face  ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-9-face  ((t (:foreground ,fg-dim))))

   ;; --- Highlight Indentation ---
   `(highlight-indentation-face       ((t (:background ,bg-alt))))
   `(highlight-indentation-current-column-face ((t (:background ,bg-sel))))

   ;; --- Evil ---
   `(evil-ex-lazy-highlight ((t (:background ,bg-sel))))
   `(evil-goggles-default-face ((t (:background ,bg-sel))))

   ;; --- HL Line ---
   `(hl-line ((t (:background ,bg-alt :extend t))))

   ;; --- Tab Bar ---
   `(tab-bar                ((t (:background ,bg))))
   `(tab-line               ((t (:background ,bg))))
   `(tab-bar-tab            ((t (:background ,bg-alt :foreground ,fg-dim))))
   `(tab-bar-tab-inactive   ((t (:background ,bg     :foreground ,fg-dim))))
   `(tab-line-tab-current   ((t (:background ,bg-alt :foreground ,fg :weight bold :box nil))))
   `(tab-line-tab-inactive  ((t (:background ,bg     :foreground ,fg-dim :box nil))))

   ;; --- Telega ---
   `(telega-msg-heading ((t (:foreground ,teal :weight bold))))
   `(telega-entity-type-text-link ((t (:foreground ,blue :underline t))))

   ;; --- Citre ---
   `(citre-mark-face ((t (:background ,bg-sel))))

   ;; --- Term ---
   `(term-color-black   ((t (:background ,bg :foreground ,bg))))
   `(term-color-red     ((t (:background ,red :foreground ,red))))
   `(term-color-green   ((t (:background ,green :foreground ,green))))
   `(term-color-yellow  ((t (:background ,yellow :foreground ,yellow))))
   `(term-color-blue    ((t (:background ,blue :foreground ,blue))))
   `(term-color-magenta ((t (:background ,purple :foreground ,purple))))
   `(term-color-cyan    ((t (:background ,teal :foreground ,teal))))
   `(term-color-white   ((t (:background ,fg :foreground ,fg))))

   ;; --- Ansi Colors ---
   `(ansi-color-black          ((t (:foreground ,bg       :background ,bg))))
   `(ansi-color-red            ((t (:foreground ,red      :background ,red))))
   `(ansi-color-green          ((t (:foreground ,green     :background ,green))))
   `(ansi-color-yellow         ((t (:foreground ,yellow    :background ,yellow))))
   `(ansi-color-blue           ((t (:foreground ,blue      :background ,blue))))
   `(ansi-color-magenta        ((t (:foreground ,purple    :background ,purple))))
   `(ansi-color-cyan           ((t (:foreground ,teal      :background ,teal))))
   `(ansi-color-white          ((t (:foreground ,fg        :background ,fg))))
   `(ansi-color-bright-black   ((t (:foreground ,fg-alt    :background ,fg-alt))))
   `(ansi-color-bright-red     ((t (:foreground "#ff7171"  :background "#ff7171"))))
   `(ansi-color-bright-green   ((t (:foreground "#77ffaf"  :background "#77ffaf"))))
   `(ansi-color-bright-yellow  ((t (:foreground "#ffff80"  :background "#ffff80"))))
   `(ansi-color-bright-blue    ((t (:foreground "#60c0ff"  :background "#60c0ff"))))
   `(ansi-color-bright-magenta ((t (:foreground "#e0a0ff"  :background "#e0a0ff"))))
   `(ansi-color-bright-cyan    ((t (:foreground "#60ffe0"  :background "#60ffe0"))))
   `(ansi-color-bright-white   ((t (:foreground "#ccffcc"  :background "#ccffcc"))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ematrix)
;;; ematrix-theme.el ends here
