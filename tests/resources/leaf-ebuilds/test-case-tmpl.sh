#!/usr/bin/env bash

EMERGE_OPTS="--color y --verbose --quiet-build"

run_test() {
    emerge -1 sys-apps/pkgcore

    # pquery requires ::gentoo to be defined in repos.conf
    echo "[gentoo]" >> /etc/portage/repos.conf/gentoo.conf
    echo "location = /var/db/repos/gentoo" >> /etc/portage/repos.conf/gentoo.conf

    # Update pre-installed packages with required USE flags and versions
    emerge -1 dev-java/jsr305
    emerge -1 media-libs/freetype

    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
