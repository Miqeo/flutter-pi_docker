#!/bin/sh

cd /app
flutter pub get
flutterpi_tool build --cpu=pi3 --release