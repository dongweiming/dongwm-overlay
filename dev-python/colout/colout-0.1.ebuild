# ChangeLog for dev-python/colout
# Copyright 1999-2013 Gentoo Foundation; Distributed under the GPL v3
# $Header: /var/cvsroot/gentoo-x86/dev-python/colout/ChangeLog,v 1.1 2013/05/05 21:18:19 floppym Exp $

EAPI="3"
PYTHON_DEPEND="2:2.5 3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

MY_PN="colout"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Color Up Arbitrary Command Ouput."
HOMEPAGE="http://nojhan.github.com/colout/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RDEPEND="dev-python/argparse
	dev-python/pygments
	dev-python/Babel"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_test() {
	testing() {
		PYTHONPATH="." "$(PYTHON)" run-tests.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die "Installation of examples failed"
	fi
}
