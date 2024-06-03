HOST=x86_64-w64-mingw32

if [[ "$target_platform" == "win-64" ]]; then
  INSTALL_PREFIX=${PREFIX}/Library/${HOST}/sysroot/usr
else
  INSTALL_PREFIX=${PREFIX}/${HOST}/sysroot/usr
fi

# Need to build gcc_bootstrap_win-64 in order to
# remove this hack, but let's build this package
# first to remove binary re-packaging
conda create -p $SRC_DIR/cf-compilers gcc_impl_win-64 make \
  --yes --quiet -c conda-forge/label/m2w64-experimental -c conda-forge

export PATH=$SRC_DIR/cf-compilers/bin:$PATH

AR=${HOST}-ar

pushd mingw-w64-headers
  touch include/windows.*.h include/wincrypt.h include/prsht.h
popd

./configure \
  --host=${HOST} \
  --disable-lib32 \
  --enable-lib64 \
  --enable-sdk=all \
  --with-default-win32-winnt=0x603 \
  --with-default-msvcrt=ucrt \
  --prefix=${INSTALL_PREFIX} \
  --enable-wildcard \
  --disable-dependency-tracking \
  --enable-idl \
  --without-widl \
  --with-libraries=winpthreads

make -j${CPU_COUNT}

${AR} rcs libssp.a
${AR} rcs libssp_nonshared.a
