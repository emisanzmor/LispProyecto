# Analizador de Oraciones de Baloncesto

Un analizador gramatical en español para oraciones singulares relacionadas con baloncesto implementado en Common Lisp.

## Descripción

Este programa valida si una oración singular dada sigue una gramática específica relacionada con baloncesto, verificando tanto la estructura sintáctica como la concordancia de género.

### Características

- Valida frases nominales (SN) con concordancia de género adecuada.
- Valida frases verbales (SV) en múltiples estructuras.
- Maneja combinaciones de artículos, adjetivos, sustantivos, verbos y adverbios.
- Proporciona mensajes de error detallados para oraciones inválidas.

## Instalación

1. Asegúrate de tener una implementación de Common Lisp instalada (se recomienda SBCL).
2. Instala la biblioteca `str` (disponible a través de Quicklisp).

    ```lisp
    (ql:quickload "str")
    ```

## Uso

1. Carga el archivo en tu entorno Lisp.
2. Ejecuta `(main)` para iniciar el analizador.
3. Ingresa una oración relacionada con baloncesto cuando se te solicite. (No necesitas ingresarla con comillas, únicamente la oración)
4. El programa analizará y validará tu oración.

## Estructuras de Oraciones Válidas

El analizador reconoce varias estructuras gramaticales:

### Frases Nominales (SN)

- Artículo + Sustantivo (`"el jugador"`)
- Artículo + Adjetivo + Sustantivo (`"el fuerte jugador"`)

### Frases Verbales (SV)

- Verbo solo (`"juega"`)
- Verbo + Adverbio (`"corre rápidamente"`)
- Verbo + SN (`"pasa el balón"`)
- Verbo + Adverbio + SN (`"defiende fuertemente la cancha"`)

### Oraciones Completas

- SN + SV (`"el jugador anota"`)

## Ejemplos

Oraciones válidas incluyen:

- `"el equipo juega bien"`
- `"la jugadora dribla rápidamente"`
- `"el entrenador motiva la cancha"`

## Manejo de Errores

El analizador proporciona mensajes de error específicos cuando:

- Falla la concordancia de género (`"el jugadora"`).
- Ocurren combinaciones de palabras inválidas.
- La estructura de la oración no coincide con las reglas gramaticales.

## Licencia

Este proyecto está bajo la Licencia MIT.
