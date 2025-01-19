sudo apt update
sudo apt upgrade -y
sudo apt install autoconf automake autopoint autotools-dev bindgen binutils binutils-common bison bsdextrautils build-essential bzip2 cpp cpp-13 debhelper debugedit dh-autoreconf dh-strip-nondeterminism diffstat directx-headers-dev dpkg-dev dwz ed file flex g++ g++-13 gcc gcc-13 gcc-13-base gettext gettext-base glslang-tools groff-base icu-devtools intltool-debian libarchive-zip-perl libasan8 libatomic1 libbinutils libbrotli1 libbsd0 libc-dev-bin libc6-dbg libc6-dev libcc1-0 libclc-17 libclc-17-dev libcom-err2 libcrypt-dev libctf-nobfd0 libctf0 libcurl4t64 libdb5.3t64 libdebhelper-perl libdpkg-perl libdrm-common libdrm-dev libdrm2 libdw1t64 libedit2 libelf-dev libelf1t64 libexpat1 libexpat1-dev libffi-dev libfile-stripnondeterminism-perl libgc1 libgcc-13-dev libgdbm-compat4t64 libgdbm6t64 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd-core-dev libglvnd0 libglx-mesa0 libglx0 libgomp1 libgprofng0 libgssapi-krb5-2 libhwasan0 libicu-dev libicu74 libisl23 libitm1 libjansson4 libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap2 libllvm17t64 libllvmspirvlib-17-dev libllvmspirvlib17 liblsan0 libmagic-mgc libmagic1t64 libmpc3 libmpfr6 libncurses-dev libncurses6 libncursesw6 libnghttp2-14 libobjc-13-dev libobjc4 libpciaccess-dev libpciaccess0 libperl5.38t64 libpfm4 libpipeline1 libpkgconf3 libpsl5t64 libpthread-stubs0-dev libpython3-stdlib libpython3.12-minimal libpython3.12-stdlib libquadmath0 libreadline8t64 librtmp1 libsasl2-2 libsasl2-modules-db libsensors-config libsensors-dev libsensors5 libset-scalar-perl libsframe1 libsqlite3-0 libssh-4 libstd-rust-1.75 libstd-rust-dev libstdc++-13-dev libsub-override-perl libtool libtsan2 libubsan1 libuchardet0 libva-dev libva-drm2 libva-glx2 libva-wayland2 libva-x11-2 libva2 libvdpau-dev libvdpau1 libvulkan-dev libvulkan1 libwayland-bin libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl-backend-dev libwayland-egl1 libwayland-server0 libx11-6 libx11-data libx11-dev libx11-xcb-dev libx11-xcb1 libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync1 libxcb-xfixes0 libxcb-xfixes0-dev libxcb1 libxcb1-dev libxdmcp-dev libxdmcp6 libxext-dev libxext6 libxfixes-dev libxfixes3 libxml2 libxml2-dev libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence-dev libxshmfence1 libxxf86vm-dev libxxf86vm1 libyaml-0-2 libz3-4 libz3-dev libzstd-dev linux-libc-dev llvm-17 llvm-17-dev llvm-17-linker-tools llvm-17-runtime llvm-17-tools llvm-spirv-17 lto-disabled-list m4 make man-db media-types meson netbase ninja-build patch perl perl-modules-5.38 pkg-config pkgconf pkgconf-bin po-debconf python3 python3-mako python3-markupsafe python3-minimal python3-pkg-resources python3-ply python3-pygments python3-setuptools python3-yaml python3.12 python3.12-minimal quilt readline-common rpcsvc-proto rustc sensible-utils spirv-tools tzdata valgrind x11proto-dev xorg-sgml-doctools xtrans-dev xz-utils zlib1g-dev
sudo apt install libxcb* -y
sudo apt install xcb* -y
sudo apt install meson ninja-build libarchive-dev tar -y
cd mesa
meson build -Dplatforms=x11 -Dgallium-drivers= -Dfreedreno-kmds=kgsl,msm -Dvulkan-drivers=freedreno -D egl=disabled -D gles2=disabled -D glvnd=disabled -D glx=disabled -D libunwind=disabled -D shared-glapi=disabled -Dshared-llvm=disabled -D microsoft-clc=disabled -D valgrind=disabled -D gles1=disabled
DESTDIR="$PWD/build64/release" ninja -C build install
tar -cvf build64.tar build64
