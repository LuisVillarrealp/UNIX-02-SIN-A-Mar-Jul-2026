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
    38  chmod u+x evaluation/kepler/runner.sh
   39  chmod o-w evaluation/kepler/ajustes.conf
   40  git add .
   41  git commit -m "Fix problema 4: permisos simbolicos corregidos"

   43ls -l evaluation/kepler/runner.sh
   44  chmod u+s evaluation/kepler/runner.sh
   45  ls -l evaluation/kepler/runner.sh
   46  git add .
   47  git commit -m "Fix problema 5: SUID activado en runner.sh"

49  ls -ld /tmp/kepler_zone
   50  mkdir /tmp/kepler_zone
   51  chmod +t /tmp/kepler_zone
   52  ls -ld /tmp/kepler_zone
   53  chmod o+x /tmp/kepler_zone
   54  ls -ld /tmp/kepler_zone
   55  git add .
   56  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"

   