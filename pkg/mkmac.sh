#!/bin/bash
PKG="ninvaders"
SRC_NAME="ninvaders"
PKG_NAME="ninvaders"
DESTDIR="usr/local"
SRC=${HOME}/src
SUDO=sudo
GCI=

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

./build

${SUDO} rm -rf dist
mkdir dist

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}
chmod 755 ${OUT_DIR}

for dir in "usr" "${DESTDIR}" \
           "${DESTDIR}/games" "${DESTDIR}/games/bin" \
           "${DESTDIR}/games/lib" "${DESTDIR}/games/lib/ninvaders"
do
    [ -d ${OUT_DIR}/${dir} ] || ${SUDO} mkdir ${OUT_DIR}/${dir}
    ${SUDO} chown root:wheel ${OUT_DIR}/${dir}
done

# Install ninvaders
${SUDO} chown root ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chgrp wheel ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chmod 0775 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} touch ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} cp LICENSE ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp README.md ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp VERSION ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} cp ChangeLog ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders
${SUDO} chown root ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} chgrp wheel ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/highscore
${SUDO} chmod 0664 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/*

${SUDO} cp cmake_build/ninvaders ${OUT_DIR}/${DESTDIR}/games/bin
${SUDO} chown root ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} chgrp wheel ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} chmod 02755 ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders
${SUDO} ln -r -s ${OUT_DIR}/${DESTDIR}/games/bin/ninvaders ${OUT_DIR}/${DESTDIR}/games/ninvaders
${SUDO} gzip -9 ${OUT_DIR}/${DESTDIR}/games/lib/ninvaders/ChangeLog

cd dist
echo "Building ${PKG_NAME}_${PKG_VER} Darwin package"
cd ${PKG_NAME}_${PKG_VER}
echo "Creating compressed tar archive of ${PKG_NAME} ${PKG_VER} distribution"
tar cf - ${DESTDIR}/*/* | gzip -9 > ../${PKG_NAME}_${PKG_VER}-${PKG_REL}.Darwin.tgz

echo "Creating zip archive of ${PKG_NAME} ${PKG_VER} distribution"
zip -q -r ../${PKG_NAME}_${PKG_VER}-${PKG_REL}.zip ${DESTDIR}/*/*

cd ..
[ "${GCI}" ] || {
    [ -d ../releases ] || mkdir ../releases
    [ -d ../releases/${PKG_VER} ] || mkdir ../releases/${PKG_VER}
    ${SUDO} cp *.tgz *.zip ../releases/${PKG_VER}
}
