# 🚀 快速开始指南

## 第一次运行项目

### 步骤 1: 进入项目目录
```bash
cd lab-website-vue
```

### 步骤 2: 安装依赖（只需第一次）
```bash
npm install
```

这一步会下载项目所需的所有依赖包（Vue、Vite等），可能需要几分钟。

### 步骤 3: 启动开发服务器
```bash
npm run dev
```

或者

```bash
npm run serve
```

### 步骤 4: 查看网站
浏览器会自动打开，或手动访问：
```
http://localhost:8080
```

---

## 日常开发流程

每次开发时：

```bash
# 1. 进入项目目录
cd lab-website-vue

# 2. 启动开发服务器
npm run dev

# 3. 修改代码后，浏览器会自动刷新
# 4. 开发完成后，按 Ctrl+C 停止服务器
```

---

## 📝 修改网站内容

### 修改主页内容
编辑文件: `src/views/Home.vue`

### 修改成员信息
编辑文件: `src/views/Members.vue`

在 `<script setup>` 部分找到 `advisors`、`postdocs` 等数组，修改其中的数据。

### 修改研究方向和项目
编辑文件: `src/views/Research.vue`

找到 `researchDirections` 数组，可以：
- 添加新的研究方向
- 在每个方向下添加合作项目
- 修改项目链接

### 修改论文列表
编辑文件: `src/views/Publications.vue`

找到 `publications` 数组，添加或修改论文信息。

### 修改招生信息
编辑文件: `src/views/Recruitment.vue`

修改招生类型、申请条件、联系方式等。

### 修改网站样式
编辑文件: `src/assets/style.css`

可以修改颜色、字体、布局等。

---

## 🏗️ 构建生产版本

当你准备好部署网站时：

```bash
# 1. 构建
npm run build

# 2. 构建产物在 dist/ 目录
# 3. 将 dist/ 目录部署到服务器
```

---

## 🌐 部署到公网

### 使用 Vercel（推荐）

```bash
npm install -g vercel
npm run build
vercel --prod
```

### 使用 Netlify

1. 访问 https://www.netlify.com
2. 注册/登录
3. 拖拽 `dist/` 文件夹到网页

---

## ⚠️ 常见问题

### 问题1: npm install 失败

**解决方法:**
```bash
# 清除缓存
npm cache clean --force

# 重试安装
npm install
```

### 问题2: 端口被占用

**解决方法:**

修改 `vite.config.js` 中的端口号：
```javascript
server: {
  port: 3000,  // 改成其他端口
  open: true
}
```

### 问题3: 页面空白

**检查:**
1. 浏览器控制台（F12）是否有错误
2. 开发服务器是否正常运行
3. 是否正确访问了 http://localhost:8080

---

## 📚 学习资源

- Vue 3 官方文档: https://cn.vuejs.org/
- Vite 官方文档: https://cn.vitejs.dev/
- Vue Router 文档: https://router.vuejs.org/zh/

---

## 💡 提示

- 修改代码后无需重启服务器，页面会自动刷新
- 使用浏览器开发者工具（F12）查看控制台错误
- 保存文件前确保代码格式正确

---

**祝开发顺利！** 🎉
