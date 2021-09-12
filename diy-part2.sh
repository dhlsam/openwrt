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
#sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate

# 设置密码为空
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

# 网络配置信息，将从 zzz-default-settings 文件的第2行开始添加
sed -i "2i # network config" ./package/lean/default-settings/files/zzz-default-settings
# 默认 IP 地址，旁路由时不会和主路由的 192.168.1.1 冲突
sed -i "3i uci set network.lan.ipaddr='10.10.10.10'" ./package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'" ./package/lean/default-settings/files/zzz-default-settings # 静态 IP
sed -i "5i uci set network.lan.type='bridge'" ./package/lean/default-settings/files/zzz-default-settings  # 接口类型：桥接
sed -i "6i uci set network.lan.ifname='eth0'" ./package/lean/default-settings/files/zzz-default-settings  # 网络端口：默认 eth0，第一个接口
sed -i "7i uci set network.lan.netmask='255.255.255.0'" ./package/lean/default-settings/files/zzz-default-settings    # 子网掩码
sed -i "8i uci set network.lan.gateway='10.10.10.10.11'" ./package/lean/default-settings/files/zzz-default-settings  # 默认网关地址（主路由 IP）
sed -i "9i uci set network.lan.dns='127.0.0.1'" ./package/lean/default-settings/files/zzz-default-settings  # 默认上游 DNS 地址
sed -i "10i uci commit network\n" ./package/lean/default-settings/files/zzz-default-settings

