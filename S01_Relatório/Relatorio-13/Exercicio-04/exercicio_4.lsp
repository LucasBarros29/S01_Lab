(defstruct dominio nome elemento dificuldade mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                     (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~a - recompensa: ~a mora"
                            (dominio-nome d) (recompensa-final d)))
                  possiveis)))
    textos))

(defun main ()
  (let ((dominios (list (make-dominio :nome "Cinzas do Esquecimento" :elemento :pyro
                                      :dificuldade 2 :mora 10000)
                        (make-dominio :nome "Palacio de Cristal" :elemento :cryo
                                      :dificuldade 4 :mora 15000)
                        (make-dominio :nome "Trovao Antigo" :elemento :electro
                                      :dificuldade 3 :mora 12000)
                        (make-dominio :nome "Lago Sereno" :elemento :hydro
                                      :dificuldade 1 :mora 8000)
                        (make-dominio :nome "Vale dos Ventos" :elemento :anemo
                                      :dificuldade 5 :mora 20000))))
    (format t "Rota (dificuldade ate 3):~%")
    (dolist (texto (rota dominios 3))
      (format t "  ~a~%" texto))
    (format t "Total de mora: ~a~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))
    (let ((copia (copy-dominio (first dominios))))
      (setf (dominio-mora copia) 99999)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (first dominios))))))

(main)
