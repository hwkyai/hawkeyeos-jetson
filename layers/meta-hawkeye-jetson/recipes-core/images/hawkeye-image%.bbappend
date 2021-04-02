IMAGE_INSTALL_append = " \
    tegra-libraries \
    libglvnd \
    tegra-libraries-argus \
    tegra-libraries-argus-daemon-base \
    tegra-libraries-container-csv \
    tegra-libraries-libnvosd \
    tegra-libraries-libv4l-plugins \
    libnvidia-container-tools \
    nvidia-container-toolkit \
    nvidia-container-runtime \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'packagegroup-wifi-iwlwifi', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'packagegroup-wifi-ath10k', '', d)} \
    "
