# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/annotations-3.0.1u2.pom --download-uri https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1u2/annotations-3.0.1u2-sources.jar --slot 3 --keywords "~amd64" --ebuild findbugs-annotation-3.0.12.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Annotation the FindBugs tool supports"
HOMEPAGE="http://findbugs.sourceforge.net/"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/code/findbugs/annotations/3.0.1u2/annotations-3.0.1u2-sources.jar"
LICENSE=""
SLOT="3"
KEYWORDS="~amd64"
MAVEN_ID="com.google.code.findbugs:annotations:3.0.1u2"
MAVEN_PROVIDE="findbugs:annotations:1.0.0 net.sourceforge.findbugs:annotations:1.3.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/annotations-3.0.1u2.pom
# com.google.code.findbugs:jsr305:3.0.1 -> >=dev-java/jsr305-3.0.1:0
# net.jcip:jcip-annotations:1.0 -> >=dev-java/jcip-annotations-1.0.1:0

CDEPEND="
	>=dev-java/jcip-annotations-1.0.1:0
	>=dev-java/jsr305-3.0.1:0
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

JAVA_GENTOO_CLASSPATH="jsr305,jcip-annotations"
