#!/bin/sh

directory=$1

docker run --name ubuntu_flutter -itd --mount type=bind,source="${directory}",target=/app ubuntu_flutter:1
