#!/bin/bash
PKG="ninvaders"
SRC_NAME="ninvaders"
PKG_NAME="ninvaders"
DEBFULLNAME="Ronald Record"
DEBEMAIL="ronaldrecord@gmail.com"
DESTDIR="usr"
SRC=${HOME}/src
ARCH=amd64
SUDO=sudo
GCI=

dpkg=`type -p dpkg-deb`
[ "${dpkg}" ] || {
    echo "Debian packaging tools do not appear to be installed on this system"
    echo "Are you on the appropriate Linux system with packaging requirements ?"
    echo "Exiting"
    exit 1
}
dpkg_arch=`dpkg --print-architecture`
[ "${dpkg_arch}" == "${ARCH}" ] || ARCH=${dpkg_arch}

[ -f "${SRC}/${SRC_NAME}/VERSION" ] || {
  [ -f "/builds/doctorfree/${SRC_NAME}/VERSION" ] || {
    echo "$SRC/$SRC_NAME/VERSION does not exist. Exiting."
    exit 1
  }
  SRC="/builds/doctorfree"
  GCI=1
# SUDO=
}

. "${SRC}/${SRC_NAME}/VERSION"
PKG_VER=${VERSION}
PKG_REL=${RELEASE}

umask 0022

# Subdirectory in which to create the distribution files
OUT_DIR="dist/${PKG_NAME}_${PKG_VER}"

[ -d "${SRC}/${SRC_NAME}" ] || {
    echo "$SRC/$SRC_NAME does not exist or is not a directory. Exiting."
    exit 1
}

cd "${SRC}/${SRC_NAME}"

# Install required development environment tools
${SUDO} apt -y install build-essential libncurses-dev cmake

# Build ninvaders
./build

${SUDO} rm -rf dist
mkdir dist

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}
mkdir ${OUT_DIR}/DEBIAN
chmod 755 ${OUT_DIR} ${OUT_DIR}/DEBIAN

echo "Package: ${PKG}
Version: ${PKG_VER}-${PKG_REL}
Section: misc
Priority: optional
Architecture: ${ARCH}
Depends: libncurses-dev
Maintainer: ${DEBFULLNAME} <${DEBEMAIL}>
Build-Depends: debhelper (>= 11)
Homepage: https://github.com/doctorfree/ninvaders
Description: Ninvaders NCurses Invaders video game" > ${OUT_DIR}/DEBIAN/control

chmod 644 ${OUT_DIR}/DEBIAN/control

for dir in "${DESTDIR}" \
           "${DESTDIR}/games" "${DESTDIR}/games/bin" \
           "${DESTDIR}/games/lib" "${DESTDIR}/games/lib/ninvaders"
do
    [ -d ${OUT_DIR}/${dir} ] || ${SUDO} mkdir ${OUT_DIR}/${dir}
    ${SUDO} chown root:root ${OUT_DIR}/${dir}
done

# Install ninvaders
${SUDO} chown games ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chgrp games ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chmod 0755 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} touch ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} cp LICENSE ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp README.md ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp VERSION ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp ChangeLog ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chown games ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} chgrp games ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} chmod 0644 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/*

${SUDO} cp cmake_build/ninvaders ${OUT_DIR}/${DESTDIR}/games/bin
${SUDO} chown games ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} chgrp games ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} chmod 04755 ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} ln -r -s ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders ${OUT_DIR}/${DESTDIR}/games/ninvaders
${SUDO} gzip -9 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/ChangeLog

cd dist
echo "Building ${PKG_NAME}_${PKG_VER} Debian package"
${SUDO} dpkg --build ${PKG_NAME}_${PKG_VER} ${PKG_NAME}_${PKG_VER}-${PKG_REL}.${ARCH}.deb
cd ${PKG_NAME}_${PKG_VER}
echo "Creating compressed tar archive of ${PKG_NAME} ${PKG_VER} distribution"
tar cf - usr | gzip -9 > ../${PKG_NAME}_${PKG_VER}-${PKG_REL}.tgz

have_zip=`type -p zip`
[ "${have_zip}" ] || {
  ${SUDO} apt-get update
  ${SUDO} apt-get install zip -y
}
echo "Creating zip archive of ${PKG_NAME} ${PKG_VER} distribution"
zip -q -r ../${PKG_NAME}_${PKG_VER}-${PKG_REL}.zip usr

cd ..
[ "${GCI}" ] || {
    [ -d ../releases ] || mkdir ../releases
    [ -d ../releases/${PKG_VER} ] || mkdir ../releases/${PKG_VER}
    ${SUDO} cp *.deb *.tgz *.zip ../releases/${PKG_VER}
}
