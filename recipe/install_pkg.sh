HOST=aarch64-w64-mingw32
INSTALL_PREFIX=${PREFIX}/Library/${HOST}/sysroot/usr

mkdir -p ${INSTALL_PREFIX}
cp -R ${SRC_DIR}/binary-${PKG_NAME}/clangarm64/* ${INSTALL_PREFIX}/
