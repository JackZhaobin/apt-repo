#!/bin/bash
# 快速安装脚本 - 适合通过 curl 执行

# 检查 root 权限
[ "$EUID" -ne 0 ] && echo "需要 root 权限，请使用: curl -sSL <URL> | sudo bash" && exit 1

echo "🚀 正在安装 ros-log-cleanup..."

# 添加仓库源
echo 'deb https://JackZhaobin.github.io/apt-repo/ stable main' | tee /etc/apt/sources.list.d/ros-log-cleanup.list >/dev/null

# 下载并导入 GPG 密钥
wget -qO- https://jackzhaobin.github.io/apt-repo/repo-public.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/github-apt-repo.gpg

# 更新并安装
apt update -qq && apt install ros-log-cleanup -y -qq

echo "✅ 安装完成！ros-log-cleanup 已就绪"
