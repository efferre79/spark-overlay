# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="H2O Python Package"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI="https://github.com/h2oai/h2o-3/archive/refs/tags/jenkins-${PV}.tar.gz -> h2o-${PV}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/colorama
	dev-python/future
	dev-python/requests
	dev-python/tabulate
"

DEPEND="
	${RDEPEND}
"

S="${WORKDIR}/h2o-3-jenkins-${PV}/${PN}"

src_prepare() {
	distutils-r1_src_prepare

	# Required by the build system for obtaining the version being built
	# Use '-n' to avoid the version normalization QA warning
	echo -n "${PV}" > "h2o/version.txt" || die "Failed to create version.txt"
}
