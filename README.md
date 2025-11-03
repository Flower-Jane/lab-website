# 实验室课题组网站 - Vue3项目

基于Vue 3 + Vite的现代化实验室课题组网站，采用模块化设计，易于维护和扩展。

## ✨ 特性

- ⚡️ Vue 3 + Vite - 快速的开发体验
- 🎨 响应式设计 - 支持各种设备
- 📦 模块化组件 - 易于维护
- 🎯 Vue Router 4 - 流畅的页面切换
- 🔥 热重载 - 开发时即时更新

## 📋 项目结构

```
lab-website-vue/
├── index.html                 # 入口HTML
├── package.json              # 项目配置和依赖
├── vite.config.js            # Vite配置
├── src/
│   ├── main.js              # 应用入口
│   ├── App.vue              # 根组件
│   ├── router/
│   │   └── index.js         # 路由配置
│   ├── views/               # 页面组件
│   │   ├── Home.vue         # 主页
│   │   ├── Members.vue      # 成员介绍
│   │   ├── Research.vue     # 研究方向
│   │   ├── Publications.vue # 发表论文
│   │   └── Recruitment.vue  # 实验室招生
│   └── assets/
│       └── style.css        # 全局样式
└── README.md                # 项目说明
```

## 🚀 快速开始

### 1. 安装依赖

```bash
npm install
```

### 2. 启动开发服务器

```bash
npm run dev
# 或
npm run serve
```

项目将在 `http://localhost:8080` 运行

### 3. 构建生产版本

```bash
npm run build
```

构建产物将输出到 `dist/` 目录

### 4. 预览生产构建

```bash
npm run preview
```

## 📝 自定义内容

### 修改成员信息

编辑 `src/views/Members.vue`，找到 `<script setup>` 部分：

```javascript
const advisors = ref([
  {
    id: 1,
    name: '你的名字',
    title: '你的职称',
    // ...
  }
])
```

### 修改研究方向

编辑 `src/views/Research.vue`，修改 `researchDirections` 数组：

```javascript
const researchDirections = ref([
  {
    icon: '🤖',
    title: '你的研究方向',
    description: '详细描述',
    projects: [
      // 项目列表
    ]
  }
])
```

### 修改论文列表

编辑 `src/views/Publications.vue`，修改 `publications` 数组。

### 修改招生信息

编辑 `src/views/Recruitment.vue`，修改相应的数据数组。

### 修改全局样式

编辑 `src/assets/style.css` 来修改网站的整体风格。

## 🎨 主题定制

主要颜色定义在 `src/assets/style.css` 中：

```css
/* 主题色 */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* 修改为你喜欢的颜色 */
background: linear-gradient(135deg, #你的颜色1 0%, #你的颜色2 100%);
```

## 📦 技术栈

- **Vue 3** - 渐进式JavaScript框架
- **Vite** - 下一代前端构建工具
- **Vue Router 4** - 官方路由管理器
- **CSS3** - 现代CSS特性

## 🌐 部署

### 部署到Vercel

```bash
npm run build
npx vercel --prod
```

### 部署到Netlify

1. 运行 `npm run build`
2. 将 `dist/` 目录上传到 Netlify

### 部署到GitHub Pages

```bash
npm run build
# 将 dist/ 目录的内容推送到 gh-pages 分支
```

## 🔧 开发建议

### 添加新页面

1. 在 `src/views/` 创建新的 `.vue` 文件
2. 在 `src/router/index.js` 添加路由
3. 在 `src/App.vue` 的导航栏添加链接

### 组件通信

使用 Vue 3 的 Composition API：

```vue
<script setup>
import { ref, computed } from 'vue'

const data = ref([])
const filteredData = computed(() => {
  // 计算逻辑
})
</script>
```

## 📱 响应式断点

- 桌面: > 768px
- 平板/手机: ≤ 768px

## 🐛 常见问题

### 端口被占用

修改 `vite.config.js` 中的端口：

```javascript
server: {
  port: 3000, // 改成你想要的端口
  open: true
}
```

### 构建失败

清除依赖重新安装：

```bash
rm -rf node_modules
rm package-lock.json
npm install
```

## 📄 许可证

MIT License

## 📮 联系方式

如有问题，请联系: lab@university.edu

