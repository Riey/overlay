# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo cmake xdg-utils gnome2-utils qmake-utils desktop

CRATES="
ahash-0.7.4
ansi_term-0.11.0
ansi_term-0.12.1
anyhow-1.0.44
atty-0.2.14
autocfg-1.0.1
bindgen-0.59.1
bitflags-1.3.2
bitvec-0.19.5
boxfnonce-0.1.1
bstr-0.2.16
bumpalo-3.7.0
cairo-rs-0.14.3
cairo-sys-rs-0.14.0
cast-0.2.7
cbindgen-0.20.0
cc-1.0.70
cexpr-0.5.0
cfg-expr-0.8.1
cfg-if-1.0.0
chrono-0.4.19
clang-sys-1.2.2
clap-2.33.3
criterion-0.3.5
criterion-plot-0.4.4
crossbeam-channel-0.5.1
crossbeam-deque-0.8.1
crossbeam-epoch-0.9.5
crossbeam-utils-0.8.5
csv-1.1.6
csv-core-0.1.10
ctor-0.1.21
ctrlc-3.2.0
daemonize-0.4.1
darling-0.13.0
darling_core-0.13.0
darling_macro-0.13.0
dbus-0.9.3
dbus-codegen-0.9.1
dbus-tree-0.9.1
diff-0.1.12
downcast-rs-1.2.0
dtoa-0.4.8
either-1.6.1
encoding_rs-0.8.28
enum-map-1.1.1
enum-map-derive-0.6.0
enumset-1.0.7
enumset_derive-0.5.5
fnv-1.0.7
funty-1.1.0
futures-channel-0.3.17
futures-core-0.3.17
futures-executor-0.3.17
futures-task-0.3.17
futures-util-0.3.17
gethostname-0.2.1
getrandom-0.2.3
glib-0.14.5
glib-macros-0.14.1
glib-sys-0.14.0
glob-0.3.0
gobject-sys-0.14.0
half-1.7.1
hashbrown-0.11.2
heck-0.3.3
hermit-abi-0.1.19
ident_case-1.0.1
indexmap-1.7.0
itertools-0.10.1
itoa-0.4.8
js-sys-0.3.54
ksni-0.2.0
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.101
libdbus-sys-0.2.1
linked-hash-map-0.5.4
log-0.4.14
maplit-1.0.2
memchr-2.4.1
memoffset-0.6.4
mio-0.7.13
mio-timerfd-0.2.0
miow-0.3.7
nix-0.22.0
nom-6.1.2
ntapi-0.3.6
num-derive-0.3.3
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.0
once_cell-1.8.0
oorandom-11.1.3
output_vt100-0.1.2
pad-0.1.6
peeking_take_while-0.1.2
pico-args-0.4.2
pin-project-lite-0.2.7
pin-utils-0.1.0
pkg-config-0.3.19
plotters-0.3.1
plotters-backend-0.3.2
plotters-svg-0.3.1
ppv-lite86-0.2.10
pretty_assertions-0.7.2
proc-macro-crate-1.0.0
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.29
quick-xml-0.22.0
quote-1.0.9
radium-0.5.3
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.6.3
rand_hc-0.3.1
rayon-1.5.1
rayon-core-1.9.1
redox_syscall-0.2.10
regex-1.5.4
regex-automata-0.1.10
regex-syntax-0.6.25
remove_dir_all-0.5.3
rustc-hash-1.1.0
rustc_version-0.4.0
ryu-1.0.5
same-file-1.0.6
scopeguard-1.1.0
semver-1.0.4
serde-1.0.130
serde_cbor-0.11.2
serde_derive-1.0.130
serde_json-1.0.67
serde_yaml-0.8.21
shlex-1.1.0
simplelog-0.10.0
slab-0.4.4
smallvec-1.6.1
strsim-0.8.0
strsim-0.10.0
strum-0.21.0
strum_macros-0.21.1
syn-1.0.76
system-deps-3.2.0
tap-1.0.1
tempfile-3.2.0
termcolor-1.1.2
textwrap-0.11.0
thiserror-1.0.29
thiserror-impl-1.0.29
time-0.1.43
tinytemplate-1.2.1
toml-0.5.8
unicode-segmentation-1.8.0
unicode-width-0.1.8
unicode-xid-0.2.2
vec_map-0.8.2
version-compare-0.0.11
version_check-0.9.3
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
wasm-bindgen-0.2.77
wasm-bindgen-backend-0.2.77
wasm-bindgen-macro-0.2.77
wasm-bindgen-macro-support-0.2.77
wasm-bindgen-shared-0.2.77
wayland-client-0.29.0
wayland-commons-0.29.0
wayland-protocols-0.29.0
wayland-scanner-0.29.0
wayland-sys-0.29.0
web-sys-0.3.54
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-wsapoll-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
wyz-0.2.0
x11rb-0.9.0
xdg-2.2.0
xim-0.1.2
xim-ctext-0.2.0
xim-parser-0.1.1
xml-rs-0.8.4
yaml-rust-0.4.5
zwp-virtual-keyboard-0.2.3
"

DESCRIPTION="Korean IME"
HOMEPAGE="https://github.com/Riey/kime"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz $(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm64 arm ppc64"

IUSE="
	X
	+check
	+indicator
	gtk
	gtk2
	qt
	wayland
	doc
"
DEPEND="
	X? (
		x11-libs/libxcb
		x11-libs/cairo
	)
	indicator? (
		sys-apps/dbus
	)
	gtk? ( x11-libs/gtk+:3 )
	gtk2? ( x11-libs/gtk+:2 )
	qt? ( dev-qt/qtgui )
"
RDEPEND="${DEPEND}"
BDEPEND=""
CMAKE_USE_DIR="${S}/src"
BUILD_DIR="${WORKDIR}/${P}_build"
QA_SONAME=(
	"usr/lib/libkime_engine.so"
	"usr/lib64/libkime_engine.so"
)

src_unpack() {
	cargo_src_unpack
	default
}

src_configure() {
	local mycmakeargs=()

	if (use gtk); then
		mycmakeargs+=(-DENABLE_GTK3=ON)
	fi

	if (use gtk2); then
		mycmakeargs+=(-DENABLE_GTK2=ON)
	fi

	if (use qt); then
		mycmakeargs+=(-DENABLE_QT5=ON)
	fi

	cmake_src_configure || die
}

src_compile() {
	local cargopkgs=(-pkime -pkime-engine-capi -pkime-engine-cffi)
	if (use X); then
		cargopkgs+=(-pkime-xim)
	fi
	if (use wayland); then
		cargopkgs+=(-pkime-wayland)
	fi
	if (use check); then
		cargopkgs+=(-pkime-check)
	fi
	if (use indicator); then
		cargopkgs+=(-pkime-indicator)
	fi
	cargo_src_compile "${cargopkgs[@]}" || die
	cmake_src_compile || die
}

src_install() {
	dolib.so target/release/libkime_engine.so
	dobin target/release/kime
	domenu res/kime.desktop

	if (use X); then
		dobin target/release/kime-xim
	fi

	if (use wayland); then
		dobin target/release/kime-wayland
	fi

	if (use check); then
		dobin target/release/kime-check
	fi

	if (use indicator); then
		dobin target/release/kime-indicator
	fi

	if (use doc); then
		dodoc res/default_config.yaml
		dodoc LICENSE
		dodoc NOTICE.md
		dodoc README.md
		dodoc README.ko.md
		dodoc docs/CHANGELOG.md
	fi

	insopts -m0644

	doicon -s 64x64 res/icons/64x64/*

	insopts -m0755

	if (use gtk); then
		insinto "/usr/$(get_libdir)/gtk-3.0/3.0.0/immodules"
		newins "${BUILD_DIR}/lib/libkime-gtk3.so" "im-kime.so"
	fi

	if (use gtk2); then
		insinto "/usr/$(get_libdir)/gtk-2.0/2.10.0/immodules"
		newins "${BUILD_DIR}/lib/libkime-gtk2.so" "im-kime.so"
	fi

	if (use qt); then
		insinto "/$(qt5_get_plugindir)/platforminputcontexts"
		newins "${BUILD_DIR}/lib/libkime-qt5.so" "libkimeplatforminputcontextplugin.so"
	fi
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	use gtk && gnome2_query_immodules_gtk3
	use gtk2 && gnome2_query_immodules_gtk2
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	use gtk && gnome2_query_immodules_gtk3
	use gtk2 && gnome2_query_immodules_gtk2
}
