sudo cat /etc/apt/sources.list
exit
sudo echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
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
