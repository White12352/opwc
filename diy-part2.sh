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

mkdir -p files/etc/hotplug.d/block && curl -fsSL https://raw.githubusercontent.com/281677160/openwrt-package/usb/block/10-mount > files/etc/hotplug.d/block/10-mount

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon-18.06
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.5/g' package/base-files/files/bin/config_generate

# 把bootstrap替换成argon为源码必选主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],源码内必须有该主题,要不然编译失败）
sed -i "s/bootstrap/argon-18.06/ig" feeds/luci/collections/luci/Makefile
