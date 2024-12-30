## Pelotas

Este es un juego que utiliza métodos nativos para mantener persistido el highscore a través de una librería externa de node (flat-file-db)[https://github.com/mafintosh/flat-file-db].

El juego es muy simple, lionel se mueve horizontalmente para atrapar todas las pelotas, si una pelota llega al piso el juego termina y se persiste el highscore

los datos se guardan en `data/my.db`

# Instalación.

Luego de clonado el repositorio, es necesario bajar las librerías, lo cual se puede realizar a través de wollok-ts-cli
`wollok dependencies sync`

Para agregar una librería se utilizó:
`wollok dependencies add flat-file-db` 

Para removerla se podría hacer con:
`wollok dependencies remove flat-file-db` 

Esos comandos son en realidad wrappers de npm, por lo que es necesario que npm esté instalado.
- sync es un wrapper de install
- add es un wrapper de install <lib>
- remove es un wrapper de uninstall <lib>

Se puede agregar versiones de la misma manera que npm.




