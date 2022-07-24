#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-all
  --enable-zlib           # enable zlib
  --enable-avcodec
  --enable-avformat
  --enable-avfilter
  --enable-swresample
  --enable-swscale
  --enable-decoder=apng,gif
  --enable-encoder=apng,gif
  --enable-demuxer=apng,gif
  --enable-muxer=apng,gif
  --enable-protocol=file
  --enable-filter=scale,format,null

)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
