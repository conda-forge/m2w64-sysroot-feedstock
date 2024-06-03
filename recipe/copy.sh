# Temporary hacks. Remove after bootstrapping is done

HOST=x86_64-w64-mingw32
export PATH=$SRC_DIR/cf-compilers/bin:$PATH

if [[ "$target_platform" == "win-64" ]]; then
  INSTALL_PREFIX=${PREFIX}/Library/${HOST}/sysroot/usr
  make install-strip
  mkdir -p ${INSTALL_PREFIX}/lib
  cp libssp*.a ${INSTALL_PREFIX}/lib/
  cp -r ${INSTALL_PREFIX} $PREFIX/Library/ucrt64
else
  mkdir -p ${PREFIX}/${HOST}/sysroot
  ln -sf ${PREFIX}/${HOST}/sysroot/usr ${PREFIX}/${HOST}/sysroot/ucrt64
fi
