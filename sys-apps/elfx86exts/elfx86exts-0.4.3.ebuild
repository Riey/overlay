# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
adler32-1.0.4
ansi_term-0.11.0
assert_cmd-1.0.1
atty-0.2.14
bitflags-1.2.1
bstr-0.2.14
byteorder-1.4.2
capstone-0.7.0
capstone-sys-0.11.0
cc-1.0.52
cfg-if-0.1.10
clap-2.33.3
crc32fast-1.2.0
difference-2.0.0
doc-comment-0.3.3
escargot-0.5.0
flate2-1.0.14
hermit-abi-0.1.12
itoa-0.4.5
lazy_static-1.4.0
libc-0.2.69
log-0.4.8
memchr-2.3.4
memmap-0.7.0
miniz_oxide-0.3.6
object-0.21.1
once_cell-1.5.2
predicates-1.0.4
predicates-core-1.0.0
predicates-tree-1.0.0
proc-macro2-1.0.12
quote-1.0.4
regex-automata-0.1.9
ryu-1.0.4
serde-1.0.110
serde_derive-1.0.110
serde_json-1.0.53
strsim-0.8.0
syn-1.0.19
textwrap-0.11.0
treeline-0.1.0
unicode-width-0.1.7
unicode-xid-0.2.0
vec_map-0.8.2
wait-timeout-0.2.0
wasmparser-0.57.0
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
${P}
"

inherit cargo

DESCRIPTION="Decode x86 binaries (ELF or MachO) and print out which instruction set extensions they use."
HOMEPAGE="https://github.com/pkgw/elfx86exts"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm64 arm"
IUSE=""

DEPEND=""
RDEPEND=""