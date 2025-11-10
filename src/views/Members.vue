<template>
  <div class="members">
    <h1 class="page-title">团队成员</h1>

    <section class="section">
      <h2 class="section-title">🎓 导师团队</h2>
      <div class="grid">
        <div v-for="advisor in advisors" :key="advisor.id" class="card">
          <div class="card-content">
            
            <div class="avatar avatar-large">
              <img
                v-if="advisor.avatar.includes('/')"
                :src="advisor.avatar"
                :alt="advisor.name"
                class="avatar-image"
              />
              <span v-else>{{ advisor.avatar }}</span>
            </div>
            <div class="info">
              <h3 class="name">{{ advisor.name }}</h3>
              <p class="title">{{ advisor.title }}</p>
              <p class="detail"><strong>研究方向:</strong> {{ advisor.research }}</p>
              <p class="detail"><strong>邮箱:</strong> {{ advisor.email }}</p>
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
                :src="phd.avatar"
                :alt="phd.name"
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
                :src="master.avatar"
                :alt="master.name"
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

const advisors = ref([
  {
    id: 1,
    name: '陈岑',
    title: '副教授、博士生导师',
    avatar: '/photo/cc.png',
    research: '数据挖掘、隐私保护机器学习、NLP应用等',
    email: ' cenchen@dase.ecnu.edu.cn',
    bio: '华东师范大学数据科学与工程学院副教授、博士生导师；新加坡管理大学博士学位。研究专注于可信大语言模型、隐私与AI安全等领域，发表论文100余篇，申请40余项专利'
  }
])

const phdStudents = ref([
  { id: 1, name: '周天辰', avatar: '/photo/ztc.png', year: '2022', research: 'LLMAgent、LLM强化学习' },
  { id: 2, name: '范洺源', avatar: '/photo/fmy.jpg', year: '2023', research: '可信人工智能' },
  { id: 3, name: '崔锦铭', avatar: '/photo/cjm.png', year: '2023', research: '生成对抗网络' },
  { id: 3, name: '周逸', avatar: '/photo/zy.png', year: '2025', research: '隐私计算' }
])

const masterStudents = ref([
  { id: 1, name: '曾玺睿', avatar: '/photo/zxr.jpg', year: '2023', research: '金融科技、演化算法、大模型' },
  { id: 2, name: '李志文', avatar: '/photo/lzw.png', year: '2023', research: '图像生成隐私安全、可控生成' },
  { id: 3, name: '杨瑞丰', avatar: '/photo/yrf.png', year: '2023', research: '金融数据挖掘、生成模型' },
  { id: 4, name: '刘锟', avatar: '/photo/lk.png', year: '2023', research: 'LLM、时序预测' },
  { id: 5, name: '裘盼佳', avatar: '/photo/qpj.png', year: '2023', research: 'LLM安全、文本对抗攻击' },
  { id: 6, name: '陈碟', avatar: '/photo/cd.png', year: '2023', research: 'AIGC、内容安全、可控生成' },
  { id: 7, name: '李传', avatar: '/photo/lc.png', year: '2024', research: '可信医疗大模型' },
  { id: 8, name: '李卓颖', avatar: '/photo/lzy.png', year: '2024', research: '基于LLM的时序预测' },
  { id: 9, name: '刘钰', avatar: '/photo/ly.png', year: '2024', research: '金融科技' },
  { id: 8, name: '张逸敏', avatar: '/photo/zym.png', year: '2024', research: '隐私保护、机器学习' },
  { id: 8, name: '叶金艳', avatar: '/photo/yjy.png', year: '2024', research: 'AIGC' },
  { id: 8, name: '吕晔', avatar: '/photo/ly2.png', year: '2024', research: '可信医疗大模型' },
  { id: 8, name: '唐国栋', avatar: '/photo/tgd.png', year: '2024', research: '金融科技' },

  { id: 8, name: '徐晨阳', avatar: '/photo/xcy.png', year: '2025', research: '金融科技' },
  { id: 8, name: '颜泽宇', avatar: '/photo/yzy.png', year: '2025', research: '隐私安全' },
  { id: 8, name: '周康', avatar: '/photo/zk.png', year: '2025', research: '隐私安全' },
  { id: 8, name: '昌恒宇', avatar: '/photo/chy.png', year: '2025', research: '金融科技' },
  { id: 8, name: '陆锦云', avatar: '/photo/lzy2.png', year: '2025', research: '隐私安全' },
  { id: 8, name: '施曼丽', avatar: '/photo/sml.png', year: '2025', research: '隐私安全' },
  { id: 8, name: '吴沛卓', avatar: '/photo/wpz.png', year: '2025', research: '金融科技' },
])
</script>

<style scoped>
.members {
  max-width: 1200px;
  margin: 0 auto;
  padding: 15px;
}

.page-title {
  color: #667eea;
  margin-bottom: 20px;
  font-size: 1.8rem;
}

/* 减少section间距 */
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

/* 紧凑的网格布局 */
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 12px;
}

/* 卡片样式 */
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

/* 头像样式 */
.avatar {
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  flex-shrink: 0;
  overflow: hidden; /* <-- 添加这一行 */
}

.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover; /* 保证图片不变形，裁剪填充 */
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

/* 信息区域 */
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

/* 响应式设计 */
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
