# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Monitering software for AMD Zen-based CPUs"
HOMEPAGE="https://github.com/ocerman/zenmonitor"
SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/gtk+:3
	sys-power/zenpower
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake
}

src_install() {
	PREFIX="${D}/usr" emake install
	setcap cap_sys_rawio,cap_dac_read_search+ep "${D}/usr/bin/zenmonitor"
}

