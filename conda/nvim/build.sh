#!/bin/bash

export LIBTOOL=${BUILD_PREFIX}/bin/libtool
export LIBTOOLIZE=${BUILD_PREFIX}/bin/libtoolize

make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="\
    -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
    -DLIBLUV_INCLUDE_DIR=${BUILD_PREFIX}/include -DLIBLUV_LIBRARY=${BUILD_PREFIX}/lib \
    -DLIBLUV_INCLUDE_DIR=${BUILD_PREFIX}/include -DLIBLUV_LIBRARY=${BUILD_PREFIX}/lib \
    -DMSGPACK_INCLUDE_DIR=${BUILD_PREFIX}/include -DMSGPACK_LIBRARY=${BUILD_PREFIX}/lib \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    " \
    DEPS_CMAKE_FLAGS="\
    -DUSE_BUNDLED_LUV=0 \
    -DUSE_BUNDLED_MSGPACK=0 \
    -DUSE_BUNDLED_MSGPACK=0 \
    -DUSE_BUNDLED_GPERF=0 \
    -DUSE_BUNDLED_LUAJIT=0 \
    -DUSE_BUNDLED_LUAROCKS=0 \
    " \
    MACOSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET}

make install
