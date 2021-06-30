# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kotlin-libs

KEYWORDS="~amd64"

DEPEND="
	~dev-java/kotlin-stdlib-${PV}:${SLOT}
	dev-java/jetbrains-annotations:13
	>=dev-java/jetbrains-protobuf-lite-2.6.1:0
"

JAVA_CLASSPATH_EXTRA="
	kotlin-stdlib-${SLOT}
	jetbrains-annotations-13
	jetbrains-protobuf-lite
"

KOTLIN_LIBS_MODULE_NAME="metadata"
KOTLIN_LIBS_KOTLINC_ARGS=(
	-jvm-target 1.6
	-no-stdlib
	-Xallow-no-source-files
	-Xjvm-default=compatibility
	-Xno-kotlin-nothing-value-exception
	-Xno-optimized-callable-references
	-Xnormalize-constructor-calls=enable
	-Xopt-in=kotlin.RequiresOptIn
	-Xread-deserialized-contracts
	-Xsuppress-deprecated-jvm-target-warning
	-Xuse-ir
)
KOTLIN_LIBS_JAVA_SOURCE_ROOTS=( core/metadata/src )
KOTLIN_LIBS_SRC_DIR=( core/metadata/src )
