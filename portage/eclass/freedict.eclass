# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/freedict.eclass,v 1.19 2011/08/22 04:46:31 vapier Exp $

# @ECLASS: freedict.eclass
# @MAINTAINER:
# app-dicts@gentoo.org
# @AUTHOR:
# Original author: Seemant Kulleen
# @BLURB: Ease the installation of freedict translation dictionaries
# @DESCRIPTION:
# This eclass exists to ease the installation of freedict translation
# dictionaries.  The only variables which need to be defined in the actual
# ebuilds are FORLANG and TOLANG for the source and target languages,
# respectively.

# @ECLASS-VARIABLE: FORLANG
# @DESCRIPTION:
# Please see above for a description.

# @ECLASS-VARIABLE: TOLANG
# @DESCRIPTION:
# Please see above for a description.

inherit eutils

IUSE=""

MY_P=${PN/freedict-/}

S="${WORKDIR}"
DESCRIPTION="Freedict for language translation from ${FORLANG} to ${TOLANG}"
HOMEPAGE="http://www.freedict.de"
SRC_URI="http://freedict.sourceforge.net/download/linux/${MY_P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"

DEPEND="app-text/dictd"

# @FUNCTION: freedict_src_install
# @DESCRIPTION:
# The freedict src_install function, which is exported
freedict_src_install() {
	insinto /usr/$(get_libdir)/dict
	doins ${MY_P}.dict.dz
	doins ${MY_P}.index
}

EXPORT_FUNCTIONS src_install
