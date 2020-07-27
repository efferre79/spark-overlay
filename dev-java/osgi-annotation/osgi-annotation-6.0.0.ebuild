# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.annotation-6.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/org.osgi.annotation/6.0.0/org.osgi.annotation-6.0.0-sources.jar --slot 6 --keywords "~amd64" --ebuild osgi-annotation-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="OSGi Annotation Release 6, Annotations for use in compiling bundles."
HOMEPAGE="http://www.osgi.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/org.osgi.annotation/${PV}/org.osgi.annotation-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="6"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:org.osgi.annotation:6.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
}
