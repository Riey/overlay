# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod git-r3

DESCRIPTION="Realtek RTL88x2BU WiFi USE Driver for Linux"
HOMEPAGE="https://github.com/RinCat/RTL88x2BU-Linux-Driver"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_COMMIT="f4dadcaf88df08d5a563f79cadabe9d901ad1a23"
LICENSE="GPL-2"
SLOT="0"
IUSE="kernel_linux"
KEYWORDS="~amd64 ~x86"

pkg_setup() {
	if use kernel_linux; then
		BUILD_TARGETS="clean modules"
		MODULE_NAMES="88x2bu(net:)"
		BUILD_PARAMS="KVER=${KV_FULL} KSRC=${KERNEL_DIR}"
		linux-mod_pkg_setup
	else
		die "Can't build package other than linux kernel"
	fi
}

