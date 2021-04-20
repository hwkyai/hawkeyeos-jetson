inherit deploy

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://disable-fw-user-helper.cfg \
"

SRC_URI_append_photon = " \
    file://0001-cti-photon-merge-CDC-MBIM-driver-changes-from-bsp.patch \
    file://0001-linux-tegra-Port-PCI-endpoint-driver-changes.patch \
    file://cti-photon.cfg \
"

SRC_URI_append_photon-nano = " \
    file://0001-dts-t210-enable-SMMU-to-fix-QCA-pcie-wifi.patch \
"

SRCBRANCH = "tegra-l4t-r${L4T_VERSION}"
SRCREV = "6e383afbaac78e015fade9cb57d78ec7dbcb5244"

SRC_REPO = "github.com/hwkyai/linux-tegra-4.9;protocol=https"
