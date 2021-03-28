EAPI=7

CRATES="
ahash-0.7.2
arrayvec-0.5.2
autocfg-1.0.1
bitflags-1.2.1
bumpalo-3.6.1
cc-1.0.67
cfg-if-1.0.0
chrono-0.4.19
crossbeam-channel-0.5.0
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.3
crossbeam-queue-0.3.1
crossbeam-utils-0.8.3
crossterm-0.19.0
crossterm_winapi-0.7.0
ctrlc-3.1.8
either-1.6.1
getrandom-0.2.2
hermit-abi-0.1.18
instant-0.1.9
lazy_static-1.4.0
libc-0.2.91
lock_api-0.4.2
log-0.4.14
log-panics-2.0.0
memchr-2.3.4
memoffset-0.6.3
mio-0.7.11
miow-0.3.7
nix-0.20.0
ntapi-0.3.6
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.0
once_cell-1.7.2
parking_lot-0.11.1
parking_lot_core-0.8.3
pico-args-0.4.0
proc-macro2-1.0.24
quote-1.0.9
rayon-1.5.0
rayon-core-1.9.0
redox_syscall-0.2.5
scopeguard-1.1.0
signal-hook-0.1.17
signal-hook-registry-1.3.0
simplelog-0.10.0
smallvec-1.6.1
termcolor-1.1.2
time-0.1.43
unicode-xid-0.2.1
utf8parse-0.2.0
version_check-0.9.3
vte-0.10.0
vte_generate_state_changes-0.1.1
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
${P}
"

inherit cargo

DESCRIPTION="Yet another pager in Rust"
HOMEPAGE="https://github.com/Riey/rust-pager"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm arm64"
IUSE=""

DEPEND=""
RDEPEND=""
