;; leader-align.lsp - Align selected multileaders
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
