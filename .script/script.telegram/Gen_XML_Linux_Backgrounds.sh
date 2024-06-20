
# ./Gen_XML_Linux_Backgrounds.sh PathAImagenes TiempoEntreImagen TiempoTransiciónImagem > SalidaFichero.xml   (Los tiempos son en segundos)

# Si no especificas usará:
#   La ruta actual donde te encuentres (no donde está el script, sino desde donde lo llamas, en la rutas que estás a la hora de ejecutarlo)
#   1800 segundos entre cambio de imágen y 5 segundos de transición

# Genera fichero con orden aleatorio, pero para que a cada inicio el orden varie, añádelo en crontab para que genere un orden diferente a cada inicio o cierto tiempo.
#  ej: bash ~/Nextcloud/MiConf/scripts/Bash/Gen_XML_Linux_Backgrounds.sh ${HOME}/Nextcloud/MiConf/Fondos/ 1800.0 4.0 > ${HOME}/Nextcloud/MiConf/Fondos/AllMyBackGrounds.xml

# Luego para usar el fichero generado:
# Botón derecho en escritorio, cambiar imagen, marca ver todos los ficheros y busca tu fichero generado o
#  sudo cp AllMyBackGrounds.xml /usr/share/backgrounds/  # Para copiar en ruta que muestra por defecto como fondos en Mint. Pero no hace falta, puedes usar el xml donde sea mientras pueda leerlo.


echo "
<background>
  <starttime>
    <year>2009</year>
    <month>08</month>
    <day>04</day>
    <hour>00</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
<!-- This animation will start at midnight. -->

"

PathImagenes=$1
TiempoImagen=$2
TiempoAnimacion=$3

[[ $PathImagenes == "" ]] && PathImagenes=$(pwd)    # "${HOME}/Nextcloud/MiConf/Fondos/" en PC1 y "~/Nextcloud/Wallpapers/" en PC2
[[ $TiempoImagen == "" ]] && TiempoImagen="1800.0"
[[ $TiempoAnimacion == "" ]] && TiempoAnimacion="5.0"

PrimeraImagen=$(find $PathImagenes -type f | head -1)

echo "
  <static>
    <duration>$(echo "scale=1; ${TiempoImagen}/4" | bc -l)</duration>
    <file>${PrimeraImagen}</file>
  </static>
  <transition>
    <duration>${TiempoAnimacion}</duration>
    <from>${PrimeraImagen}</from>"


#find "$PathImagenes" -type f -size +20k -size -20M \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "\*.png" -or -iname "*.tif" -or -iname "*.bmp" -or -iname "*.gif" -or -iname "*.xpm" -or -iname "*.nef" -or -iname "*.cr2" -or -iname "*.arw" \) | sort --sort=random | awk -v awktimevar="$TiempoImagen" -v awkanimationvar="$TiempoAnimacion" '{print  "    <to>"$0"</to>\n  </transition>\n\n  <static>\n   <duration>"awktimevar"</duration>\n   <file>"$0"</file>\n  </static>\n  <transition>\n    <duration>"awkanimationvar"</duration>\n    <from>"$0"</from>"}'   # -printf '"%p"\n'                          # ej: 0,040 secs
#find "$PathImagenes" -type f -size +20k -size -20M -exec file {} \; |  awk -F ": " '{ if ($2 ~/[Ii]mage|EPS/) print $1}' | sort --sort=random | awk -v awktimevar="$TiempoImagen" -v awkanimationvar="$TiempoAnimacion" '{print  "    <to>"$0"</to>\n  </transition>\n\n  <static>\n   <duration>"awktimevar"</duration>\n   <file>"$0"</file>\n  </static>\n  <transition>\n    <duration>"awkanimationvar"</duration>\n    <from>"$0"</from>"}'             # -printf '"%p"\n'   # Lento (3-4x) más lento que el de abajo y aunque el de arriba es más rápido, para localizar las imágenes son mejores los dos del final  # ej: 1,741 secs
find "$PathImagenes" -type f -size +20k -size -20M -print0 | xargs -0 file --mime-type | grep -F 'image/' | awk -F ": " '{print $1}' | sort --sort=random | awk -v awktimevar="$TiempoImagen" -v awkanimationvar="$TiempoAnimacion" '{print  "    <to>"$0"</to>\n  </transition>\n\n  <static>\n   <duration>"awktimevar"</duration>\n   <file>"$0"</file>\n  </static>\n  <transition>\n    <duration>"awkanimationvar"</duration>\n    <from>"$0"</from>"}'  # -printf '"%p"\n'   # Rápido pero más lento que el mas rápido de arriba del todo, aunque es mejor para generar el fichero y es más rápido que el segundo     # ej: 0,384 secs




echo "    <to>${PrimeraImagen}</to>
  </transition>"

echo -e "\n</background>"

