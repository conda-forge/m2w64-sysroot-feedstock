HOST=x86_64-w64-mingw32
INSTALL_PREFIX=${PREFIX}/Library/${HOST}/sysroot/usr

mkdir -p ${INSTALL_PREFIX}
cp -R ${SRC_DIR}/binary-${PKG_NAME}/ucrt64/* ${INSTALL_PREFIX}/

mkdir -p ${PREFIX}/Library/ucrt64
cp -R ${SRC_DIR}/binary-${PKG_NAME}/ucrt64/* ${PREFIX}/Library/ucrt64/
