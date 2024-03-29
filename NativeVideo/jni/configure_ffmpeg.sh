#!/bin/bash
pushd `dirname $0`
. settings.sh

#--extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -mfpu=neon -marm -march=$CPU -mtune=cortex-a8" 

pushd ffmpeg

./configure --enable-cross-compile \
--arch=arm \
--target-os=linux \
--disable-debug \
--disable-stripping \
--enable-pthreads \
--enable-nonfree \
--disable-yasm \
--disable-inline-asm \
--enable-avdevice \
--disable-doc \
--enable-avfilter \
--prefix=../output \
--enable-version3 \
--disable-shared \
--disable-symver \
--enable-static \
--enable-gpl \
--enable-small \
--enable-memalign-hack \
--cc=arm-linux-androideabi-gcc \
--ld=arm-linux-androideabi-gcc \
--extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -DHAVE_CBRT" \
--disable-protocol=rtmp --disable-protocol=rtmps --disable-protocol=rtmpt --disable-protocol=rtmpe --disable-protocol=rtmpte \
--extra-cflags="-Ivideokit" 

sed -i 's/HAVE_LRINT 0/HAVE_LRINT 1/g' config.h
sed -i 's/HAVE_LRINTF 0/HAVE_LRINTF 1/g' config.h
sed -i 's/HAVE_ROUND 0/HAVE_ROUND 1/g' config.h
sed -i 's/HAVE_ROUNDF 0/HAVE_ROUNDF 1/g' config.h
sed -i 's/HAVE_TRUNC 0/HAVE_TRUNC 1/g' config.h
sed -i 's/HAVE_TRUNCF 0/HAVE_TRUNCF 1/g' config.h
sed -i 's/HAVE_ISINF 0/HAVE_ISINF 1/g' config.h
sed -i 's/HAVE_CBRTF 0/HAVE_CBRTF 1/g' config.h
sed -i 's/HAVE_CBRT 0/HAVE_CBRT 1/g' config.h
sed -i 's/HAVE_ISNAN 0/HAVE_ISNAN 1/g' config.h
sed -i 's/HAVE_RINT 0/HAVE_RINT 1/g' config.h



