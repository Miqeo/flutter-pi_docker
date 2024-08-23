FROM ubuntu
VOLUME /projects
WORKDIR /flutter

RUN apt-get update -y
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa
RUN apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev

ADD ./build_app.sh /build_app.sh
ADD ./flutter_linux_3.24.0-stable.tar.xz /flutter_sdk/
RUN git config --global --add safe.directory /flutter_sdk/flutter
ENV PATH="$PATH:/flutter_sdk/flutter/bin"

RUN flutter --disable-analytics
RUN flutter pub global activate flutterpi_tool
ENV PATH="$PATH:/root/.pub-cache/bin"

CMD /bin/sh /build_app.sh