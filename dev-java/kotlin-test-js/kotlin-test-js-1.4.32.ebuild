# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jetbrains.kotlin:${PN}:${PV}"

KOTLIN_LIBS_BINJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}.jar"
KOTLIN_LIBS_SRCJAR_SRC_URI="https://repo1.maven.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"

KOTLIN_VERSIONS="=1.4"

inherit kotlin-libs

DESCRIPTION="Kotlin Test for JS"
KEYWORDS="~amd64"

DEPEND="!binary? (
	~dev-java/kotlin-stdlib-js-${PV}:${SLOT}
)"

JAVA_BINJAR_FILENAME="${P}.jar"
KOTLIN_LIBS_SRCJAR_FILENAME="${P}-sources.jar"

# No -module-name option for Kotlin/JS compiler
KOTLIN_MODULE_NAME=""
KOTLIN_LIBS_RUNTIME_COMPONENT="Test"

src_compile() {
	if has binary ${JAVA_PKG_IUSE} && use binary; then
		kotlin-libs_src_compile
		return 0
	fi

	export KOTLIN_COMPILER=org.jetbrains.kotlin.cli.js.K2JSCompiler
	local target="target"
	local src_dirs

	# :kotlin-test:kotlin-test-js
	local main_target="${target}/classes/main"
	KOTLIN_KOTLINC_ARGS=(
		-libraries $(java-pkg_getjars --build-only "kotlin-stdlib-js-${SLOT}")
		-main call
		-meta-info
		-module-kind umd
		-no-stdlib
		-source-map
		-source-map-base-dirs libraries/kotlin.test/js
		-source-map-embed-sources always
		-source-map-prefix ./
		-target v5
		-Xallow-kotlin-package
		-Xmulti-platform
		-Xopt-in=kotlin.RequiresOptIn
		-Xopt-in=kotlin.contracts.ExperimentalContracts
	)
	KOTLIN_COMMON_SOURCES_DIR=(
		libraries/kotlin.test/common/src/main
		libraries/kotlin.test/annotations-common
	)
	src_dirs=(
		libraries/kotlin.test/js/src/main
		libraries/kotlin.test/common/src/main
		libraries/kotlin.test/annotations-common/src/main
	)
	KOTLIN_SRC_DIR+=( "${src_dirs[@]}" )
	kotlin-utils_kotlinc -output "${main_target}/kotlin-test.js" \
		$(find "${src_dirs[@]}" -name "*.kt")

	# :kotlin-test:kotlin-test-js-ir
	local js_ir_target="${target}/classes/js-ir"
	KOTLIN_KOTLINC_ARGS=(
		-libraries $(java-pkg_getjars --build-only "kotlin-stdlib-js-${SLOT}")
		-main call
		-meta-info
		-module-kind umd
		-no-stdlib
		-source-map
		-target v5
		-Xallow-kotlin-package
		-Xallow-result-return-type
		-Xinline-classes
		-Xir-only
		-Xir-produce-klib-dir
		-Xir-module-name=kotlin-test
		-Xmulti-platform
		-Xopt-in=kotlin.RequiresOptIn
		-Xread-deserialized-contracts
		-Xuse-experimental=kotlin.Experimental
		-Xuse-experimental=kotlin.ExperimentalMultiplatform
		-Xuse-experimental=kotlin.contracts.ExperimentalContracts
	)
	src_dirs=(
		libraries/kotlin.test/js/src
		libraries/kotlin.test/common/src
		libraries/kotlin.test/annotations-common/src
	)
	KOTLIN_SRC_DIR+=( "${src_dirs[@]}" )
	kotlin-utils_kotlinc -output "${js_ir_target}/kotlin-stdlib-js-ir.js" \
		$(find "${src_dirs[@]}" -name "*.kt")
	cp -r "${js_ir_target}/default" "${main_target}" || \
		die "Could not copy compiled files for IR to main target directory"

	kotlin-libs_create_manifest "${main_target}"

	jar cfm "${JAVA_JAR_FILENAME}" "${main_target}/META-INF/MANIFEST.MF" \
		-C "${main_target}" . || die "jar failed"

	unset KOTLIN_COMPILER
}
