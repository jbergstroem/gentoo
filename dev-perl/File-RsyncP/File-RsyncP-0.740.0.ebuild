# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=CBARRATT
MODULE_VERSION=0.74
inherit perl-module

DESCRIPTION="An rsync perl module"
HOMEPAGE="http://perlrsync.sourceforge.net/ ${HOMEPAGE}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="net-misc/rsync"

PATCHES=( "${FILESDIR}/${PN}-0.700.0-make.patch" )

src_prepare() {
	perl-module_src_prepare
	tc-export CC
}

SRC_TEST="do parallel"
