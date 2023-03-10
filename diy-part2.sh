#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#Remove Old Version of passwall
rm -rf package/feeds/luci/luci-app-passwall
#Download lateast version luci-app-passwall & package
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone -b luci https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
mv package/luci-app-passwall/luci-app-passwall/* package/luci-app-passwall/ && rm -rf package/luci-app-passwall/luci-app-passwall
#Add new luci-app-openclash
git clone --depth 1 https://github.com/vernesong/OpenClash.git /tmp/OpenClash
mv /tmp/OpenClash/luci-app-openclash package/
#Remove Homeproxy. it need firewall4 to install.
#git clone https://github.com/immortalwrt/homeproxy.git package/homeproxy
