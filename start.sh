echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar wget git -y
apt-get build-dep mesa -y
git clone https://gitlab.freedesktop.org/mesa/mesa
cd mesa
git checkout ed2ec808b1a581cbe875a18e4a3a44e0dcbd26c0
wget -O 1.patch https://raw.githubusercontent.com/MastaG/mesa-turnip-ppa/e31c35e9c46e510c2445c884da194c51f4eb2abe/turnip-patches/dri3.patch
git apply -v 1.patch
meson setup build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl,msm -Dvulkan-drivers=freedreno -Ddri3=enabled -Degl=disabled -Dgles2=disabled -Db_lto=true -Dcpp_rtti=false -Dglvnd=disabled -Dglx=disabled -Dlibunwind=disabled -Dshared-glapi=disabled -Dshared-llvm=disabled -Dmicrosoft-clc=disabled -Dvalgrind=disabled -Dgles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
