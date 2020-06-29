# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/pointsto-19.2.1.pom --download-uri https://repo.maven.apache.org/maven2/com/oracle/substratevm/pointsto/19.2.1/pointsto-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild pointsto-19.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SubstrateVM static analysis to find ahead-of-time the code"
HOMEPAGE="https://github.com/oracle/graal/tree/master/substratevm"
SRC_URI="https://repo.maven.apache.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.oracle.substratevm:pointsto:19.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.compiler:compiler:19.2.1 -> >=dev-java/compiler-19.2.1:0

CDEPEND="
	>=dev-java/compiler-19.2.1:0
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

JAVA_GENTOO_CLASSPATH="compiler"
