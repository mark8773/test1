echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar wget git -y
apt-get build-dep mesa -y
git clone https://gitlab.freedesktop.org/mesa/mesa
cd mesa
git checkout cb7f816fc4ba1f5958429a90e541870cb730a6fd
wget -O 1.patch https://github.com/alexvorxx/Zink-Mesa-Xlib/releases/download/v0.0.7/04-wsi-termux-x11-only-kgsl_fix2.patch
git apply -v 1.patch
meson setup build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl -Dvulkan-drivers=freedreno -Ddri3=enabled -Degl=disabled -Dgles2=disabled -Dglvnd=disabled -Dglx=disabled -Dlibunwind=disabled -Dshared-glapi=disabled -Dshared-llvm=disabled -Dmicrosoft-clc=disabled -Dvalgrind=disabled -Dgles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
