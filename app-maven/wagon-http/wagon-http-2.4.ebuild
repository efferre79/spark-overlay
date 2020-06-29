# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/wagon-http-2.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/maven/wagon/wagon-http/2.4/wagon-http-2.4-sources.jar --slot 0 --keywords "~amd64" --ebuild wagon-http-2.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Wagon that gets and puts artifacts through http using Apache httpclient-4.x."
HOMEPAGE="http://maven.apache.org/wagon/wagon-providers/wagon-http"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/maven/wagon/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven.wagon:wagon-http:2.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.httpcomponents:httpclient:4.2.3 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.apache.httpcomponents:httpcore:4.2.3 -> >=dev-java/httpcomponents-core-4.4.1:4.4
# org.apache.maven.wagon:wagon-http-shared4:2.4 -> >=app-maven/wagon-http-shared4-2.4:0
# org.apache.maven.wagon:wagon-provider-api:2.4 -> >=app-maven/wagon-provider-api-2.4:0

CDEPEND="
	>=app-maven/wagon-http-shared4-2.4:0
	>=app-maven/wagon-provider-api-2.4:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/httpcomponents-core-4.4.1:4.4
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="httpcomponents-client-4.5,httpcomponents-core-4.4,wagon-http-shared4,wagon-provider-api"
