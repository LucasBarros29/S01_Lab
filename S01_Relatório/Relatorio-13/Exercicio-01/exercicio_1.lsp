(defstruct erva nome preco-por-grama toxicidade)

(defun classifica-erva (erva)
  (let ((tox (erva-toxicidade erva)))
    (cond ((>= tox 7) "veneno")
          ((>= tox 4) "use com cuidado")
          (t "segura"))))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$ ~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar esta erva em si mesma antes."
      "Erva liberada para o paciente."))

(defun main ()
  (let ((ervas (list (make-erva :nome "Ginseng" :preco-por-grama 3.5 :toxicidade 1)
                     (make-erva :nome "Aconito" :preco-por-grama 8.0 :toxicidade 5)
                     (make-erva :nome "Cicuta" :preco-por-grama 12.25 :toxicidade 9))))
    (dolist (e ervas)
      (format t "~a~%~a~%~%" (descreve-erva e) (aviso e)))
    (format t "Dose de 15 g de ~a: R$ ~,2f~%"
            (erva-nome (first ervas))
            (preco-da-dose (first ervas) 15))))

(main)
