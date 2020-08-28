# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
EOF

# 固件分区
cat >> .config <<EOF
CONFIG_TARGET_KERNEL_PARTSIZE=16
CONFIG_TARGET_ROOTFS_PARTSIZE=300
EOF

# 取消生成EXT4固件
cat >> .config <<EOF
# CONFIG_TARGET_ROOTFS_EXT4FS is not set
EOF

# 专利授权
cat >> .config <<EOF
CONFIG_BUILD_PATENTED=y
EOF

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_cfdisk=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_kmod-tun=y
EOF

# USB
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
EOF

# FFmpeg
cat >> .config <<EOF
CONFIG_PACKAGE_libopus=y
CONFIG_PACKAGE_libx264=y
CONFIG_PACKAGE_ffmpeg=y
CONFIG_PACKAGE_ffprobe=y
EOF

# Docker
cat >> .config <<EOF
CONFIG_PACKAGE_docker-ce=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_RES_SHAPE=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_STO_EXT4=y
EOF

# 界面语言
cat >> .config <<EOF
CONFIG_LUCI_LANG_zh_Hans=y
EOF

# 常用软件
cat >> .config <<EOF
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-npc=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-qos=y
EOF

# 管理地址
sed -i 's/192.168.1.1/10.1.1.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 其它
sed -i '80c msgstr "额外调整"' package/feeds/luci/luci-app-samba4/po/zh_Hans/samba4.po
sed -i '91c msgstr "启用一些社区驱动的调整参数，这可能会改善 WiFi 下文件的传输速度，如果有多个客户端，则不建议启用。"' package/feeds/luci/luci-app-samba4/po/zh_Hans/samba4.po
sed -i 's/启用 macOS 兼容共享/macOS 兼容共享/g' package/feeds/luci/luci-app-samba4/po/zh_Hans/samba4.po
sed -i 's/Shadowsocks、//g' package/OpenClash/luci-app-openclash/i18n/zh-cn/openclash.zh-cn.po
sed -i 's/ShadowsocksR/Shadowsocks(R)/g' package/OpenClash/luci-app-openclash/i18n/zh-cn/openclash.zh-cn.po
sed -i 's/注册表镜像/镜像仓库/g' feeds/luci/applications/luci-app-dockerman/po/zh_Hans/dockerman.po
sed -i '23,25d' package/luci-theme-argon/luasrc/view/themes/argon/footer.htm
