# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="Linux kernel driver for AMD Zen family CPUs."
HOMEPAGE="https://github.com/ocerman/zenpower"
SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup() {
	if use kernel_linux; then
		BUILD_TARGETS="clean modules"
		MODULE_NAMES="zenpower(hwmon:)"
		BUILD_PARAMS="KVER=${KV_FULL} KSRC=${KERNEL_DIR}"
		linux-mod_pkg_setup
	else
		die "Can't build package other than linux kernel"
	fi
}

