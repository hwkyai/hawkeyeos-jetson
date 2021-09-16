inherit deploy

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://disable-fw-user-helper.cfg \
"

SRC_URI_append_photon = " \
    file://0001-cti-photon-merge-CDC-MBIM-driver-changes-from-bsp.patch \
    file://cti-photon.cfg \
"

SRC_URI_append_photon-nano = " \
    file://0001-dts-t210-enable-SMMU-to-fix-QCA-pcie-wifi.patch \
"

SRC_URI_append_boxer-nano = " \
    file://0001-nvidia-t210-enable-sdmmc3.patch \
"

SRC_URI_append_boxer-nx = " \
    file://0002-nvidia-t194-enable-sdmmc3.patch \
"

SRCBRANCH = "tegra-l4t-r${L4T_VERSION}"
SRCREV = "76e8cd5c8175ec147258315b56bdf1830bc663de"

SRC_REPO = "github.com/hwkyai/linux-tegra-4.9;protocol=https"
