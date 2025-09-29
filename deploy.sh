#!/bin/bash

# 密码生成器部署脚本
# 适用于 Ubuntu/Debian 系统

echo "🚀 开始部署密码生成器..."

# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装 Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 安装 PM2 进程管理器
sudo npm install -g pm2

# 创建应用目录
sudo mkdir -p /var/www/password-generator
sudo chown -R $USER:$USER /var/www/password-generator

# 进入应用目录
cd /var/www/password-generator

# 复制项目文件（假设已上传）
# 安装依赖
npm install

# 构建应用
npm run build

# 使用 PM2 启动应用
pm2 start npm --name "password-generator" -- start

# 设置 PM2 开机自启
pm2 startup
pm2 save

# 配置 Nginx 反向代理
sudo tee /etc/nginx/sites-available/password-generator << EOF
server {
    listen 80;
    server_name your-domain.com;  # 替换为您的域名

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# 启用站点
sudo ln -s /etc/nginx/sites-available/password-generator /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx

echo "✅ 部署完成！"
echo "🌐 访问地址: http://your-domain.com"
echo "📊 查看状态: pm2 status"
echo "📝 查看日志: pm2 logs password-generator"
