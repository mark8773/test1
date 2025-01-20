echo -e "\nTypes: deb-src\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: jammy jammy-updates jammy-backports\nComponents: main universe restricted multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >> /etc/apt/sources.list.d/ubuntu.sources
apt update
apt upgrade -y
apt install libxcb* -y
apt install xcb* -y
apt install meson ninja-build libarchive-dev tar -y
apt-get build-dep mesa -y
cd mesa
meson build -D platforms=x11 -D gallium-drivers= -D vulkan-drivers=freedreno -D freedreno-kmds=msm,kgsl -D glx=disabled -D egl=disabled -D gles1=disabled -D dri3=enabled -D gles2=disabled -D gallium-xa=disabled -D opengl=false -D shared-glapi=disabled -D b_lto=true -D b_ndebug=true -D cpp_rtti=false -D gbm=disabled -D llvm=disabled -D shared-llvm=disabled -D xmlconfig=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
