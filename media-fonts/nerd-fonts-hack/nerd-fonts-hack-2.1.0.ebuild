# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A typeface designed for source code. Patched with Nerd Fonts iconics."
HOMEPAGE="https://www.nerdfonts.com"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hack.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""
RESTRICT="binchecks strip"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

FONT_SUFFIX="ttf"

src_unpack () {
	mkdir "${S}" && cd "${S}"
	unpack ${A}
}

