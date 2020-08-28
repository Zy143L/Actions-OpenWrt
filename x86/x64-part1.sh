# 添加主题/插件
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/lloyd18/luci-app-npc.git package/luci-app-npc
git clone https://github.com/lloyd18/npc.git package/npc
git clone https://github.com/lloyd18/automount.git package/automount

# 解决冲突
#sed -i 's/dnsmasq-full/dnsmasq/g' package/OpenClash/luci-app-openclash/Makefile
sed -i 's/dnsmasq/dnsmasq-full/g' include/target.mk

# 添加内核
wget https://github.com/vernesong/OpenClash/releases/download/Clash/clash-linux-amd64.tar.gz&&tar -zxvf *.tar.gz
chmod 0755 clash
rm -rf *.tar.gz&&mkdir -p package/base-files/files/etc/openclash/core&&mv clash package/base-files/files/etc/openclash/core
