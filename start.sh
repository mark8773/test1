echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar wget git -y
apt-get build-dep mesa -y
git clone -b winlator_wsi-termux-x11 https://gitlab.freedesktop.org/Pipetto-crypto/mesa
cd mesa
wget -O 1.patch https://gitlab.freedesktop.org/Pipetto-crypto/mesa/-/commit/9575886914d4a4ca09694c42e261f568ee8575d7.patch
wget -O 2.patch https://gitlab.freedesktop.org/Pipetto-crypto/mesa/-/commit/d264c66f9950cb2331c22c21172a07520fb38c68.patch
wget -O 3.patch https://gitlab.freedesktop.org/Pipetto-crypto/mesa/-/commit/96c4cb07b2a52124021c807f2c1ad4ab1f1cbf9c.patch
git apply -v 1.patch
git apply -v 2.patch
git apply -v 3.patch
exit
meson build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl -Dvulkan-drivers=freedreno -D egl=disabled -D gles2=disabled -D glvnd=disabled -D glx=disabled -D libunwind=disabled -D shared-glapi=disabled -Dshared-llvm=disabled -D microsoft-clc=disabled -D valgrind=disabled -D gles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
