# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/LatencyUtils-2.0.3.pom --download-uri https://repo.maven.apache.org/maven2/org/latencyutils/LatencyUtils/2.0.3/LatencyUtils-2.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild LatencyUtils-2.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="LatencyUtils is a package that provides latency recording and reporting utilities."
HOMEPAGE="http://latencyutils.github.io/LatencyUtils/"
SRC_URI="https://repo.maven.apache.org/maven2/org/latencyutils/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.latencyutils:LatencyUtils:2.0.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.hdrhistogram:HdrHistogram:2.1.8 -> >=app-maven/HdrHistogram-2.1.9:0

CDEPEND="
	>=app-maven/HdrHistogram-2.1.9:0
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

JAVA_GENTOO_CLASSPATH="HdrHistogram"
