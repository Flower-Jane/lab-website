<template>
  <div class="members">
    <h1 class="page-title">团队成员</h1>

    <section class="section">
      <h2 class="section-title">
        🎓 导师团队
      </h2>
      <div class="grid">
        <div v-for="advisor in advisors" :key="advisor.id" class="card">
          <div class="card-content">
            <div class="avatar avatar-large">
              {{ advisor.avatar }}
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
      <h2 class="section-title">
        🎓 博士研究生
      </h2>
      <div class="grid">
        <div v-for="phd in phdStudents" :key="phd.id" class="card card-small">
          <div class="card-content">
            <div class="avatar avatar-small">
              {{ phd.avatar }}
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
      <h2 class="section-title">
        📚 硕士研究生
      </h2>
      <div class="grid">
        <div v-for="master in masterStudents" :key="master.id" class="card card-small">
          <div class="card-content">
            <div class="avatar avatar-small">
              {{ master.avatar }}
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
    name: '张教授',
    title: '教授、博士生导师',
    avatar: '👨‍🏫',
    research: '人工智能、机器学习',
    email: 'zhang@university.edu',
    bio: '国家杰出青年基金获得者，长期从事人工智能领域研究，在顶级会议和期刊发表论文100余篇。'
  },
  {
    id: 2,
    name: '李教授',
    title: '副教授、硕士生导师',
    avatar: '👩‍🏫',
    research: '计算机视觉、深度学习',
    email: 'li@university.edu',
    bio: '青年千人计划入选者，专注于计算机视觉技术的研究与应用，主持多项国家级科研项目。'
  }
])

const phdStudents = ref([
  { id: 1, name: '陈同学', avatar: '👨', year: '2022', research: '图神经网络' },
  { id: 2, name: '赵同学', avatar: '👩', year: '2023', research: '联邦学习' },
  { id: 3, name: '孙同学', avatar: '👨', year: '2024', research: '生成对抗网络' }
])

const masterStudents = ref([
  { id: 1, name: '周同学', avatar: '👨', year: '2023', research: '目标检测' },
  { id: 2, name: '吴同学', avatar: '👩', year: '2023', research: '图像分割' },
  { id: 3, name: '郑同学', avatar: '👨', year: '2024', research: '语音识别' },
  { id: 4, name: '钱同学', avatar: '👩', year: '2024', research: '推荐系统' }
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