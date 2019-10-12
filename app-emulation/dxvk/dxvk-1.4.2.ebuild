# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson multilib-minimal

DESCRIPTION="Vulkan-based D3D11 and D3D10 implementation for Linux / Wine"
HOMEPAGE="https://github.com/doitsujin/dxvk"
SRC_URI="https://github.com/doitsujin/dxvk/archive/v${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="${PV}"
KEYWORDS="amd64 x86"
IUSE=""

BDEPEND=""
RDEPEND="
	|| (
		>=app-emulation/wine-vanilla-3.14:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-staging-3.14:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-d3d9-3.14:*[${MULTILIB_USEDEP},vulkan]
		>=app-emulation/wine-any-3.14:*[${MULTILIB_USEDEP},vulkan]
	)"
DEPEND="${RDEPEND}
	dev-util/glslang"

MULTILIB_COMPAT=( abi_x86_{32,64} )

multilib_src_configure () {
	local bits=""

	if ${ABI} = amd64; then
		bits=64
	else
		bits=32
	fi

	local emesonargs=(
		--buildtype=release
		--cross-file="${S}/build-wine${bits}.txt"
		--libdir="$(get_libdir)/${P}"
		--bindir="$(get_libdir)/${P}/bin"
	)
	meson_src_configure
}

multilib_src_install () {
	meson_src_install
}

multilib_src_install_all () {
	exeinto /usr/bin
	doexe "${S}/setup_dxvk.sh"
}

