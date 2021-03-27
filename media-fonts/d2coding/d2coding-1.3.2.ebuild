# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="D2 Coding fonts"
HOMEPAGE="https://github.com/naver/d2codingfont"
SRC_URI="https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip"

LICENSE="OFL"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

FONT_SUFFIX="ttc"

src_unpack () {
	mkdir "${S}" && cd "${S}"
	unpack ${A}
	mv D2CodingAll/* .
}

