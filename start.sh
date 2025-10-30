#!/bin/bash

echo "========================================"
echo "   实验室网站 - 开发服务器启动脚本"
echo "========================================"
echo ""

# 检查 node 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ 错误: 未检测到 Node.js"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js 版本: $(node --version)"
echo "✅ npm 版本: $(npm --version)"
echo ""

# 检查是否已安装依赖
if [ ! -d "node_modules" ]; then
    echo "📦 检测到首次运行，正在安装依赖..."
    echo "这可能需要几分钟时间，请耐心等待..."
    echo ""
    npm install
    
    if [ $? -ne 0 ]; then
        echo ""
        echo "❌ 依赖安装失败"
        echo "请尝试: npm cache clean --force && npm install"
        exit 1
    fi
    
    echo ""
    echo "✅ 依赖安装成功！"
    echo ""
fi

echo "🚀 正在启动开发服务器..."
echo ""
echo "提示: 服务器启动后，浏览器会自动打开"
echo "如未自动打开，请手动访问: http://localhost:8080"
echo ""
echo "按 Ctrl+C 可以停止服务器"
echo ""
echo "========================================"
echo ""

npm run dev
