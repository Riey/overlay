# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo cmake xdg-utils gnome2-utils qmake-utils desktop

CRATES="
ab_glyph-0.2.18
ab_glyph_rasterizer-0.1.7
adler-1.0.2
ahash-0.8.2
anes-0.1.6
ansi_term-0.12.1
anyhow-1.0.66
approx-0.5.1
arboard-2.1.1
arrayref-0.3.6
arrayvec-0.5.2
atomic_refcell-0.1.8
atty-0.2.14
autocfg-1.1.0
bindgen-0.63.0
bit_field-0.10.1
bitflags-1.3.2
block-0.1.6
boxfnonce-0.1.1
bumpalo-3.11.1
bytemuck-1.12.3
bytemuck_derive-1.3.0
byteorder-1.4.3
bytes-1.3.0
calloop-0.10.3
cast-0.3.0
cbindgen-0.24.3
cc-1.0.77
cesu8-1.1.0
cexpr-0.6.0
cfg-if-1.0.0
cgl-0.3.2
ciborium-0.2.0
ciborium-io-0.2.0
ciborium-ll-0.2.0
clang-sys-1.4.0
clap-2.34.0
clap-3.2.23
clap_lex-0.2.4
clipboard-win-4.4.2
cmake-0.1.49
cocoa-0.24.1
cocoa-foundation-0.1.0
color_quant-1.1.0
combine-4.6.6
const-random-0.1.15
const-random-macro-0.1.15
conv-0.3.3
core-foundation-0.9.3
core-foundation-sys-0.8.3
core-graphics-0.22.3
core-graphics-types-0.1.1
core-text-19.2.0
crc32fast-1.3.2
criterion-0.4.0
criterion-plot-0.5.0
crossbeam-channel-0.5.6
crossbeam-deque-0.8.2
crossbeam-epoch-0.9.13
crossbeam-utils-0.8.14
crossfont-0.5.1
crunchy-0.2.2
ctor-0.1.26
ctrlc-3.2.3
cty-0.2.2
custom_derive-0.1.7
daemonize-0.4.1
darling-0.13.4
darling-0.14.2
darling_core-0.13.4
darling_core-0.14.2
darling_macro-0.13.4
darling_macro-0.14.2
dbus-0.9.6
dbus-codegen-0.9.1
dbus-tree-0.9.2
diff-0.1.13
dirs-4.0.0
dirs-sys-0.3.7
dispatch-0.2.0
dlib-0.5.0
downcast-rs-1.2.0
dwrote-0.11.0
eframe-0.19.0
egui-0.19.0
egui-winit-0.19.0
egui_glow-0.19.0
either-1.8.0
emath-0.19.0
encoding_rs-0.8.31
enum-map-2.4.1
enum-map-derive-0.10.0
enumset-1.0.12
enumset_derive-0.6.1
epaint-0.19.0
error-code-2.3.1
expat-sys-2.1.6
exr-1.5.2
fastrand-1.8.0
flate2-1.0.25
flume-0.10.14
fnv-1.0.7
fontconfig-parser-0.5.1
fontdb-0.10.0
foreign-types-0.3.2
foreign-types-0.5.0
foreign-types-macros-0.2.2
foreign-types-shared-0.1.1
foreign-types-shared-0.3.1
form_urlencoded-1.1.0
freetype-rs-0.26.0
freetype-sys-0.13.1
futures-core-0.3.25
futures-sink-0.3.25
gethostname-0.2.3
getrandom-0.1.16
getrandom-0.2.8
gif-0.11.4
gl_generator-0.14.0
glob-0.3.0
glow-0.11.2
glutin-0.29.1
glutin_egl_sys-0.1.6
glutin_gles2_sys-0.1.5
glutin_glx_sys-0.1.8
glutin_wgl_sys-0.1.5
half-1.8.2
half-2.1.0
hashbrown-0.12.3
hashbrown-0.13.1
heck-0.4.0
hermit-abi-0.1.19
ident_case-1.0.1
idna-0.3.0
image-0.24.5
imageproc-0.23.0
indexmap-1.9.2
instant-0.1.12
itertools-0.10.5
itoa-1.0.4
jni-0.19.0
jni-sys-0.3.0
jpeg-decoder-0.3.0
js-sys-0.3.60
khronos_api-3.1.0
ksni-0.2.0
lazy_static-1.4.0
lazycell-1.3.0
lebe-0.5.2
libc-0.2.137
libdbus-sys-0.2.2
libloading-0.7.4
lock_api-0.4.9
log-0.4.17
malloc_buf-0.0.6
maplit-1.0.2
matrixmultiply-0.3.2
memchr-2.5.0
memmap2-0.5.8
memoffset-0.6.5
memoffset-0.7.1
minimal-lexical-0.2.1
miniz_oxide-0.6.2
mio-0.7.14
mio-0.8.5
mio-timerfd-0.2.0
miow-0.3.7
nalgebra-0.30.1
nanorand-0.7.0
ndk-0.6.0
ndk-0.7.0
ndk-context-0.1.1
ndk-glue-0.6.2
ndk-glue-0.7.0
ndk-macro-0.3.0
ndk-sys-0.3.0
ndk-sys-0.4.1+23.1.7779620
nix-0.22.3
nix-0.24.2
nix-0.25.0
nohash-hasher-0.2.0
nom-7.1.1
ntapi-0.3.7
num-0.4.0
num-bigint-0.4.3
num-complex-0.4.2
num-derive-0.3.3
num-integer-0.1.45
num-iter-0.1.43
num-rational-0.4.1
num-traits-0.2.15
num_cpus-1.14.0
num_enum-0.5.7
num_enum_derive-0.5.7
num_threads-0.1.6
objc-0.2.7
objc-foundation-0.1.1
objc_id-0.1.1
once_cell-1.16.0
oorandom-11.1.3
os_str_bytes-6.4.1
osmesa-sys-0.1.2
output_vt100-0.1.3
owned_ttf_parser-0.15.2
owned_ttf_parser-0.17.1
pad-0.1.6
parking_lot-0.12.1
parking_lot_core-0.9.4
paste-1.0.9
peeking_take_while-0.1.2
percent-encoding-2.2.0
pico-args-0.5.0
pin-project-1.0.12
pin-project-internal-1.0.12
pin-project-lite-0.2.9
pin-utils-0.1.0
pkg-config-0.3.26
plotters-0.3.4
plotters-backend-0.3.4
plotters-svg-0.3.3
png-0.17.7
ppv-lite86-0.2.17
pretty_assertions-1.3.0
proc-macro-crate-1.2.1
proc-macro-hack-0.5.19
proc-macro2-1.0.47
quick-xml-0.26.0
quote-1.0.21
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_distr-0.2.2
rand_hc-0.2.0
raw-window-handle-0.4.3
raw-window-handle-0.5.0
rawpointer-0.2.1
rayon-1.6.0
rayon-core-1.10.1
redox_syscall-0.2.16
redox_users-0.4.3
regex-1.7.0
regex-syntax-0.6.28
remove_dir_all-0.5.3
roxmltree-0.15.1
rustc-hash-1.1.0
rusttype-0.9.3
rustversion-1.0.9
ryu-1.0.11
safe_arch-0.5.2
safe_arch-0.6.0
same-file-1.0.6
scoped-tls-1.0.1
scoped_threadpool-0.1.9
scopeguard-1.1.0
sctk-adwaita-0.4.3
serde-1.0.147
serde_derive-1.0.147
serde_json-1.0.89
serde_yaml-0.9.14
servo-fontconfig-0.5.1
servo-fontconfig-sys-5.1.0
shared_library-0.1.9
shlex-1.1.0
simba-0.7.3
simplelog-0.12.0
slotmap-1.0.6
smallvec-1.10.0
smithay-client-toolkit-0.16.0
smithay-clipboard-0.6.6
spin-0.9.4
str-buf-1.0.6
strsim-0.8.0
strsim-0.10.0
strum-0.24.1
strum_macros-0.24.3
syn-1.0.103
tempfile-3.3.0
termcolor-1.1.3
textwrap-0.11.0
textwrap-0.16.0
thiserror-1.0.37
thiserror-impl-1.0.37
threadpool-1.8.1
tiff-0.8.0
time-0.3.17
time-core-0.1.0
time-macros-0.2.6
tiny-keccak-2.0.2
tiny-skia-0.7.0
tiny-skia-path-0.7.0
tinytemplate-1.2.1
tinyvec-1.6.0
tinyvec_macros-0.1.0
toml-0.5.9
tracing-0.1.37
tracing-core-0.1.30
ttf-parser-0.15.2
ttf-parser-0.17.1
typenum-1.15.0
unicode-bidi-0.3.8
unicode-ident-1.0.5
unicode-normalization-0.1.22
unicode-width-0.1.10
unsafe-libyaml-0.2.4
url-2.3.1
vec_map-0.8.2
version_check-0.9.4
walkdir-2.3.2
wasi-0.9.0+wasi-snapshot-preview1
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.83
wasm-bindgen-backend-0.2.83
wasm-bindgen-futures-0.4.33
wasm-bindgen-macro-0.2.83
wasm-bindgen-macro-support-0.2.83
wasm-bindgen-shared-0.2.83
wayland-client-0.29.5
wayland-commons-0.29.5
wayland-cursor-0.29.5
wayland-egl-0.29.5
wayland-protocols-0.29.5
wayland-scanner-0.29.5
wayland-sys-0.29.5
web-sys-0.3.60
webbrowser-0.7.1
weezl-0.1.7
wide-0.7.5
widestring-0.5.1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-wsapoll-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows-sys-0.42.0
windows_aarch64_gnullvm-0.42.0
windows_aarch64_msvc-0.36.1
windows_aarch64_msvc-0.42.0
windows_i686_gnu-0.36.1
windows_i686_gnu-0.42.0
windows_i686_msvc-0.36.1
windows_i686_msvc-0.42.0
windows_x86_64_gnu-0.36.1
windows_x86_64_gnu-0.42.0
windows_x86_64_gnullvm-0.42.0
windows_x86_64_msvc-0.36.1
windows_x86_64_msvc-0.42.0
winit-0.27.5
wio-0.2.2
x11-dl-2.20.1
x11rb-0.9.0
x11rb-0.11.0
x11rb-protocol-0.11.0
xcursor-0.3.4
xdg-2.4.1
xim-0.2.1
xim-ctext-0.3.0
xim-parser-0.2.1
xml-rs-0.8.4
xmlparser-0.13.5
yansi-0.5.1
zwp-virtual-keyboard-0.2.7
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
	gtk4
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
	gtk4? ( x11-libs/gtk )
	qt? ( dev-qt/qtgui )
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/clang
"
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

	if (use gtk4); then
		mycmakeargs+=(-DENABLE_GTK4=ON)
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

	if (use gtk4); then
		insinto "/usr/$(get_libdir)/gtk-4.0/4.0.0/immodules"
		newins "${BUILD_DIR}/lib/libkime-gtk4.so" "im-kime.so"
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
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	use gtk && gnome2_query_immodules_gtk3
}
