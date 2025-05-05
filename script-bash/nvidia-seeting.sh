nvidia-settings -a "InitialPixmapPlacement=2" 
nvidia-settings -a "LogAniso=0"       # Filtrage anisotrope (0-4)
nvidia-settings -a "FSAA=0"           # Anti-aliasing (0-16)
################################
nvidia-settings -a OpenGLImageSettings=3 &
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1" &
nvidia-settings -a FSAAAppControlled=0 -a FSAA=4 &