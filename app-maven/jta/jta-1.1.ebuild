# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jta-1.1.pom --download-uri https://repo.maven.apache.org/maven2/javax/transaction/jta/1.1/jta-1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jta-1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The javax.transaction package. It is appropriate for inclusion in a classpath, and may be added to a Java 2 installation."
HOMEPAGE="http://java.sun.com/products/jta"
SRC_URI="https://repo.maven.apache.org/maven2/javax/transaction/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.transaction:jta:1.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

