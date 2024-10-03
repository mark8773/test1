sudo bash -c 'echo "
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy main restricted
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-updates main restricted
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy universe
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-updates universe
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy multiverse
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-updates multiverse
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-backports main restricted universe multiverse
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-security main restricted
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-security universe
deb-src mirror+file:/etc/apt/apt-mirrors.txt jammy-security multiverse
" >> /etc/apt/sources.list'
sudo apt update
sudo apt upgrade -y
sudo apt install libxcb* -y
sudo apt install xcb* -y
sudo apt install meson ninja-build libarchive-dev tar git -y
sudo apt-get build-dep mesa -y
wget -b winlator_wsi-termux-x11 https://gitlab.freedesktop.org/Pipetto-crypto/mesa
cd mesa
meson build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl -Dvulkan-drivers=freedreno -D dri3=enabled -D egl=disabled -D gles2=disabled -D glvnd=disabled -D glx=disabled -D libunwind=disabled -D shared-glapi=disabled -Dshared-llvm=disabled -D microsoft-clc=disabled -D valgrind=disabled -D gles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
