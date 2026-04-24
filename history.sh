   20  ls -la
   21  ls -la evaluation/
   22  ls -la evaluation/kepler/
   23  mv evaluation/kepler/docs evaluation/kepler/registros
   24  mkdir evaluation/kepler/plantillas
   25  git add .
   26  git commit -m "Fix problema 1: estructura de directorios corregida"
   27  mv evaluation/kepler/sensores.log evaluation/kepler/registros/
   28  mv evaluation/kepler/ajustes.old evaluation/kepler/ajustes.conf
   29  git add .
   30  git commit -m "Fix problema 2: archivos movidos y renombrados"
   31  ls -l evaluation/kepler/registros/sensores.log
   32  chmod 640 evaluation/kepler/registros/sensores.log
   33  chmod 600 evaluation/kepler/registros/sensores.log
   34  chmod 640 evaluation/kepler/registros/sensores.log
   35  git add .
   36  git commit -m "Fix problema 3: permisos numericos 640 en sensores.log"
   37  history