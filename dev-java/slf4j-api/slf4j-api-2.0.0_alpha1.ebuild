# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/slf4j-api-2.0.0-alpha1.pom --download-uri https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/2.0.0-alpha1/slf4j-api-2.0.0-alpha1-sources.jar --slot 0 --keywords "~amd64" --ebuild slf4j-api-2.0.0_alpha1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The slf4j API"
HOMEPAGE="http://www.slf4j.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/slf4j/${PN}/2.0.0-alpha1/${PN}-2.0.0-alpha1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.slf4j:slf4j-api:2.0.0-alpha1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

