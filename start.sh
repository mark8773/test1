echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar -y
apt-get build-dep mesa -y
cd mesa
meson build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl,msm -Dvulkan-drivers=freedreno -D egl=disabled -D gles2=disabled -D glvnd=disabled -D glx=disabled -D dri3=enabled -D libunwind=disabled -D shared-glapi=disabled -Dshared-llvm=disabled -D microsoft-clc=disabled -D valgrind=disabled -D gles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
