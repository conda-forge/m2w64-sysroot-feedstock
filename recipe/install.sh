HOST=x86_64-w64-mingw32
if [[ "$target_platform" == "win-64" ]]; then
  INSTALL_PREFIX=${PREFIX}/Library/${HOST}/sysroot/usr
else
  INSTALL_PREFIX=${PREFIX}/${HOST}/sysroot/usr
fi

make install-strip

mkdir -p ${INSTALL_PREFIX}/lib
cp libssp*.a ${INSTALL_PREFIX}/lib/

if [[ "$PKG_NAME" == *-headers-* ]]; then
  rm ${INSTALL_PREFIX}/include/pthread*.h
  rm ${INSTALL_PREFIX}/include/semaphore.h
  rm ${INSTALL_PREFIX}/include/sched.h
  rm ${INSTALL_PREFIX}/include/*.c
elif [[ "$PKG_NAME" == *-crt-* ]]; then
  rm ${INSTALL_PREFIX}/lib/lib*pthread*.a
else
  mkdir -p ${PREFIX}/Library/include
  mkdir -p ${PREFIX}/Library/lib
  cp ${INSTALL_PREFIX}/lib/lib*pthread*.a ${PREFIX}/Library/lib/
  cp ${INSTALL_PREFIX}/lib/pthread*.h ${PREFIX}/Library/include/
  cp ${INSTALL_PREFIX}/lib/semaphore.h ${PREFIX}/Library/include/
  cp ${INSTALL_PREFIX}/lib/sched.h ${PREFIX}/Library/include/
fi

mkdir -p ${PREFIX}/Library/bin
cp ${INSTALL_PREFIX}/bin/libwinpthread-1.dll ${PREFIX}/Library/bin/
