# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo git-r3

CARGO_FETCH_CRATES=yes

DESCRIPTION="Very resourcefriendly and feature-rich replacement for i3status, written in pure Rust"
HOMEPAGE="https://github.com/greshake/i3status-rust"
EGIT_REPO_URI="https://github.com/greshake/i3status-rust"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} >=sys-apps/dbus-1.12"
BDEPEND=">=virtual/rust-1.37"

src_compile() {
	cargo build --release
}

src_install() {
	dobin target/release/i3status-rs
}

