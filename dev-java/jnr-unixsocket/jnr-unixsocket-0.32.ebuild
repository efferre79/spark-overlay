# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-unixsocket-0.32.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-unixsocket/0.32/jnr-unixsocket-0.32-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-unixsocket-0.32.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Native I/O access for java"
HOMEPAGE="http://github.com/jnr/jnr-unixsocket"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.jnr:jnr-unixsocket:0.32"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-constants:0.9.15 -> >=dev-java/jnr-constants-0.9.15:0
# com.github.jnr:jnr-enxio:0.28 -> >=dev-java/jnr-enxio-0.28:0
# com.github.jnr:jnr-ffi:2.1.15 -> >=dev-java/jnr-ffi-2.1.15:0
# com.github.jnr:jnr-posix:3.0.57 -> >=dev-java/jnr-posix-3.0.10:3.0

CDEPEND="
	>=dev-java/jnr-constants-0.9.15:0
	>=dev-java/jnr-enxio-0.28:0
	>=dev-java/jnr-ffi-2.1.15:0
	>=dev-java/jnr-posix-3.0.10:3.0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jnr-constants,jnr-enxio,jnr-ffi,jnr-posix-3.0"
