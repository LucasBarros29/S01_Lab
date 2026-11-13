(defstruct criatura nome bioma profundidade perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a | bioma: ~a | profundidade: ~a m | ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list (make-criatura :nome "Peeper" :bioma "Safe Shallows"
                       :profundidade 20 :perigo :inofensiva)
        (make-criatura :nome "Bonesharker" :bioma "Kelp Forest"
                       :profundidade 80 :perigo :agressiva)
        (make-criatura :nome "Ghost Leviathan" :bioma "Lost River"
                       :profundidade 400 :perigo :leviata)
        (make-criatura :nome "Reaper Leviathan" :bioma "Crash Zone"
                       :profundidade 150 :perigo :leviata)))

(defun main ()
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))
  (let ((fundas (abaixo-de 100 *catalogo*)))
    (format t "~%Abaixo de 100 m:~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Total: ~a~%" (length fundas))))

(main)
