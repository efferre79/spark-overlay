# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-sslengine-6.1.26.pom --download-uri https://repo.maven.apache.org/maven2/org/mortbay/jetty/jetty-sslengine/6.1.26/jetty-sslengine-6.1.26-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-sslengine-6.1.26.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Parent pom for Jetty at Codehaus"
HOMEPAGE="http://jetty.mortbay.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/mortbay/jetty/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty:jetty-sslengine:6.1.26"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.mortbay.jetty:jetty:6.1.26 -> >=app-maven/jetty-6.1.26:0

CDEPEND="
	>=app-maven/jetty-6.1.26:0
"


DEPEND="
	>=virtual/jdk-1.4:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jetty"
