# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="rtl88x2bu driver for current kernels"
HOMEPAGE="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"
SRC_URI=""
EGIT_REPO_URI="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-kernel/dkms"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile () {
	true
}

src_install () {
	insinto usr/src/rtl88x2bu-${PV}
	doins -r "${S}"/*
}

pkg_postinst () {
	dkms add rtl88x2bu/${PV}
}

pkg_prerm () {
	dkms remove rtl88x2bu/${PV} --all
}

