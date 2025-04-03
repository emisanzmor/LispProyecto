(ql:quickload "str")

;; Diccionario de términos de Basketball

(defparameter *articulos-masc* '("el"))
(defparameter *articulos-fem* '("la"))
(defparameter *preposiciones* '("con" "de" "para" "sin" "en" "a" "por" "al"))
(defparameter *articulos* (append *articulos-masc* *articulos-fem*))
(defparameter *adjetivos-masc* 
  '("rápido" "habilidoso" "intenso" "fuerte" "alto" "ágil" "explosivo" "estratégico"
    "potente" "preciso" "letal" "versátil" "resistente" "inteligente" "feroz" "dominante"
    "decisivo" "técnico" "disciplinado" "efectivo" "agresivo" "enérgico" "dinámico" 
    "colectivo" "coordinado" "constante" "combativo" "competitivo" "atlético"))

(defparameter *adjetivos-fem* 
  '("rápida" "habilidosa" "intensa" "fuerte" "alta" "ágil" "explosiva" "estratégica"
    "potente" "precisa" "letal" "versátil" "resistente" "inteligente" "feroz" "dominante"
    "decisiva" "técnica" "disciplinada" "efectiva" "agresiva" "enérgica" "dinámica" 
    "colectiva" "coordinada" "constante" "combativa" "competitiva" "atlética"))

(defparameter *adjetivos* (append *adjetivos-masc* *adjetivos-fem*))
(defparameter *adverbios* 
  '("rápidamente" "fuertemente" "estratégicamente" "técnicamente" "precisamente"
    "inteligentemente" "efectivamente" "ágilmente" "enérgicamente" "poderosamente"
    "tácticamente" "colectivamente" "disciplinadamente" "armoniosamente" "bien" "mal"))

(defparameter *verbos* 
  '("jugar" "juega" 
    "entrenar" "entrena"
    "atacar" "ataca"
    "defender" "defiende"
    "pasear" "pasea"
    "driblar" "dribla"
    "anotar" "anota"
    "pasar" "pasa"
    "tirar" "tira"
    "bloquear" "bloquea"
    "rebotear" "rebotea"
    "organizar" "organiza"
    "dirigir" "dirige"
    "robar" "roba"
    "conducir" "conduce"
    "asistir" "asiste"
    "correr" "corre"
    "saltar" "salta"
    "marcar" "marca"
    "presionar" "presiona"
    "recuperar" "recupera"
    "controlar" "controla"
    "finalizar" "finaliza"
    "superar" "supera"
    "motivar" "motiva"
    "ejecutar" "ejecuta"
    "competir" "compite"
    "estrategizar" "estrategiza"))

(defparameter *sustantivos-masc* 
  '("aro" "tablero" "balón" "uniforme" "jugador" "partido" "equipo"
    "entrenador" "árbitro" "torneo" "bote" "dribbling" "rebote" "pivot"
    "base" "escolta" "alero" "zona" "marcador" "rival" "campo" "vestidor"
    "capitán" "bloqueo" "contraataque" "ataque" "estadística" "cambio" "pase"
    "movimiento" "robo" "tapón" "tiempo" "tiro" "banca" "segundo" "espectador"
    "entrenamiento" "calentamiento" "ritmo" "impacto" "esfuerzo" "control" "ritmo"))

(defparameter *sustantivos-fem* 
  '("cancha" "red" "jugadora" "asistencia" "defensa" "liga" "competencia"
    "presión" "recuperación" "posición" "técnica" "concentración" "velocidad"
    "destreza" "preparación" "confianza" "resistencia" "agilidad" "habilidad"
    "táctica" "estrategia" "visión" "práctica" "precisión" "intensidad" "fuerza"
    "disciplina" "comunicación" "motivación" "decisión" "reacción" "organización"
    "coordinación" "oportunidad" "superación" "conexión" "eficiencia" "visión"))

(defparameter *sustantivos* (append *sustantivos-masc* *sustantivos-fem*))

(setf *articulos-masc* (sort (copy-list *articulos-masc*) #'string<))
(setf *articulos-fem* (sort (copy-list *articulos-fem*) #'string<))
(setf *preposiciones* (sort (copy-list *preposiciones*) #'string<))
(setf *articulos* (sort (append *articulos-masc* *articulos-fem*) #'string<))
(setf *adjetivos-masc* (sort (copy-list *adjetivos-masc*) #'string<))
(setf *adjetivos-fem* (sort (copy-list *adjetivos-fem*) #'string<))
(setf *adjetivos* (sort (append *adjetivos-masc* *adjetivos-fem*) #'string<))
(setf *adverbios* (sort (copy-list *adverbios*) #'string<))
(setf *verbos* (sort (copy-list *verbos*) #'string<))
(setf *sustantivos-masc* (sort (copy-list *sustantivos-masc*) #'string<))
(setf *sustantivos-fem* (sort (copy-list *sustantivos-fem*) #'string<))
(setf *sustantivos* (append (copy-list *sustantivos-masc*) (copy-list *sustantivos-fem*)))

(defun binary-search (item sequence)
  "Realiza una búsqueda binaria de un string en una lista ordenada de strings."
  (let ((low 0)
        (high (1- (length sequence))))
    (loop while (<= low high) do
      (let* ((mid (floor (+ low high) 2))
             (mid-element (elt sequence mid)))
        (cond
          ((string= item mid-element) 
           (return-from binary-search t))  ; Elemento encontrado
          ((string< item mid-element) 
           (setf high (1- mid)))          ; Buscar en la mitad inferior
          (t 
           (setf low (1+ mid))))))        ; Buscar en la mitad superior
    nil))                                 ; Elemento no encontrado

(defun clasificar-sustantivo (sustantivo)
  (cond
    ((binary-search sustantivo *sustantivos-masc* ) 'masculino)
    ((binary-search sustantivo *sustantivos-fem* ) 'femenino)
    (t 'desconocido)))

(defun validar-sn (tokens)

  "Valida si los tokens forman un Sintagma Nominal (SN) válido."
  (cond
    ;; Caso: Artículo + Adjetivo + Sustantivo (Ejemplo: la fuerte jugadora)
    ((and (>= (length tokens) 3)
          (binary-search (first tokens) *articulos*)
          (binary-search (second tokens) *adjetivos*)
          (binary-search (third tokens) *sustantivos*))
     (let ((articulo (first tokens))
           (adjetivo (second tokens))
           (sustantivo (third tokens)))
       (cond
         ((and (binary-search articulo *articulos-masc*)
               (binary-search sustantivo *sustantivos-masc*)
               (binary-search adjetivo *adjetivos-masc*))
          (progn
            (print "SN válido: Artículo masc + Adjetivo masc + Sustantivo masc")
            (subseq tokens 3)))
         ((and (binary-search articulo *articulos-fem*)
               (binary-search sustantivo *sustantivos-fem*)
               (binary-search adjetivo *adjetivos-fem*))
          (progn
            (print "SN válido: Artículo fem + Adjetivo fem + Sustantivo fem")
            (subseq tokens 3)))
         (t
          (format nil "Error: Concordancia de género inválida en SN: ~a ~a ~a" 
                  articulo adjetivo sustantivo)))))

;; Caso: Artículo + Sustantivo con validación de género (Ejemplo: "el jugador")
((and (>= (length tokens) 2)
      (binary-search (first tokens) *articulos*)
      (or (binary-search (second tokens) *sustantivos-masc*)
          (binary-search (second tokens) *sustantivos-fem*)))  
 (let ((articulo (first tokens))
       (sustantivo (second tokens)))
   (cond
     ((and (binary-search articulo *articulos-masc*)
           (binary-search sustantivo *sustantivos-masc*))
      (progn
        (print "SN válido: Artículo masc + Sustantivo masc")
        (subseq tokens 2)))
     ((and (binary-search articulo *articulos-fem*)
           (binary-search sustantivo *sustantivos-fem*))
      (progn
        (print "SN válido: Artículo fem + Sustantivo fem")
        (subseq tokens 2)))
     (t
      (format nil "Error: Artículo ~a (~a) no concuerda con sustantivo ~a (~a)"
              articulo 
              (if (binary-search articulo *articulos-masc*) "masc" "fem")
              sustantivo
              (if (binary-search sustantivo *sustantivos-masc*) "masc" "fem"))))))



    ;; Si no coincide con nada, es inválido.
    
    (t
     (format nil "Error: SN inválido. No se reconoció el patrón en los tokens: ~a. Estas son las oraciones que puedo hacer: 
 ORACIÓN → SN + SV
 SN → artículo + nombre
 SN → artículo + adjetivo + nombre
 SN → preposición + SN
 SV → verbo + SN
 SV → verbo + adverbio + SN
 SV → verbo + adverbio
 SV → verbo." tokens))))



(defun validar-sv (tokens)

  "Valida si los tokens forman un Sintagma Verbal (SV) válido."
  (cond
    ;; CASO: Verbo + Adverbio + SN (Ej: "juega bien el partido")
     ((and (>= (length tokens) 3)
          (binary-search (first tokens) *verbos* )  
          (binary-search (second tokens) *adverbios* )) 
     (let ((sn-rest (validar-sn (subseq tokens 2)))) 
  (if (listp sn-rest)
      (progn
             (print "SV válido: Verbo + Adverbio + SN")
             "SV válido: Verbo + Adverbio + SN")
           (format nil "Error: SN inválido después del adverbio: ~a ~a." (second tokens) (subseq tokens 2)))))


    ;; CASO: "Verbo + Adverbio" (Ej: "Jugar fuertemente")
    ((and (= (length tokens) 2)
          (binary-search (first tokens) *verbos* )
          (binary-search (second tokens) *adverbios* ))
     (progn
       (print "SV válido: Verbo + Adverbio")
       "SV válido: Verbo + Adverbio"))

    ;; CASO: Verbo + SN (Ej: "Juega el partido")
    ((and (>= (length tokens) 2)
          (binary-search (first tokens) *verbos* ))
     (let ((sn-rest (validar-sn (rest tokens))))
       (if (listp sn-rest) (progn
             (print "SV válido: Verbo + SN")
             "SV válido: Verbo + SN")
           (format nil "Error: SN inválido después del verbo: ~a ~a." (first tokens) (rest tokens)))))


    ;; CASO: Solo Verbo (Ej: "Juega")
    ((and (= (length tokens) 1)
          (binary-search (first tokens) *verbos* ))
     (progn
       (print "SV válido: Verbo")
       "SV válido: Verbo"))

    ;; Si no coincide con nada, es inválido.
(t
     (format nil "Error: SV inválido. No se reconoció el patrón en los tokens: ~a. Estas son las oraciones que puedo hacer: 
 ORACIÓN → SN + SV
 SN → artículo + nombre
 SN → artículo + adjetivo + nombre
 SN → preposición + SN
 SV → verbo + SN
 SV → verbo + adverbio + SN
 SV → verbo + adverbio
 SV → verbo." tokens))))


(defun validar-oracion (tokens)
  "Valida una oración completa según la gramática definida."

  (let ((sn-rest (validar-sn tokens)))
    (cond
      ;; Si el SN es válido y quedan tokens, validar SV
      ((and (listp sn-rest) (not (stringp sn-rest)))
       (if (null sn-rest)
           "Oración válida."
           (validar-sv sn-rest)))

      ;; Si el SN falla, probar directamente con SV
      (t
       (validar-sv tokens)))))



(defun tokenizar (cadena)
  "Divide la cadena en tokens (palabras)."
  (mapcar #'string-downcase (str:split " " cadena)))

(defun main ()
  "Función principal que solicita una oración y la valida."
  (format t "Ingrese una oración de baloncesto: ")
  (force-output)
  (let* ((input (read-line))
         (tokens (tokenizar input)))
    (format t "~%Tokens: ~a~%" tokens)
    (format t "~%Resultado: ~a~%" (validar-oracion tokens))))

(main)
