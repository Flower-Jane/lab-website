<template>
  <div class="members">
    <h1 class="page-title">团队成员</h1>

    <section class="section">
      <h2 class="section-title">🎓 导师团队</h2>
      <div class="grid grid-full">
        <div v-for="advisor in advisors" :key="advisor.id" class="card">
          <div class="card-content">
            <div class="avatar avatar-large">
              <img
                v-if="advisor.avatar.includes('/')"
                :src="getAvatarUrl(advisor.avatar)" :alt="advisor.name"
                class="avatar-image"
              />
              <span v-else>{{ advisor.avatar }}</span>
            </div>
            <div class="info">
              <h3 class="name">{{ advisor.name }}</h3>
              <p class="title">{{ advisor.title }}</p>
              <!-- <p class="detail"><strong>研究方向:</strong> {{ advisor.research }}</p> -->
              <p class="detail"><strong>个人邮箱: </strong> {{ advisor.email }}</p>
              <p class="detail">
                <strong>个人主页: </strong> 
                <a :href="advisor.web" target="_blank" class="plain-link">{{ advisor.web }}</a>
              </p>
              <p class="detail">
                <strong>学术主页: </strong> 
                <a :href="advisor.scholar" target="_blank" class="plain-link">{{ advisor.scholar }}</a>
              </p>
              <p class="bio">{{ advisor.bio }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section">
      <h2 class="section-title">🎓 博士研究生</h2>
      <div class="grid">
        <div v-for="phd in phdStudents" :key="phd.id" class="card card-small">
          <div class="card-content">
            <div class="avatar avatar-small">
              <img
                v-if="phd.avatar.includes('/')"
                :src="getAvatarUrl(phd.avatar)" :alt="phd.name"
                class="avatar-image"
              />
              <span v-else>{{ phd.avatar }}</span>
            </div>
            <div class="info">
              <h3 class="name">{{ phd.name }}</h3>
              <p class="year">{{ phd.year }} 级</p>
              <p class="detail"><strong>研究方向:</strong> {{ phd.research }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section">
      <h2 class="section-title">📚 硕士研究生</h2>
      <div class="grid">
        <div v-for="master in masterStudents" :key="master.id" class="card card-small">
          <div class="card-content">
            <div class="avatar avatar-small">
              <img
                v-if="master.avatar.includes('/')"
                :src="getAvatarUrl(master.avatar)" :alt="master.name"
                class="avatar-image"
              />
              <span v-else>{{ master.avatar }}</span>
            </div>
            <div class="info">
              <h3 class="name">{{ master.name }}</h3>
              <p class="year">{{ master.year }} 级</p>
              <p class="detail"><strong>研究方向:</strong> {{ master.research }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// === 逻辑修改：添加这个辅助函数 ===
// 它使用 Vite 的特性来正确解析 src/assets/ 中的动态路径
function getAvatarUrl(path) {
  return new URL(path, import.meta.url).href
}

// === 数据修改：更新所有路径 ===
//
// 注意：这里的 '../assets/avatars/' 是一个相对路径。
// 我假设你的 members.vue 文件在 'src/views/' 或 'src/pages/' 这样的文件夹里。
// 如果你的 .vue 文件就在 src/ 根目录，路径应该是 './assets/avatars/...'
//
const advisors = ref([
  {
    id: 1,
    name: '陈岑',
    title: '副教授、博士生导师',
    avatar: '../assets/avatars/cc.png', // <-- 修改
    research: '数据挖掘、隐私保护机器学习、NLP应用等',
    email: ' cenchen@dase.ecnu.edu.cn',
    web: 'https://sites.google.com/site/chencenpersonalwebsite/',
    scholar: 'https://scholar.google.com.sg/citations?hl=en&user=3Mn4S9UAAAAJ',
    bio: '研究专注于可信大型语言模型（LLMs）、隐私与人工智能安全以及生成式人工智能（AIGC）等领域，发表论文100余篇，申请40余项专利，主持多项科研项目，并与阿里巴巴、蚂蚁集团、滴滴、字节跳动等企业建立了合作关系。'
  }
])

const phdStudents = ref([
  { id: 1, name: '周天辰', avatar: '../assets/avatars/ztc.png', year: '2022', research: 'LLMAgent、LLM强化学习' }, // <-- 修改
  { id: 2, name: '范洺源', avatar: '../assets/avatars/fmy.jpg', year: '2023', research: '可信人工智能' }, // <-- 修改
  { id: 3, name: '崔锦铭', avatar: '../assets/avatars/cjm.png', year: '2023', research: '生成对抗网络' }, // <-- 修改
  { id: 4, name: '周逸', avatar: '../assets/avatars/zy.png', year: '2025', research: '隐私计算' } // <-- 修改 (注意你之前有2个 id: 3)
])

const masterStudents = ref([
  { id: 1, name: '曾玺睿', avatar: '../assets/avatars/zxr.jpg', year: '2023', research: '金融科技、演化算法、大模型' }, // <-- 修改
  { id: 2, name: '李志文', avatar: '../assets/avatars/lzw.png', year: '2023', research: '图像生成隐私安全、可控生成' }, // <-- 修改
  { id: 3, name: '杨瑞丰', avatar: '../assets/avatars/yrf.png', year: '2023', research: '金融数据挖掘、生成模型' }, // <-- 修改
  { id: 4, name: '刘锟', avatar: '../assets/avatars/lk.png', year: '2023', research: 'LLM、时序预测' }, // <-- 修改
  { id: 5, name: '裘盼佳', avatar: '../assets/avatars/qpj.png', year: '2023', research: 'LLM安全、文本对抗攻击' }, // <-- 修改
  { id: 6, name: '陈碟', avatar: '../assets/avatars/cd.png', year: '2023', research: 'AIGC、内容安全、可控生成' }, // <-- 修改
  { id: 7, name: '李传', avatar: '../assets/avatars/lc.png', year: '2024', research: '可信医疗大模型' }, // <-- 修改
  { id: 8, name: '李卓颖', avatar: '../assets/avatars/lzy.png', year: '2024', research: '基于LLM的时序预测' }, // <-- 修改
  { id: 9, name: '刘钰', avatar: '../assets/avatars/ly.png', year: '2024', research: '金融科技' }, // <-- 修改 (注意你之前有多个 id: 8)
  { id: 10, name: '张逸敏', avatar: '../assets/avatars/zym.png', year: '2024', research: '隐私保护、机器学习' }, // <-- 修改
  { id: 11, name: '叶金艳', avatar: '../assets/avatars/yjy.png', year: '2024', research: 'AIGC' }, // <-- 修改
  { id: 12, name: '吕晔', avatar: '../assets/avatars/ly2.png', year: '2024', research: '可信医疗大模型' }, // <-- 修改
  { id: 13, name: '唐国栋', avatar: '../assets/avatars/tgd.png', year: '2024', research: '金融科技' }, // <-- 修改
  { id: 14, name: '徐晨阳', avatar: '../assets/avatars/xcy.png', year: '2025', research: '金融科技' }, // <-- 修改
  { id: 15, name: '颜泽宇', avatar: '../assets/avatars/yzy.png', year: '2025', research: '隐私安全' }, // <-- 修改
  { id: 16, name: '周康', avatar: '../assets/avatars/zk.png', year: '2025', research: '隐私安全' }, // <-- 修改
  { id: 17, name: '昌恒宇', avatar: '../assets/avatars/chy.png', year: '2025', research: '金融科技' }, // <-- 修改
  { id: 18, name: '陆锦云', avatar: '../assets/avatars/lzy2.png', year: '2025', research: '隐私安全' }, // <-- 修改
  { id: 19, name: '施曼丽', avatar: '../assets/avatars/sml.png', year: '2025', research: '隐私安全' }, // <-- 修改
  { id: 20, name: '吴沛卓', avatar: '../assets/avatars/wpz.png', year: '2025', research: '金融科技' }, // <-- 修改
])
</script>

<style scoped>
/* 你的所有样式都保持不变，它们是正确的 */
/* 控制链接样式，使其颜色与周围文本一致 */
.plain-link {
  color: inherit; /* 继承父元素的文字颜色 */
  text-decoration: none; /* 去除下划线（可选，根据需求保留或删除） */
}

/* 鼠标悬停时也保持颜色不变（可选） */
.plain-link:hover {
  color: inherit;
  text-decoration: none; /* 悬停时也无下划线 */
}
.members {
  max-width: 1200px;
  margin: 0 auto;
  padding: 15px;
}
/* ... 粘贴你原来的所有 style 内容 ... */
/* .page-title {
  color: #667eea;
  margin-bottom: 20px;
  font-size: 1.8rem;
} */
.section {
  margin-bottom: 25px;
}
.section-title {
  color: #667eea;
  margin-bottom: 12px;
  padding-bottom: 8px;
  border-bottom: 2px solid #667eea;
  font-size: 1.3rem;
}
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 12px;
}
.grid-full {
     grid-template-columns: 1fr;
   }
.card {
  background: white;
  border-radius: 8px;
  padding: 12px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: all 0.2s;
}
.card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  transform: translateY(-2px);
}
.card-small {
  padding: 10px;
}
.card-content {
  display: flex;
  gap: 12px;
  align-items: start;
}
.avatar {
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  flex-shrink: 0;
  overflow: hidden;
}
.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.avatar-large {
  width: 80px;
  height: 80px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  font-size: 1.8rem;
}
.avatar-medium {
  width: 60px;
  height: 60px;
  background: #667eea;
  font-size: 1.5rem;
}
.avatar-small {
  width: 50px;
  height: 50px;
  background: #764ba2;
  font-size: 1.3rem;
}
.info {
  flex: 1;
  min-width: 0;
}
.name {
  color: #667eea;
  margin: 0 0 3px 0;
  font-size: 1.1rem;
}
.title {
  color: #666;
  margin: 0 0 6px 0;
  font-weight: 500;
  font-size: 0.9rem;
}
.year {
  color: #666;
  margin: 0 0 6px 0;
  font-size: 0.9rem;
}
.detail {
  margin: 0 0 4px 0;
  font-size: 0.9rem;
  line-height: 1.4;
}
.detail strong {
  color: #333;
}
.bio {
  color: #666;
  line-height: 1.5;
  font-size: 0.9rem;
  margin: 6px 0 0 0;
}
@media (max-width: 768px) {
  .grid {
    grid-template-columns: 1fr;
    gap: 10px;
  }
  .members {
    padding: 10px;
  }
  .page-title {
    font-size: 1.5rem;
    margin-bottom: 15px;
  }
  .section {
    margin-bottom: 20px;
  }
  .avatar-large {
    width: 60px;
    height: 60px;
    font-size: 1.5rem;
  }
  .avatar-medium {
    width: 50px;
    height: 50px;
    font-size: 1.3rem;
  }
  .avatar-small {
    width: 45px;
    height: 45px;
    font-size: 1.2rem;
  }
}
</style>
