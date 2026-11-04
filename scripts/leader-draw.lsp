;; leader-draw.lsp - Draw a leader with two picked points
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
