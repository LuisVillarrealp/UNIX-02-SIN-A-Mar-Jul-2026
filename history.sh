    1  git fetch upstream
    2  git checkout -b eval_p2_1_g1 upstream/eval_p2_1_g1
    3  git checkout -b main upstream/eval_p2_1_g1
    4  git fetch upstream
    5  git checkout -b main upstream/eval_p2_1_g1
    6  git checkout beval p2 1 vl upstream/eval p21 vi
    7  branch 'eval_p2_1 v1' set up to track 'upstream/eval p2 1 v1.
exit
    8  git checkout beval p2 1 vl branch 'eval_p2_1 v1' set up to track 'upstream/eval p2 1 v1.

    9  git remote add upstream https://github.com/jonathanetitoo/UNIX-02-SIN-A-Mar-Jul-2026
   10  git remote -v
   11  git fetch upstream
   12  git checkout -b eval_p2_1_v1 upstream/eval_p2_1_v1
   13  git fetch upstream
   14  git branch -r
   15  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
   16  git push -u origin eval_p2_1_g2
   17  ls -la kepler/
   18  ls -la kepler/docs/ 2>/dev/null || echo "no hay docs/"
   19  ls -la kepler/registros/ 2>/dev/null || echo "no hay registros/"
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
   38  chmod u+x evaluation/kepler/runner.sh
   39  chmod o-w evaluation/kepler/ajustes.conf
   40  git add .
   41  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   42  history
   43  ls -l evaluation/kepler/runner.sh
   44  chmod u+s evaluation/kepler/runner.sh
   45  ls -l evaluation/kepler/runner.sh
   46  git add .
   47  git commit -m "Fix problema 5: SUID activado en runner.sh"
   48  history
   49  ls -ld /tmp/kepler_zone
   50  mkdir /tmp/kepler_zone
   51  chmod +t /tmp/kepler_zone
   52  ls -ld /tmp/kepler_zone
   53  chmod o+x /tmp/kepler_zone
   54  ls -ld /tmp/kepler_zone
   55  git add .
   56  git commit -m "Fix problema 6: sticky bit en /tmp/kepler_zone"
   57  history
   58  cat > /tmp/mi_llave.batch ""no use
   59  gpg --full-generate-key
   60  gpg --list-keys vega@kepler.lab
   61  gpg --output evaluation/kepler/registros/sensores.log.gpg --encrypt --recipient vega@kepler.lab evaluation/kepler/registros/sensores.log
   62  ls -l evaluation/kepler/registros/
   63  git add .
   64  git commit -m "Fix problema 7: llave GPG generada y sensores.log cifrado"
   65  gpg --clearsign evaluation/kepler/ajustes.conf
   66  ls -l evaluation/kepler/ajustes.conf.asc
   67  gpg --verify evaluation/kepler/runner.sh.sig evaluation/kepler/runner.sh
   68  gpg --detach-sign --output evaluation/kepler/runner.sh.sig evaluation/kepler/runner.sh
   69  gpg --verify evaluation/kepler/runner.sh.sig evaluation/kepler/runner.sh
   70  git add .
   71  git commit -m "Fix problema 8: firmas GPG corregidas y creadas"
   72  ls evaluation/
   73  histoy
   74  history
   75  ls evaluation/
   76  git log --oneline
   77  ls evaluation/kepler/
   78  history