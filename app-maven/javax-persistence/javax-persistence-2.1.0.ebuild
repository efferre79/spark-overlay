# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.persistence-2.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/persistence/javax.persistence/2.1.0/javax.persistence-2.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-persistence-2.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="EclipseLink build based upon Git transaction 3faac2b"
HOMEPAGE="http://www.eclipse.org/eclipselink"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/persistence/javax.persistence/${PV}/javax.persistence-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:javax.persistence:2.1.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

