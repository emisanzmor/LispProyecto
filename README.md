# LispProyecto

Analizador de Oraciones de Baloncesto
Un analizador gramatical en español para oraciones relacionadas con baloncesto implementado en Common Lisp.

Descripción

Este programa valida si una oración dada sigue una gramática específica relacionada con baloncesto, verificando tanto la estructura sintáctica como la concordancia de género.

Características

Valida frases nominales (SN) con concordancia de género adecuada
Valida frases verbales (SV) en múltiples estructuras
Maneja combinaciones de artículos, adjetivos, sustantivos, verbos y adverbios
Proporciona mensajes de error detallados para oraciones inválidas
Instalación

Asegúrate de tener una implementación de Common Lisp instalada (se recomienda SBCL)
Instala la biblioteca str (disponible a través de Quicklisp)
Uso

Carga el archivo en tu entorno Lisp
Ejecuta (main)
Ingresa una oración relacionada con baloncesto cuando se te solicite
El programa analizará y validará tu oración
Estructuras de Oraciones Válidas

El analizador reconoce varias estructuras gramaticales:

Frases Nominales (SN)

Artículo + Sustantivo ("el jugador")
Artículo + Adjetivo + Sustantivo ("la rápida jugadora")
Preposición + SN ("con el balón")
Frases Verbales (SV)

Verbo solo ("juega")
Verbo + Adverbio ("corre rápidamente")
Verbo + SN ("anota el punto")
Verbo + Adverbio + SN ("defiende intensamente la cancha")
Oraciones Completas

SN + SV ("el jugador anota")
Ejemplos

Oraciones válidas incluyen:

"el equipo juega bien"
"la jugadora dribla rápidamente"
"el entrenador motiva al equipo"
Manejo de Errores

El analizador proporciona mensajes de error específicos cuando:

Falla la concordancia de género ("el jugadora")
Ocurren combinaciones de palabras inválidas
La estructura de la oración no coincide con las reglas gramaticales
Licencia

Licencia MIT
