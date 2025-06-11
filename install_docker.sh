#!/bin/bash
set -e

USERNAME="vscode"

# 检查/创建 vscode 用户
if ! id -u "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME does not exist, creating..."
  useradd -m -s /bin/bash $USERNAME
fi

# 安装依赖
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release sudo

# 配置 Docker 官方仓库
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

apt-get update

# 安装 Docker Engine
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 启动并设置 Docker 自启
systemctl enable docker
systemctl start docker

# 创建 docker 组（如果不存在），并将 vscode 用户加入
groupadd -f docker
usermod -aG docker $USERNAME

echo
echo "Docker 安装完成，用户 $USERNAME 已加入 docker 组。"
echo "请重新登录或执行 'newgrp docker' 以使 docker 组权限生效。"
echo "如需切换到 vscode 用户，请执行：su - vscode"
echo "验证 docker 安装：docker run hello-world"
