# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lucene-queryparser-7.6.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/lucene/lucene-queryparser/7.6.0/lucene-queryparser-7.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild lucene-queryparser-7.6.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Lucene QueryParsers module"
HOMEPAGE="http://lucene.apache.org/lucene-parent/lucene-queryparser"
SRC_URI="https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/lucene/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.lucene:lucene-queryparser:7.6.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.lucene:lucene-core:7.6.0 -> >=dev-java/lucene-7.6.0:0
# org.apache.lucene:lucene-queries:7.6.0 -> >=app-maven/lucene-queries-7.6.0:0
# org.apache.lucene:lucene-sandbox:7.6.0 -> >=app-maven/lucene-sandbox-7.6.0:0

CDEPEND="
	>=app-maven/lucene-queries-7.6.0:0
	>=app-maven/lucene-sandbox-7.6.0:0
	>=dev-java/lucene-7.6.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="lucene,lucene-queries,lucene-sandbox"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
