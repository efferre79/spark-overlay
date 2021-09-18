# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dependency-check-core-4.0.2.pom --download-uri https://repo1.maven.org/maven2/org/owasp/dependency-check-core/4.0.2/dependency-check-core-4.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild dependency-check-core-4.0.2-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.owasp:dependency-check-core:4.0.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Identify and report publicly disclosed vulnerabilities in project's dependencies"
HOMEPAGE="https://github.com/jeremylong/DependencyCheck.git/dependency-check-core"
SRC_URI="
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.1u2 -> >=dev-java/findbugs-annotations-3.0.12:3
# com.google.code.gson:gson:2.8.5 -> >=dev-java/gson-2.8.7:2.6
# com.google.guava:guava:27.0.1-jre -> >=dev-java/guava-29.0:0
# com.h3xstream.retirejs:retirejs-core:3.0.1 -> >=dev-java/retirejs-core-3.0.1:0
# com.sun.mail:mailapi:1.6.3 -> >=dev-java/mailapi-1.6.3:0
# com.vdurmont:semver4j:2.2.0 -> >=dev-java/semver4j-2.2.0:0
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:0
# commons-io:commons-io:2.6 -> >=dev-java/commons-io-2.6:1
# joda-time:joda-time:1.6 -> >=dev-java/joda-time-2.7:0
# org.apache.commons:commons-compress:1.18 -> >=dev-java/commons-compress-1.20:0
# org.apache.commons:commons-text:1.3 -> >=dev-java/commons-text-1.6:0
# org.apache.lucene:lucene-analyzers-common:7.6.0 -> >=dev-java/lucene-analyzers-common-7.6.0:0
# org.apache.lucene:lucene-core:7.6.0 -> >=dev-java/lucene-7.6.0:0
# org.apache.lucene:lucene-queryparser:7.6.0 -> >=dev-java/lucene-queryparser-7.6.0:0
# org.glassfish:javax.json:1.0.4 -> >=dev-java/javax-json-1.0.4:0
# org.jsoup:jsoup:1.11.3 -> >=dev-java/jsoup-1.11.3:0
# org.owasp:dependency-check-utils:4.0.2 -> >=dev-java/dependency-check-utils-4.0.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

# Additional dependencies:
# org.apache.commons.lang -> dev-java/commons-lang:2.1
# org.apache.velocity:velocity:1.7 -> dev-java/velocity:1.7

CDEPEND="
	>=dev-java/commons-text-1.6:0
	>=dev-java/dependency-check-utils-4.0.2:0
	>=dev-java/javax-json-1.0.4:0
	>=dev-java/lucene-analyzers-common-7.6.0:0
	>=dev-java/lucene-queryparser-7.6.0:0
	>=dev-java/mailapi-1.6.3:0
	>=dev-java/retirejs-core-3.0.1:0
	>=dev-java/semver4j-2.2.0:0
	>=dev-java/commons-collections-3.2.2:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-io-2.6:1
	>=dev-java/findbugs-annotations-3.0.12:3
	>=dev-java/gson-2.8.7:2.6
	>=dev-java/guava-29.0:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/jsoup-1.11.3:0
	>=dev-java/lucene-7.6.0:0
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/commons-lang:2.1
	dev-java/velocity:1.7
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.h2database:h2:1.4.196 -> >=dev-java/h2-1.4.196:0
RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	>=dev-java/h2-1.4.196:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="findbugs-annotations-3,gson-2.6,guava,retirejs-core,mailapi,semver4j,commons-collections,commons-io-1,joda-time,commons-compress,commons-text,lucene-analyzers-common,lucene,lucene-queryparser,velocity-1.7,javax-json,jsoup,dependency-check-utils,slf4j-api,h2,commons-lang-2.1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"