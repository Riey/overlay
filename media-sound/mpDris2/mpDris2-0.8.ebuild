# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MPRIS V2.1 support for mpd"
HOMEPAGE="https://github.com/eonpatapon/mpDris2"
SRC_URI="https://github.com/eonpatapon/mpDris2/archive/${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	dev-python/python-mpd
	dev-python/dbus-python"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./autogen.sh --sysconfdir=/etc
}

src_install() {
	dobin ${S}/src/mpDris2
	dodoc ${S}/src/mpDris2.conf
}

