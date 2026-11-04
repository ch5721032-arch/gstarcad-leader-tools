# GstarCAD Leader Tools

Draw a leader with two picked points, align a selection of multileaders, and collect multileaders into one.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Leaders and multileaders are quick to draw but slow to tidy. These commands draw a leader with two picked points, align a selection of multileaders, and collect them into one, which speeds up annotation cleanup on busy drawings.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/leader-draw.lsp` | ;; leader-draw.lsp - Draw a leader with two picked points
;; Command: LDR
(defun c:LDR ( / p1 p2 )
  (setq p1 (getpoint "\nLeader start point: "))
  (if p1
    (progn
      (setq p2 (getpoint p1 "\nLeader next point: "))
      (if p2
        (command "_.LEADER" p1 p2 "" "" "")
      )
    )
  )
  (princ)
)
 |
| `scripts/leader-align.lsp` | ;; leader-align.lsp - Align selected multileaders
;; Command: MLALIGN
(defun c:MLALIGN ( / ss )
  (setq ss (ssget '((0 . "MULTILEADER"))))
  (if ss
    (progn
      (command "_.MLEADERALIGN" ss "")
      (princ "\nPick an alignment direction in the prompt.")
    )
    (princ "\nNo multileaders selected.")
  )
  (princ)
)
 |
| `scripts/leader-collect.lsp` | ;; leader-collect.lsp - Collect selected multileaders into one
;; Command: MLCOLLECT
(defun c:MLCOLLECT ( / ss )
  (setq ss (ssget '((0 . "MULTILEADER"))))
  (if ss
    (progn
      (command "_.MLEADERCOLLECT" ss "")
      (princ "\nLeaders collected.")
    )
    (princ "\nNo multileaders selected.")
  )
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
