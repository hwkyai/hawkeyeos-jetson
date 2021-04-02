# The 4.9 linux-tegra kernel does not support recent intel wifi
# adapters like the 9000 series and AX2xx, so we use the backport
# from meta-intel.
RDEPENDS_${PN}-iwlwifi += " backport-iwlwifi"
