# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ehcache-2.10.6.pom --download-uri https://repo.maven.apache.org/maven2/net/sf/ehcache/ehcache/2.10.6/ehcache-2.10.6-sources.jar --slot 0 --keywords "~amd64" --ebuild ehcache-2.10.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Ehcache is an open source, standards-based cache used to boost performance,
  offload the database and simplify scalability. Ehcache is robust, proven and full-featured and
  this has made it the most widely-used Java-based cache."
HOMEPAGE="http://ehcache.org"
SRC_URI="https://repo.maven.apache.org/maven2/net/sf/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.sf.ehcache:ehcache:2.10.6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
	dev-java/commons-logging:0
	dev-java/commons-collections:0
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

src_prepare() {
	default
	rm ${S}/module-info.java
}

JAVA_GENTOO_CLASSPATH="slf4j-api,commons-collections,commons-logging"
