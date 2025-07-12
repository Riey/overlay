# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo cmake xdg-utils gnome2-utils qmake-utils desktop

CRATES="
ab_glyph-0.2.28
ab_glyph_rasterizer-0.1.8
accesskit-0.8.1
accesskit_consumer-0.12.1
accesskit_macos-0.4.2
accesskit_windows-0.10.4
accesskit_winit-0.7.3
aho-corasick-1.1.3
adler-1.0.2
ahash-0.8.11
anes-0.1.6
ansi_term-0.12.1
anyhow-1.0.86
approx-0.5.1
arboard-3.4.0
arrayref-0.3.8
arrayvec-0.5.2
arrayvec-0.7.4
atomic_refcell-0.1.13
atty-0.2.14
autocfg-1.3.0
bindgen-0.69.4
bit_field-0.10.2
bitflags-1.3.2
bitflags-2.6.0
block-0.1.6
block-sys-0.1.0-beta.1
block2-0.2.0-alpha.6
block2-0.5.1
boxfnonce-0.1.1
bumpalo-3.16.0
bytemuck-1.16.1
bytemuck_derive-1.7.0
byteorder-1.5.0
bytes-1.6.1
calloop-0.10.6
cast-0.3.0
cbindgen-0.26.0
cc-1.1.7
cesu8-1.1.0
cexpr-0.6.0
cfg-if-1.0.0
cfg_aliases-0.1.1
cgl-0.3.2
ciborium-0.2.2
ciborium-io-0.2.2
ciborium-ll-0.2.2
clang-sys-1.8.1
clap-2.34.0
clap-3.2.25
clap_lex-0.2.4
clipboard-win-5.4.0
cmake-0.1.50
cocoa-0.24.1
cocoa-0.25.0
cocoa-foundation-0.1.2
color_quant-1.1.0
combine-4.6.7
const-random-0.1.18
const-random-macro-0.1.16
conv-0.3.3
core-foundation-0.9.4
core-foundation-sys-0.8.6
core-graphics-0.22.3
core-graphics-0.23.2
core-graphics-types-0.1.3
core-text-20.1.0
crc32fast-1.4.2
criterion-0.4.0
criterion-plot-0.5.0
crossbeam-deque-0.8.5
crossbeam-epoch-0.9.18
crossbeam-utils-0.8.20
crossfont-0.5.2
crunchy-0.2.2
ctor-0.1.26
ctrlc-3.4.4
cty-0.2.2
custom_derive-0.1.7
daemonize-0.5.0
darling-0.13.4
darling-0.20.10
darling_core-0.13.4
darling_core-0.20.10
darling_macro-0.13.4
darling_macro-0.20.10
dbus-0.9.7
dbus-codegen-0.9.1
dbus-tree-0.9.2
deranged-0.3.11
diff-0.1.13
dirs-4.0.0
dirs-sys-0.3.7
dispatch-0.2.0
dlib-0.5.2
downcast-rs-1.2.1
dwrote-0.11.0
ecolor-0.20.0
eframe-0.20.1
egui-0.20.1
egui-winit-0.20.1
egui_glow-0.20.1
either-1.13.0
emath-0.20.0
encoding_rs-0.8.34
enum-map-2.7.3
enum-map-derive-0.17.0
enumset-1.1.5
enumset_derive-0.10.0
equivalent-1.0.1
epaint-0.20.0
errno-0.3.9
error-code-3.2.0
expat-sys-2.1.6
exr-1.72.0
equivalent-1.0.1
fastrand-2.1.0
fdeflate-0.3.4
flate2-1.0.30
flume-0.11.0
fnv-1.0.7
fontconfig-parser-0.5.6
fontdb-0.11.2
foreign-types-0.3.2
foreign-types-0.5.0
foreign-types-macros-0.2.3
foreign-types-shared-0.1.1
foreign-types-shared-0.3.1
form_urlencoded-1.2.1
freetype-rs-0.26.0
freetype-sys-0.13.1
futures-core-0.3.25
futures-sink-0.3.25
gethostname-0.2.3
gethostname-0.4.3
getrandom-0.1.16
getrandom-0.2.15
gif-0.13.1
gl_generator-0.14.0
glob-0.3.1
glow-0.11.2
glutin-0.30.10
glutin_egl_sys-0.5.1
glutin_gles2_sys-0.1.5
glutin_glx_sys-0.4.0
glutin_wgl_sys-0.4.0
half-2.4.1
hashbrown-0.12.3
hashbrown-0.13.2
hashbrown-0.14.5
heck-0.4.1
hermit-abi-0.1.19
home-0.5.9
ident_case-1.0.1
idna-0.5.0
image-0.24.9
imageproc-0.23.0
indexmap-1.9.3
indexmap-2.2.6
instant-0.1.13
itertools-0.10.5
itertools-0.12.1
itertools-0.13.0
itoa-1.0.11
jni-0.21.1
jni-sys-0.3.0
jpeg-decoder-0.3.1
js-sys-0.3.69
khronos_api-3.1.0
kurbo-0.8.3
ksni-0.2.2
lazy_static-1.5.0
lazycell-1.3.0
lebe-0.5.2
libc-0.2.155
libdbus-sys-0.2.5
libloading-0.7.4
libloading-0.8.5
linux-raw-sys-0.4.14
lock_api-0.4.12
log-0.4.22
malloc_buf-0.0.6
maplit-1.0.2
matches-0.1.10
matrixmultiply-0.3.9
memchr-2.7.4
memmap2-0.5.10
memmap2-0.8.0
memoffset-0.6.5
memoffset-0.7.1
minimal-lexical-0.2.1
miniz_oxide-0.7.4
mio-0.7.14
mio-0.8.11
mio-timerfd-0.2.0
miow-0.3.7
nalgebra-0.30.1
nanorand-0.7.0
ndk-0.7.0
ndk-context-0.1.1
ndk-glue-0.7.0
ndk-macro-0.3.0
ndk-sys-0.4.1+23.1.7779620
nix-0.24.3
nix-0.25.1
nix-0.26.4
nix-0.28.0
nohash-hasher-0.2.0
nom-7.1.3
ntapi-0.3.7
num-0.4.3
num-bigint-0.4.6
num-complex-0.4.6
num-conv-0.1.0
num-derive-0.3.3
num-integer-0.1.46
num-iter-0.1.45
num-rational-0.4.2
num-traits-0.2.19
num_cpus-1.14.0
num_enum-0.5.11
num_enum_derive-0.5.11
num_threads-0.1.7
objc-0.2.7
objc-sys-0.2.0-beta.2
objc-sys-0.3.5
objc2-0.3.0-beta.3
objc2-0.5.2
objc2-app-kit-0.2.2
objc2-core-data-0.2.2
objc2-core-image-0.2.2
objc2-encode-2.0.0-pre.2
objc2-encode-4.0.3
objc2-foundation-0.2.2
objc2-metal-0.2.2
objc2-quartz-core-0.2.2
objc-foundation-0.1.1
objc_id-0.1.1
once_cell-1.19.0
oorandom-11.1.4
os_str_bytes-6.6.1
osmesa-sys-0.1.2
output_vt100-0.1.3
owned_ttf_parser-0.15.2
owned_ttf_parser-0.24.0
pad-0.1.6
parking_lot-0.12.3
parking_lot_core-0.9.10
paste-1.0.15
peeking_take_while-0.1.2
percent-encoding-2.3.1
pico-args-0.5.0
pin-project-1.0.12
pin-project-internal-1.0.12
pin-project-lite-0.2.14
pin-utils-0.1.0
pkg-config-0.3.30
plotters-0.3.6
plotters-backend-0.3.6
plotters-svg-0.3.6
png-0.17.13
powerfmt-0.2.0
ppv-lite86-0.2.18
pretty_assertions-1.4.0
proc-macro-crate-1.3.1
proc-macro-hack-0.5.19
proc-macro2-1.0.86
qoi-0.4.1
quick-xml-0.27.1
quote-1.0.36
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_distr-0.2.2
rand_hc-0.2.0
raw-window-handle-0.4.3
raw-window-handle-0.5.2
rawpointer-0.2.1
rayon-1.10.0
rayon-core-1.12.1
redox_syscall-0.5.3
redox_users-0.4.3
regex-1.10.5
regex-automata-0.4.7
regex-syntax-0.8.4
remove_dir_all-0.5.3
roxmltree-0.19.0
rustc-hash-1.1.0
rustix-0.38.34
rusttype-0.9.3
rustversion-1.0.17
ryu-1.0.18
safe_arch-0.5.2
safe_arch-0.7.2
same-file-1.0.6
scoped-tls-1.0.1
scoped_threadpool-0.1.9
scopeguard-1.2.0
sctk-adwaita-0.4.3
serde-1.0.204
serde_yaml-0.9.34+deprecated
serde_derive-1.0.204
serde_json-1.0.121
servo-fontconfig-0.5.1
servo-fontconfig-sys-5.1.0
shared_library-0.1.9
shlex-1.3.0
simba-0.7.3
simd-adler32-0.3.7
simplelog-0.12.2
slotmap-1.0.7
smallvec-1.13.2
smithay-client-toolkit-0.16.1
smithay-clipboard-0.6.6
spin-0.9.8
str-buf-1.0.6
strsim-0.8.0
strsim-0.10.0
strum-0.24.1
strum_macros-0.24.3
syn-1.0.109
syn-2.0.72
tempfile-3.10.1
termcolor-1.4.1
textwrap-0.11.0
textwrap-0.16.1
thiserror-1.0.63
thiserror-impl-1.0.63
threadpool-1.8.1
tiff-0.9.1
time-0.3.36
time-core-0.1.2
time-macros-0.2.18
tiny-keccak-2.0.2
tiny-skia-0.7.0
tiny-skia-path-0.7.0
tinytemplate-1.2.1
tinyvec-1.8.0
tinyvec_macros-0.1.1
toml-0.5.11
toml_datetime-0.6.7
toml_edit-0.19.15
tracing-0.1.40
tracing-core-0.1.32
ttf-parser-0.15.2
ttf-parser-0.18.1
ttf-parser-0.24.0
typenum-1.17.0
unic-0.9.0
unic-ucd-0.9.0
unic-ucd-age-0.9.0
unic-ucd-bidi-0.9.0
unic-ucd-block-0.9.0
unic-ucd-case-0.9.0
unic-ucd-category-0.9.0
unic-ucd-common-0.9.0
unic-ucd-hangul-0.9.0
unic-ucd-ident-0.9.0
unic-ucd-name-0.9.0
unic-ucd-name_aliases-0.9.0
unic-ucd-normal-0.9.0
unic-ucd-segment-0.9.0
unic-ucd-version-0.9.0
unic-segment-0.9.0
unic-normal-0.9.0
unic-common-0.9.0
unic-emoji-0.9.0
unic-emoji-char-0.9.0
unic-bidi-0.9.0
unic-char-0.9.0
unic-char-basics-0.9.0
unic-char-property-0.9.0
unic-char-range-0.9.0
unic-idna-0.9.0
unic-idna-mapping-0.9.0
unic-idna-punycode-0.9.0
unicode-bidi-0.3.15
unicode-ident-1.0.12
unicode-normalization-0.1.23
unicode-width-0.1.13
unsafe-libyaml-0.2.11
url-2.5.2
vec_map-0.8.2
version_check-0.9.5
walkdir-2.5.0
wasi-0.9.0+wasi-snapshot-preview1
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.92
wasm-bindgen-backend-0.2.92
wasm-bindgen-futures-0.4.42
wasm-bindgen-macro-0.2.92
wasm-bindgen-macro-support-0.2.92
wasm-bindgen-shared-0.2.92
wayland-client-0.29.5
wayland-commons-0.29.5
wayland-cursor-0.29.5
wayland-egl-0.29.5
wayland-protocols-0.29.5
wayland-scanner-0.29.5
wayland-sys-0.29.5
wayland-sys-0.30.1
web-sys-0.3.69
webbrowser-0.8.15
weezl-0.1.8
wide-0.7.26
widestring-0.5.1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.8
winapi-wsapoll-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
windows-0.42.0
windows-implement-0.42.0
windows-targets-0.42.2
windows-targets-0.48.5
windows-targets-0.52.6
windows-sys-0.36.1
windows-sys-0.45.0
windows-sys-0.48.0
windows-sys-0.52.0
windows_aarch64_gnullvm-0.42.2
windows_aarch64_gnullvm-0.48.5
windows_aarch64_gnullvm-0.52.6
windows_aarch64_msvc-0.36.1
windows_aarch64_msvc-0.42.2
windows_aarch64_msvc-0.48.5
windows_aarch64_msvc-0.52.6
windows_i686_gnu-0.36.1
windows_i686_gnu-0.42.2
windows_i686_gnu-0.48.5
windows_i686_gnu-0.52.6
windows_i686_gnullvm-0.52.6
windows_i686_msvc-0.36.1
windows_i686_msvc-0.42.2
windows_i686_msvc-0.48.5
windows_i686_msvc-0.52.6
windows_x86_64_gnu-0.36.1
windows_x86_64_gnu-0.42.2
windows_x86_64_gnu-0.48.5
windows_x86_64_gnu-0.52.6
windows_x86_64_gnullvm-0.42.2
windows_x86_64_gnullvm-0.48.5
windows_x86_64_gnullvm-0.52.6
windows_x86_64_msvc-0.36.1
windows_x86_64_msvc-0.42.2
windows_x86_64_msvc-0.48.5
windows_x86_64_msvc-0.52.6
winit-0.27.5
winnow-0.5.40
wio-0.2.2
x11-dl-2.21.0
x11rb-0.9.0
x11rb-0.11.1
x11rb-0.13.1
x11rb-protocol-0.11.1
x11rb-protocol-0.13.1
xcursor-0.3.6
xkbcommon-0.7.0
xdg-2.5.2
xkeysym-0.2.1
xim-0.2.3
xim-ctext-0.3.0
xim-parser-0.2.1
xml-rs-0.8.20
xmlparser-0.13.5
yansi-0.5.1
zerocopy-0.6.6
zerocopy-0.7.35
zerocopy-derive-0.6.6
zerocopy-derive-0.7.35
zune-inflate-0.2.54
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
        gtk4? ( gui-libs/gtk )
        qt? ( dev-qt/qtgui )
"
RDEPEND="${DEPEND}"
BDEPEND="
        llvm-core/clang
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
