;; leader-collect.lsp - Collect selected multileaders into one
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
