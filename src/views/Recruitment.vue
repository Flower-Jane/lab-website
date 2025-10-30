<template>
  <div class="recruitment">
    <h1 class="page-title">实验室招生</h1>

    <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                             color: white; margin-bottom: 40px; text-align: center;">
      <h2 style="color: white; font-size: 2rem; margin-bottom: 15px;">🎓 欢迎加入我们的团队！</h2>
      <p style="font-size: 1.1rem; line-height: 1.8;">
        我们正在寻找对科研充满热情、积极进取的优秀学子加入实验室。
        在这里，你将获得一流的科研训练、国际化的学术视野和广阔的发展空间。
      </p>
    </div>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 25px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        📋 招生类型
      </h2>
      <div class="grid">
        <div v-for="type in recruitmentTypes" :key="type.id" class="card">
          <div style="text-align: center; margin-bottom: 15px; font-size: 3rem;">
            {{ type.icon }}
          </div>
          <h3 style="color: #667eea; text-align: center; margin-bottom: 15px;">
            {{ type.title }}
          </h3>
          <ul style="list-style-position: inside; color: #555; line-height: 2;">
            <li v-for="item in type.items" :key="item">{{ item }}</li>
          </ul>
          <div style="text-align: center; margin-top: 20px;">
            <span style="background: #f0f4ff; color: #667eea; padding: 8px 20px; 
                         border-radius: 20px; font-weight: 500;">
              {{ type.quota }}
            </span>
          </div>
        </div>
      </div>
    </section>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 25px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        ✅ 申请条件
      </h2>
      <div class="card">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px;">
          <div v-for="requirement in requirements" :key="requirement.title">
            <h3 style="color: #667eea; margin-bottom: 15px; display: flex; align-items: center; gap: 10px;">
              <span style="font-size: 1.5rem;">{{ requirement.icon }}</span>
              {{ requirement.title }}
            </h3>
            <ul style="list-style: none; padding-left: 0;">
              <li v-for="item in requirement.items" :key="item" 
                  style="margin-bottom: 10px; padding-left: 25px; position: relative; line-height: 1.6;">
                <span style="position: absolute; left: 0; color: #667eea;">▸</span>
                {{ item }}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 25px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        🎁 我们提供
      </h2>
      <div class="grid">
        <div v-for="benefit in benefits" :key="benefit.title" class="card">
          <div style="text-align: center; margin-bottom: 15px; font-size: 2.5rem;">
            {{ benefit.icon }}
          </div>
          <h3 style="color: #667eea; text-align: center; margin-bottom: 10px;">
            {{ benefit.title }}
          </h3>
          <p style="text-align: center; color: #555; line-height: 1.6;">
            {{ benefit.description }}
          </p>
        </div>
      </div>
    </section>

    <section style="margin-bottom: 50px;">
      <h2 style="color: #667eea; margin-bottom: 25px; padding-bottom: 10px; border-bottom: 2px solid #667eea;">
        📧 联系方式
      </h2>
      <div class="card" style="background: #f8f9fa;">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); 
                    gap: 30px; text-align: center;">
          <div v-for="contact in contacts" :key="contact.type">
            <div style="font-size: 2.5rem; margin-bottom: 10px;">{{ contact.icon }}</div>
            <h3 style="color: #667eea; margin-bottom: 10px;">{{ contact.type }}</h3>
            <p style="color: #555; word-break: break-all;">{{ contact.value }}</p>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script setup>
import { ref } from 'vue'

const recruitmentTypes = ref([
  {
    id: 1,
    icon: '🎓',
    title: '博士研究生',
    items: ['硕博连读', '直接攻博'],
    quota: '每年招收2-3名'
  },
  {
    id: 2,
    icon: '📚',
    title: '硕士研究生',
    items: ['学术型硕士', '专业型硕士'],
    quota: '每年招收4-6名'
  }
])

const requirements = ref([
  {
    icon: '📖',
    title: '学术背景',
    items: [
      '计算机、人工智能、数学等相关专业',
      '本科/硕士成绩优秀',
      '有科研经历者优先',
      '英语水平良好(CET-6/TOEFL/IELTS)'
    ]
  },
  {
    icon: '💻',
    title: '技能要求',
    items: [
      '扎实的编程基础(Python/C++)',
      '熟悉深度学习框架(PyTorch/TensorFlow)',
      '有机器学习/深度学习项目经验',
      '良好的数学基础'
    ]
  },
  {
    icon: '⭐',
    title: '个人素质',
    items: [
      '对科研有浓厚兴趣和热情',
      '具备良好的团队协作精神',
      '积极主动，勇于创新',
      '良好的沟通表达能力'
    ]
  }
])

const benefits = ref([
  {
    icon: '💰',
    title: '优厚待遇',
    description: '提供有竞争力的奖学金和科研津贴。'
  },
  {
    icon: '🌍',
    title: '国际交流',
    description: '支持参加国际顶级会议，资助访问国际知名实验室'
  },
  {
    icon: '🔧',
    title: '一流设备',
    description: '提供高性能GPU服务器、专业实验设备等科研资源'
  },
  {
    icon: '👨‍🏫',
    title: '导师指导',
    description: '一对一导师指导，助力学术成长和职业发展'
  },
  {
    icon: '📝',
    title: '论文发表',
    description: '支持在顶级期刊和会议发表论文，提供充足的科研经费'
  },
  {
    icon: '🎯',
    title: '职业发展',
    description: '提供实习推荐、就业指导，与多家知名企业建立合作'
  }
])

const contacts = ref([
  { icon: '📧', type: '电子邮箱', value: 'cenchen@dase.ecnu.edu.cn' },
  // { icon: '📱', type: '联系电话', value: '123-456-7890' },
  { icon: '🏢', type: '办公地址', value: '华东师范大学地理馆212室' },
  { icon: '🌐', type: '实验室主页', value: 'www.lab-website.edu' }
])
</script>

<style scoped>
/* 组件特定的样式 */
</style>
