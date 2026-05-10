# EMatrix

[[file:./images/screenshot_20260510_163951.png]]

An Emacs theme replicating the [OpenCode](https://github.com/anomalyco/opencode) "Matrix" color scheme.

Dark green-tinted background with bright green foreground, purple keywords, teal functions, orange constants — the classic Matrix hacker aesthetic from the OpenCode terminal UI.

## Screenshot

```
                          ┌──────────────────────────────────┐
  0a0e0a background       │  #include <stdio.h>              │  ← #8ca391 comments
  62ff94 foreground       │                                  │
                          │  int main() {                    │  ← #e6ff57 types
                          │    char *msg = "hello";          │  ← #1cc24b strings
                          │    printf("%s\n", msg);          │  ← #24f6d9 functions
                          │    return 0;                     │  ← #c770ff keywords
                          │  }                               │
                          └──────────────────────────────────┘
```

## Color Palette

Sourced from `packages/ui/src/theme/themes/matrix.json` in the OpenCode repository.

| Role         | Hex       | Sample                             |
|-------------|-----------|------------------------------------|
| Background  | `#0a0e0a` | ![#0a0e0a](https://placehold.co/12/0a0e0a/0a0e0a) |
| Foreground  | `#62ff94` | ![#62ff94](https://placehold.co/12/62ff94/62ff94) |
| Comment     | `#8ca391` | ![#8ca391](https://placehold.co/12/8ca391/8ca391) |
| Keyword     | `#c770ff` | ![#c770ff](https://placehold.co/12/c770ff/c770ff) |
| String      | `#1cc24b` | ![#1cc24b](https://placehold.co/12/1cc24b/1cc24b) |
| Function    | `#24f6d9` | ![#24f6d9](https://placehold.co/12/24f6d9/24f6d9) |
| Type        | `#e6ff57` | ![#e6ff57](https://placehold.co/12/e6ff57/e6ff57) |
| Constant    | `#ffa83d` | ![#ffa83d](https://placehold.co/12/ffa83d/ffa83d) |
| Primitive   | `#30b3ff` | ![#30b3ff](https://placehold.co/12/30b3ff/30b3ff) |
| Error       | `#ff4b4b` | ![#ff4b4b](https://placehold.co/12/ff4b4b/ff4b4b) |
| Warning     | `#e6ff57` | ![#e6ff57](https://placehold.co/12/e6ff57/e6ff57) |
| Link        | `#30b3ff` | ![#30b3ff](https://placehold.co/12/30b3ff/30b3ff) |
| Diff added  | `#77ffaf` | ![#77ffaf](https://placehold.co/12/77ffaf/77ffaf) |
| Diff removed| `#ff7171` | ![#ff7171](https://placehold.co/12/ff7171/ff7171) |
| Mode-line   | `#0e120e` | ![#0e120e](https://placehold.co/12/0e120e/0e120e) |

**Org heading colors:**

| Level | Hex       |
|-------|-----------|
| 1     | `#00efff` |
| 2     | `#e6ff57` |
| 3     | `#24f6d9` |
| 4     | `#c770ff` |
| 5     | `#30b3ff` |
| 6     | `#ffa83d` |
| 7     | `#1cc24b` |
| 8     | `#8ca391` |

## Installation

### package-vc-install (Emacs 29+)

```elisp
(unless (package-installed-p 'ematrix)
  (package-vc-install "https://github.com/liangzid/ematrix"))
```

### use-package

```elisp
(use-package ematrix
  :vc (:url "https://github.com/liangzid/ematrix"
        :rev :newest)
  :config
  (load-theme 'ematrix t)
  (ematrix-set-font))
```

### Manual

```bash
git clone https://github.com/liangzid/ematrix ~/.emacs.d/elpa/ematrix
```

```elisp
(require 'ematrix)
(load-theme 'ematrix t)
```

## Font

EMatrix matches the [OpenCode font stack](https://github.com/anomalyco/opencode/blob/dev/packages/console/app/src/style/token/font.css):

| Priority | Font            | License |
|----------|-----------------|---------|
| 1        | Berkeley Mono   | Commercial ($75) |
| 2        | IBM Plex Mono   | Open Source (SIL OFL) |
| 3        | Cascadia Code   | Open Source (SIL OFL) |
| 4        | Fira Code       | Open Source (SIL OFL) |
| 5        | JetBrains Mono  | Open Source (SIL OFL) |

The first font found on your system is used automatically. On most Linux systems, installing `fonts-ibm-plex` is the quickest way to get a close match:

```bash
# Debian/Ubuntu
sudo apt install fonts-ibm-plex

# Arch
sudo pacman -S ttf-ibm-plex

# macOS
brew install font-ibm-plex
```

Set the font manually with `M-x ematrix-set-font`, or call it from your init:

```elisp
(setq ematrix-default-font-size 14)
(ematrix-set-font)
```

Override with a custom font:

```elisp
(setq ematrix-default-font "Cascadia Code")
(setq ematrix-default-font-size 13)
(ematrix-set-font)
```

The CJK font defaults to **LXGW WenKai Mono**. Change it:

```elisp
(setq ematrix-chinese-font "Noto Serif CJK SC")
```

## Supported Packages

EMatrix provides faces for:

- **Syntax**: `font-lock`, `rainbow-delimiters`, `highlight-indentation`
- **Completion**: `company`, `vertico`, `ivy`, `marginalia`
- **Org Mode**: headings, blocks, code, links, tags, todos, agenda, checkboxes
- **Markdown**: headings, code, links, blockquotes, emphasis
- **Version Control**: `diff`, `magit`, `git-gutter`
- **UI**: `mode-line`, `doom-modeline`, `tab-bar`, `tab-line`
- **Tools**: `eglot`, `citre`, `evil`, `telega`, `hl-line`
- **Terminal**: `term`, `ansi-color`

## File Structure

```
ematrix/
├── ematrix.el          # Package entry point, font setup, customization
└── ematrix-theme.el    # deftheme with 130+ face definitions
```

## Credits

Color scheme sourced from [OpenCode](https://github.com/anomalyco/opencode) by AnomalyCo, used under the MIT license.

## License

MIT
