mkdir %PREFIX%\Library\aarch64-w64-mingw32\sysroot\usr
xcopy %SRC_DIR%\binary-%PKG_NAME%\ucrt64 %LIBRARY_PREFIX%\aarch64-w64-mingw32\sysroot\usr /s /e /y
