(defstruct garota-magica nome escuridao bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :bruxas (garota-magica-bruxas g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))))

(defun main ()
  (let* ((grupo (list (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 2)
                      (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 5)
                      (make-garota-magica :nome "Homura" :escuridao 40 :bruxas 12)))
         (nova (make-garota-magica :nome "Kyoko" :escuridao 25 :bruxas 8))
         (grupo-novo (cons nova grupo))
         (sayaka (second grupo))
         (purificada (purifica sayaka 50)))
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))
    (format t "Escuridao do grupo original: ~a~%" (escuridao-total grupo))
    (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))
    (format t "Sayaka original: ~a~%" (garota-magica-escuridao sayaka))
    (format t "Sayaka purificada: ~a~%" (garota-magica-escuridao purificada))))

(main)
