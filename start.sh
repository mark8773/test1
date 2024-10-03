echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar wget git -y
apt-get build-dep mesa -y
git clone https://gitlab.freedesktop.org/mesa/mesa
cd mesa
#git checkout d055edac11cf89e0f326e1761fc6ed44d87981f6
wget -O 1.patch https://github.com/user-attachments/files/17239223/dri3.patch.txt
git apply -v 1.patch
meson setup build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl,msm -Dvulkan-drivers=freedreno -Degl=disabled -Dgles2=disabled -Dglvnd=disabled -Dglx=disabled -Dlibunwind=disabled -Ddri3=enabled -Dshared-glapi=disabled -Dshared-llvm=disabled -Dmicrosoft-clc=disabled -Dvalgrind=disabled -Dgles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
