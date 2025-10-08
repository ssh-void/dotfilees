nvidia-settings -a "InitialPixmapPlacement=2"
nvidia-settings -a "LogAniso=0"       # Filtrage anisotrope (0-4)
################################
nvidia-settings -a FSAAAppControlled=0 &

### i xorg-server-devel
#OpenGL Settings | 0 High Quality | 1 Quality | 2 Performance | 3 High Performance
nvidia-settings -a OpenGLImageSettings=2 &
#PowerMizer |1 Prefer Maximum Performance | 0 Adaptive | 2  Auto
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1" &
#Antialiasing Settings
nvidia-settings -a FSAAAppControlled=0 & # Override Application Settings
nvidia-settings -a FSAA=5 & #  Valid values for 'FSAA' are: 0, 1, 5, 9, 10 and 11 ( 5 MSAA | 10 CSAA)
sudo nvidia-smi -pm 1 # Persistence Mode

