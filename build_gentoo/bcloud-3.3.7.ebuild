# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_3 python3_4 )
PYTHON_REQ_USE="sqlite"

inherit python-r1

DESCRIPTION="Baidu Pan client for Linux Desktop users"
HOMEPAGE="https://github.com/LiuLang/bcloud"
SRC_URI="https://pypi.python.org/packages/source/b/${PN}/${P}.tar.gz -> ${PN}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	dev-python/pygobject:3
	x11-themes/gnome-icon-theme-symbolic
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}] 
	dev-python/pycrypto[${PYTHON_USEDEP}]
	x11-libs/libnotify
	"
src_install() {
	python_foreach_impl python_domodule ${PN}
	dobin bcloud-gui
	insinto usr
	doins -r share
}