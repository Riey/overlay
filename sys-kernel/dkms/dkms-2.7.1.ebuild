# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="Dynamic Kernel Module Support"
HOMEPAGE="https://github.com/dell/dkms"
SRC_URI="https://github.com/dell/dkms/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install () {
	sed -i "s:prepare-all:prepare:g" ./dkms || die
	dosbin dkms
	dosbin dkms_mkkerneldoth

	keepdir /var/lib/dkms
	insinto /var/lib/dkms
	doins dkms_dbversion

	keepdir /etc/dkms
	insinto /etc/dkms
	newins dkms_framework.conf framework.conf
	doins template-dkms-mkrpm.spec

	doman dkms.8
	dodoc AUTHORS sample.conf sample.spec
}

