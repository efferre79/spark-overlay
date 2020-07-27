# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-collections4-4.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-collections4-4.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN}4

DESCRIPTION="The Apache Commons Collections package contains types that extend and augment the Java Collections Framework."
HOMEPAGE="https://commons.apache.org/proper/commons-collections/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="4"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-collections4:4.4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q -o "${DISTDIR}"/${P}.jar -d "${S}"/${JAVA_SRC_DIR} || die

	mkdir -p "${S}"/${JAVA_RESOURCE_DIRS[0]}
	find "${S}"/${JAVA_SRC_DIR} -type f ! -name \*.java -exec mv {} "${S}"/${JAVA_RESOURCE_DIRS[0]} \;|| die
}
