# --- Stage 1: QEMU for ARM emulation -----------------------------------------
FROM multiarch/qemu-user-static:latest AS qemu

# --- Stage 2: ARM64 Debian Base ----------------------------------------------
FROM --platform=linux/arm64 arm64v8/debian:bookworm

# Copy QEMU binary into ARM64 container so x86 machine can run ARM
COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin/

# Install system dependencies for Flutter
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip \
    libglu1-mesa libgtk-3-dev \
    clang cmake ninja-build pkg-config \
    liblzma-dev \
    && apt-get clean

# Install Flutter (ARM64)
RUN git clone https://github.com/flutter/flutter.git -b stable /opt/flutter

# Add Flutter + Dart to PATH
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-cache Linux desktop + ARM artifacts
RUN flutter config --enable-linux-desktop && \
    flutter precache --linux --linux-arm64

# Show version for debugging
RUN flutter --version

RUN git config --global --add safe.directory /app

