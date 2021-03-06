# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils libtool multilib-minimal

DESCRIPTION="C64 SID player library"
HOMEPAGE="http://critical.ch/distfiles/"
SRC_URI="http://critical.ch/distfiles/${P}.tgz"

LICENSE="GPL-2"
SLOT="1"
KEYWORDS="alpha amd64 hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="static-libs"

DOCS=( AUTHORS DEVELOPER )

src_prepare() {
	epatch "${FILESDIR}"/${P}-gcc43.patch
	elibtoolize # required for fbsd .so versioning
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" \
	econf $(use_enable static-libs static)
}

multilib_src_install_all() {
	prune_libtool_files --all
	einstalldocs
}
