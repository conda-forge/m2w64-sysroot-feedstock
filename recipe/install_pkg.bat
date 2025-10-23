mkdir %PREFIX%\Library\ucrt64
mkdir %PREFIX%\Library\x86_64-w64-mingw32\sysroot\usr
xcopy %SRC_DIR%\binary-%PKG_NAME%\ucrt64 %LIBRARY_PREFIX%\ucrt64 /s /e /y
xcopy %SRC_DIR%\binary-%PKG_NAME%\ucrt64 %LIBRARY_PREFIX%\x86_64-w64-mingw32\sysroot\usr /s /e /y
