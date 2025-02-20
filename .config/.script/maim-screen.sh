# Destination directory
output_dir="$HOME/Images"
filename="$output_dir/Tuesday_$(date '+%Y-%m-%d_%H-%M-%S').bmp"
maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2 -f bmp "$filename" 
