# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-multilib

DESCRIPTION="AMD Open Source Driver For Vulkan"
HOMEPAGE="https://github.com/GPUOpen-Drivers/AMDVLK"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/drivers/xgl"

MULTILIB_COMPAT=( abi_x86_{32,64} )

src_unpack () {
	git-r3_fetch	https://github.com/GPUOpen-Drivers/xgl.git			2cb5558b94c5dc839e093cb439057a1802426c8e
	git-r3_checkout https://github.com/GPUOpen-Drivers/xgl.git			drivers/xgl
	git-r3_fetch	https://github.com/GPUOpen-Drivers/pal.git			88d997710b4e405f3a8e3fd60a38afee9e3e77e2
	git-r3_checkout https://github.com/GPUOpen-Drivers/pal.git			drivers/pal
	git-r3_fetch	https://github.com/GPUOpen-Drivers/llpc.git 		ec210a78b6a280b00fb1765dd588c3970b6dc818
	git-r3_checkout https://github.com/GPUOpen-Drivers/llpc.git 		drivers/llpc
	git-r3_fetch	https://github.com/GPUOpen-Drivers/spvgen.git 		2f31d1170e8a12a66168b23235638c4bbc43ecdc
	git-r3_checkout https://github.com/GPUOpen-Drivers/spvgen.git 		drivers/spvgen
	git-r3_fetch	https://github.com/GPUOpen-Drivers/AMDVLK.git 		refs/heads/master
	git-r3_checkout https://github.com/GPUOpen-Drivers/AMDVLK.git 		drivers/AMDVLK
	git-r3_fetch	https://github.com/GPUOpen-Drivers/llvm.git			1fc1a7d4248b4749c3df21eb48f7ae97b6cddf74 
	git-r3_checkout https://github.com/GPUOpen-Drivers/llvm.git			drivers/llvm
	git-r3_fetch	https://github.com/GPUOpen-Drivers/MetroHash.git	2b6fee002db6cc92345b02aeee963ebaaf4c0e2f
	git-r3_checkout https://github.com/GPUOpen-Drivers/MetroHash.git	drivers/third_party/metrohash
	git-r3_fetch	https://github.com/GPUOpen-Drivers/CWPack.git		b601c88aeca7a7b08becb3d32709de383c8ee428
	git-r3_checkout https://github.com/GPUOpen-Drivers/CWPack.git		drivers/third_party/cwpack

	CMAKE_BUILD_TYPE=Release
}

src_prepare () {
	for i in xgl/icd/CMakeLists.txt llpc/CMakeLists.txt llpc/imported/metrohash/CMakeLists.txt llvm/utils/benchmark/CMakeLists.txt llvm/utils/benchmark/test/CMakeLists.txt pal/src/core/imported/addrlib/CMakeLists.txt pal/src/core/imported/vam/CMakeLists.txt pal/shared/gpuopen/cmake/AMD.cmake
	do
	  sed -i "s/-Werror//g" "${WORKDIR}/drivers/${i}"
	done

	cmake-utils_src_prepare
}

multilib_src_install () {
	keepdir /usr/share/vulkan/icd.d
	insinto /usr/share/vulkan/icd.d

	if ${ABI} = amd64; then
		doins ${WORKDIR}/json/Ubuntu/amd_icd64.json
	else
		doins ${WORKDIR}/json/Ubuntu/amd_icd32.json
	fi
}

