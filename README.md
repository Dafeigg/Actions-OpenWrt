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

kmods 目录只对生成它的那一版内核有效。重编固件后新目录会覆盖旧的，
旧机器如需装包请保留本地那份 ipk。
