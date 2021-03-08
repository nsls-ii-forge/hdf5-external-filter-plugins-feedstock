mkdir build
cd build
cmake ^
  .. ^
  -DENABLE_BITSHUFFLE_PLUGIN=no ^
  -DENABLE_LZ4_PLUGIN=yes ^
  -DENABLE_BZIP2_PLUGIN=no ^
  -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
  -G"Visual Studio %VS_MAJOR% %VS_YEAR% Win64" || exit /b 1
cmake --build . --target INSTALL || exit /b 1

mkdir %PREFIX%\lib\hdf5\plugin
copy %PREFIX%\lib\plugins\h5lz4.dll %PREFIX%\lib\hdf5\plugin || exit /b 1
