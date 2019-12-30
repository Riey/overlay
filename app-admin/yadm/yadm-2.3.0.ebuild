# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1

DESCRIPTION="Yet Another Dotfiles Manager"
HOMEPAGE="https://github.com/TheLocehiliosan/yadm"
SRC_URI="https://github.com/TheLocehiliosan/yadm/archive/${PV}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="
	dev-vcs/git
	zsh-completion? ( app-shells/gentoo-zsh-completions )"
BDEPEND=""

src_compile () {
	true
}

src_install () {
	dobin yadm
	doman yadm.1
	dobashcomp completion/yadm.bash_completion

	if use zsh-completion; then
		insinto usr/share/zsh/site-functions
		newins completion/yadm.zsh_completion _yadm
	fi
}

