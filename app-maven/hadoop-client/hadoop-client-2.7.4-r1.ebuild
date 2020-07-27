# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-client-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-client/2.7.4/hadoop-client-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-client-2.7.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Client"
HOMEPAGE=""
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-client:2.7.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.hadoop:hadoop-annotations:2.7.4 -> >=app-maven/hadoop-annotations-2.7.4:0
# org.apache.hadoop:hadoop-common:2.7.4 -> >=app-maven/hadoop-common-2.7.4:0
# org.apache.hadoop:hadoop-hdfs:2.7.4 -> >=app-maven/hadoop-hdfs-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-app:2.7.4 -> >=app-maven/hadoop-mapreduce-client-app-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-core:2.7.4 -> >=app-maven/hadoop-mapreduce-client-core-2.7.4:0
# org.apache.hadoop:hadoop-mapreduce-client-jobclient:2.7.4 -> >=app-maven/hadoop-mapreduce-client-jobclient-2.7.4:0
# org.apache.hadoop:hadoop-yarn-api:2.7.4 -> >=app-maven/hadoop-yarn-api-2.7.4:0

CDEPEND="
	>=app-maven/hadoop-annotations-2.7.4:0
	>=app-maven/hadoop-common-2.7.4:0
	>=app-maven/hadoop-hdfs-2.7.4:0
	>=app-maven/hadoop-mapreduce-client-app-2.7.4:0
	>=app-maven/hadoop-mapreduce-client-core-2.7.4:0
	>=app-maven/hadoop-mapreduce-client-jobclient-2.7.4:0
	>=app-maven/hadoop-yarn-api-2.7.4:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hadoop-annotations,hadoop-common,hadoop-hdfs,hadoop-mapreduce-client-app,hadoop-mapreduce-client-core,hadoop-mapreduce-client-jobclient,hadoop-yarn-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
