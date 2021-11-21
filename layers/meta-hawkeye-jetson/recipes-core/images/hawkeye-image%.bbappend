IMAGE_INSTALL_append = " \
    nvidia-docker \
    cuda-libraries \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'packagegroup-wifi-iwlwifi', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'packagegroup-wifi-ath10k', '', d)} \
    "
