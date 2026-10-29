# PPLINK7981 专用软件源

本目录由 Actions 自动生成，与 PPLINK7981 固件同批编译，
内核模块的 ABI 与固件完全匹配。

## 使用方法

固件已预置 /etc/opkg/customfeeds.conf，刷完直接可用。
手动添加：

    echo "src/gz pplink_kmods https://raw.githubusercontent.com/Dafeigg/Actions-OpenWrt/ipk-repo/kmods" >> /etc/opkg/customfeeds.conf
    echo "src/gz pplink_packages https://raw.githubusercontent.com/Dafeigg/Actions-OpenWrt/ipk-repo/packages" >> /etc/opkg/customfeeds.conf
    opkg update

## 注意

kmods 目录只对生成它的那一版内核有效（依赖里写死了 kernel ABI 哈希）。
本目录每次重新编译固件都会被覆盖，**固件与源必须同批**。

上一版仓库会自动备份到分支 `ipk-repo-archive`，未刷新固件的机器可改用：

    sed -i 's#/ipk-repo/#/ipk-repo-archive/#g' /etc/opkg/customfeeds.conf
    opkg update

## 国内网络

raw.githubusercontent.com 偶有不通，可换 jsDelivr 镜像：

    sed -i 's#https://raw.githubusercontent.com/\([^/]*\)/\([^/]*\)/ipk-repo#https://cdn.jsdelivr.net/gh/\1/\2@ipk-repo#g' \
      /etc/opkg/customfeeds.conf
    opkg update
