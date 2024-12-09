#!/bin/bash

function connect(){


		case "$shaHdmi" in
				"ba86bc9e7462cb06ec4646c2b3752a64d349d7d4") # Office PC
						/usr/bin/xrandr --output ${principal} --primary --auto --output ${secundario} --auto --above ${principal}
				    ;;
				"abccd4f93f27bc1849fc141e78c3905be8e890ed") # En casa con la Dock ¡¡SIN USO!!
						/usr/bin/xrandr --output ${principal} --primary --auto --output DP3 --auto --left-of ${principal}
				    ;;
				"c4a2e9b82a2d728fb785dcde3782e1bfbae5910e") #en casa Dell
						/usr/bin/xrandr --output ${principal} --primary --auto --output ${secundario} --auto --right-of ${principal}
						;;
        *) # Por defecto arriba
           /usr/bin/xrandr --output ${principal} --auto --output HDMI-1 --auto --above ${principal}
           ;;
    esac
}

function connect3(){
		# de momento sin uso hasta que solucione los problemas de la dock!!!
		case "$shaHdmi" in
				"ba86bc9e7462cb06ec4646c2b3752a64d349d7d4") # Office PC
						/usr/bin/xrandr --output ${principal} --auto --primary --output DP3--auto --rotate left --scale 1.5x1.5 --output HDMI-1 --mode 1920x1080 --pos 1800x972 --rotate normal --scale 1.5x1.5
				    ;;
				"abccd4f93f27bc1849fc141e78c3905be8e890ed") # En casa
						/usr/bin/xrandr --output ${principal} --primary --auto --output DP-3 --auto --left-of ${principal}
				    ;;
				"c4a2e9b82a2d728fb785dcde3782e1bfbae5910e") #en casa Dell
						/usr/bin/xrandr --output ${principal} --primary --auto --output HDMI-1 --auto --right-of ${principal} --scale 1.5x1.5
						;;
        *) # Por defecto arriba
           /usr/bin/xrandr --output ${principal} --auto --output HDMI-1 --auto --above ${principal}
           ;;
    esac
}

function disconnect(){
		# Desconecto todo menos la principal
		/usr/bin/xrandr --output ${principal} --primary --auto  --output ${secundaria} --off
}

# Seleccion del nombre de las salidas. Cuando arranco con Intel las cambia.
principal=$(xrandr  | grep -i "connected" |  awk '{print $1}' | grep eDP)
secundario=$(xrandr | grep -i "connected" |  awk '{print $1}' | grep HDMI)

# Identificación del monitor
cardPath=/sys/$(/usr/bin/udevadm info -q path -n /dev/dri/card0)
shaHdmi=$(/usr/bin/sha1sum $cardPath/card0-HDMI-A-1/edid | /usr/bin/cut -f1 -d " ")

# Identificar si la entrada HDMI esta activa
status_HDMI=$(cat /sys/class/drm/card0/*HDMI*/status)

# Desactivo por completo la pantalla principal y dejo solo la externa, si HDMI conectado
if [ "${status_HDMI}" = "connected" ]; then
  randr --output ${secundario} --auto --primary --output ${principal} --off
	sleep 1
fi

# Selecciono la conexion en caso de tener 1 o 2 monitores externos.
case "$(/usr/bin/xrandr | /usr/bin/grep " connected " | /usr/bin/awk '{ print$1 }' | /usr/bin/wc -l)" in
		"3")
				connect3
				# Si arranco con Stumpwm...
				if [ "$(/usr/bin/pidof stumpwm)" != ""  ] ; then
						/home/cnoceda/.screenlayout/stumpwm_3.sh
						echo '(refresh-heads)' | /usr/local/bin/stumpish -e eval
						/usr/local/bin/stumpish refresh-mode-line
						echo '(refresh-heads)' | /usr/local/bin/stumpish -e eval
				fi
				;;
		"2")
				connect
				# Si arranco con Stumpwm...
				if [ "$(/usr/bin/pidof stumpwm)" != ""  ] ; then
						echo '(refresh-heads)' | /usr/local/bin/stumpish -e eval
						/usr/local/bin/stumpish refresh-mode-line
						echo '(refresh-heads)' | /usr/local/bin/stumpish -e eval
				fi
				;;
		"1")
				disconnect
				# Si arranco con Stumpwm...
				if [ "$(/usr/bin/pidof stumpwm)" != ""  ] ; then
						echo '(refresh-heads)' | /usr/local/bin/stumpish -e eval
				fi
				;;
		*)
				exit
				;;
esac

# Establecemos el wallpaper.
# /home/cnoceda/Qsync/config/bin/set_wallpaper.sh
