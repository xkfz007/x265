#!/bin/bash
# cmake option list:
# BIN_INSTALL_DIR                  bin
# CHECKED_BUILD                    OFF
# CMAKE_BUILD_TYPE                 Release
# CMAKE_INSTALL_PREFIX             /usr/local
# DETAILED_CU_STATS                OFF
# ENABLE_AGGRESSIVE_CHECKS         OFF
# ENABLE_ASSEMBLY                  ON
# ENABLE_CLI                       ON
# ENABLE_LIBNUMA                   ON
# ENABLE_PIC                       ON
# ENABLE_PPA                       OFF
# ENABLE_SHARED                    ON
# ENABLE_TESTS                     OFF
# ENABLE_VTUNE                     OFF
# FSANITIZE
# HIGH_BIT_DEPTH                   OFF
# LIBDL                            /usr/lib/x86_64-linux-gnu/libdl.so
# LIB_INSTALL_DIR                  lib
# NO_ATOMICS                       OFF
# NUMA_ROOT_DIR                    /usr
# STATIC_LINK_CRT                  OFF
# WARNINGS_AS_ERRORS               OFF
# YASM_EXECUTABLE                  /usr/bin/yasm
current_dir=`pwd`
build_dir=$current_dir/builds
if [ ! -e $build_dir ];then
    mkdir -p $build_dir
fi
source_dir=`readlink -f $current_dir/../source`
echo $source_dir
CMD="cmake -G \"Unix Makefiles\" $source_dir -DCMAKE_INSTALL_PREFIX=$build_dir -DENABLE_CLI:bool=on -DENABLE_SHARED:bool=off"
cd $build_dir
echo $CMD
eval $CMD
make && make install
cd -
