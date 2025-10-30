<template>
  <div class="members">
    <h1 class="page-title">团队成员</h1>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        🎓 导师团队
      </h2>
      <div class="grid">
        <div v-for="advisor in advisors" :key="advisor.id" class="card">
          <div style="display: flex; gap: 20px; align-items: start;">
            <div style="width: 100px; height: 100px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                        border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                        color: white; font-size: 2rem; flex-shrink: 0;">
              {{ advisor.avatar }}
            </div>
            <div style="flex: 1;">
              <h3 style="color: #667eea; margin-bottom: 5px;">{{ advisor.name }}</h3>
              <p style="color: #666; margin-bottom: 10px; font-weight: 500;">{{ advisor.title }}</p>
              <p style="margin-bottom: 8px;"><strong>研究方向:</strong> {{ advisor.research }}</p>
              <p style="margin-bottom: 8px;"><strong>邮箱:</strong> {{ advisor.email }}</p>
              <p style="color: #666; line-height: 1.6;">{{ advisor.bio }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        👨‍🔬 博士后研究员
      </h2>
      <div class="grid">
        <div v-for="postdoc in postdocs" :key="postdoc.id" class="card">
          <div style="display: flex; gap: 15px; align-items: start;">
            <div style="width: 80px; height: 80px; background: #667eea; 
                        border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                        color: white; font-size: 1.8rem; flex-shrink: 0;">
              {{ postdoc.avatar }}
            </div>
            <div style="flex: 1;">
              <h3 style="color: #667eea;">{{ postdoc.name }}</h3>
              <p style="margin-top: 5px;"><strong>研究方向:</strong> {{ postdoc.research }}</p>
              <p style="margin-top: 5px;"><strong>邮箱:</strong> {{ postdoc.email }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        🎓 博士研究生
      </h2>
      <div class="grid">
        <div v-for="phd in phdStudents" :key="phd.id" class="card">
          <div style="display: flex; gap: 15px; align-items: start;">
            <div style="width: 70px; height: 70px; background: #764ba2; 
                        border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                        color: white; font-size: 1.5rem; flex-shrink: 0;">
              {{ phd.avatar }}
            </div>
            <div style="flex: 1;">
              <h3 style="color: #667eea;">{{ phd.name }}</h3>
              <p style="margin-top: 5px; color: #666;">{{ phd.year }} 级</p>
              <p style="margin-top: 5px;"><strong>研究方向:</strong> {{ phd.research }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section>
      <h2 style="color: #667eea; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        📚 硕士研究生
      </h2>
      <div class="grid">
        <div v-for="master in masterStudents" :key="master.id" class="card">
          <div style="display: flex; gap: 15px; align-items: start;">
            <div style="width: 70px; height: 70px; background: #9f7aea; 
                        border-radius: 50%; display: flex; align-items: center; justify-content: center; 
                        color: white; font-size: 1.5rem; flex-shrink: 0;">
              {{ master.avatar }}
            </div>
            <div style="flex: 1;">
              <h3 style="color: #667eea;">{{ master.name }}</h3>
              <p style="margin-top: 5px; color: #666;">{{ master.year }} 级</p>
              <p style="margin-top: 5px;"><strong>研究方向:</strong> {{ master.research }}</p>
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

const postdocs = ref([
  { id: 1, name: '王博士', avatar: '👨‍💼', research: '自然语言处理', email: 'wang@university.edu' },
  { id: 2, name: '刘博士', avatar: '👩‍💼', research: '强化学习', email: 'liu@university.edu' }
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
/* 组件特定的样式 */
</style>
