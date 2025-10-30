<template>
  <div class="research">
    <h1 class="page-title">研究方向</h1>
    
    <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; margin-bottom: 40px;">
      <h2 style="color: white;">研究概述</h2>
      <p style="margin-top: 15px; line-height: 1.8;">
        本实验室主要研究方向涵盖人工智能、计算机视觉、自然语言处理等前沿领域，
        致力于开发创新的算法和系统，推动相关技术的发展和应用。我们与国内外多家科研机构
        和企业建立了紧密的合作关系，共同开展高水平的科研项目。
      </p>
    </div>

    <div v-for="(direction, index) in researchDirections" :key="index" style="margin-bottom: 50px;">
      <div class="card" style="background: #f8f9fa; border-left: 5px solid #667eea;">
        <h2 style="color: #667eea; display: flex; align-items: center; gap: 10px;">
          <span style="font-size: 2rem;">{{ direction.icon }}</span>
          {{ direction.title }}
        </h2>
        <p style="margin-top: 15px; line-height: 1.8; color: #555;">
          {{ direction.description }}
        </p>
        <div style="margin-top: 20px; display: flex; flex-wrap: wrap; gap: 10px;">
          <span v-for="keyword in direction.keywords" :key="keyword"
                style="background: white; padding: 5px 15px; border-radius: 20px; 
                       font-size: 0.9rem; color: #667eea; border: 1px solid #667eea;">
            {{ keyword }}
          </span>
        </div>
      </div>

      <h3 style="margin: 25px 0 20px 0; color: #764ba2; font-size: 1.3rem;">
        📋 相关合作项目
      </h3>

      <div class="grid">
        <div v-for="project in direction.projects" :key="project.id" class="card">
          <h3 style="color: #667eea; margin-bottom: 10px;">{{ project.name }}</h3>
          <p style="color: #666; margin-bottom: 10px; font-size: 0.9rem;">
            <strong>合作机构:</strong> {{ project.partner }}
          </p>
          <p style="color: #666; margin-bottom: 10px; font-size: 0.9rem;">
            <strong>项目周期:</strong> {{ project.duration }}
          </p>
          <p style="line-height: 1.6; margin-bottom: 15px; color: #555;">
            {{ project.description }}
          </p>
          <div style="display: flex; gap: 10px; flex-wrap: wrap;">
            <a v-if="project.link" :href="project.link" target="_blank" 
               class="btn" style="font-size: 0.9rem; padding: 8px 20px;">
              项目链接 →
            </a>
            <a v-if="project.paper" :href="project.paper" target="_blank"
               style="display: inline-block; padding: 8px 20px; background: white; 
                      color: #667eea; text-decoration: none; border-radius: 5px; 
                      border: 2px solid #667eea; font-weight: 500; font-size: 0.9rem;">
              相关论文 📄
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const researchDirections = ref([
  {
    icon: '🤖',
    title: '人工智能与机器学习',
    description: '研究深度学习、强化学习、迁移学习等机器学习算法，开发智能化的系统和应用。关注算法的可解释性、鲁棒性和效率，推动人工智能技术在实际场景中的应用。',
    keywords: ['深度学习', '强化学习', '迁移学习', '元学习', '可解释AI'],
    projects: [
      {
        id: 1,
        name: '基于深度学习的医疗影像诊断系统',
        partner: 'XX医院、XX科技公司',
        duration: '2023-01 至 2025-12',
        description: '开发基于深度学习的智能医疗影像分析系统，辅助医生进行疾病诊断。系统已在多家医院试点应用，取得良好效果。',
        link: 'https://example.com/medical-ai',
        paper: 'https://example.com/paper1'
      },
      {
        id: 2,
        name: '智能推荐系统优化研究',
        partner: 'XX互联网公司',
        duration: '2024-03 至 2026-03',
        description: '研究基于深度学习和强化学习的个性化推荐算法，提升推荐系统的准确性和用户体验。',
        link: 'https://example.com/recommendation',
        paper: null
      },
      {
        id: 3,
        name: '联邦学习框架开发',
        partner: 'XX大学、XX研究院',
        duration: '2023-06 至 2025-06',
        description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      }
    ]
  },
  {
    icon: '👁️',
    title: '计算机视觉',
    description: '研究图像识别、目标检测、图像分割、3D视觉等计算机视觉技术，开发智能视觉系统。应用领域包括自动驾驶、智能监控、医疗影像分析等。',
    keywords: ['目标检测', '图像分割', '3D重建', '视频理解', '人脸识别'],
    projects: [
      {
        id: 1,
        name: '自动驾驶感知系统',
        partner: 'XX汽车公司',
        duration: '2023-09 至 2026-09',
        description: '开发用于自动驾驶的多模态感知系统，融合摄像头、激光雷达等传感器数据，实现精准的环境感知。',
        link: 'https://example.com/autonomous-driving',
        paper: 'https://example.com/paper3'
      },
      {
        id: 2,
        name: '智能视频监控系统',
        partner: 'XX安防公司',
        duration: '2024-01 至 2025-12',
        description: '研发基于深度学习的智能视频分析系统，实现异常行为检测、人群密度估计等功能。',
        link: 'https://example.com/surveillance',
        paper: null
      }
    ]
  },
  {
    icon: '💬',
    title: '自然语言处理',
    description: '研究文本理解、机器翻译、对话系统、知识图谱等自然语言处理技术。关注大语言模型的训练和应用，推动智能对话、智能客服等应用的发展。',
    keywords: ['大语言模型', '机器翻译', '对话系统', '情感分析', '知识图谱'],
    projects: [
      {
        id: 1,
        name: '智能客服对话系统',
        partner: 'XX电商平台',
        duration: '2023-05 至 2025-05',
        description: '开发基于大语言模型的智能客服系统，提供7x24小时的客户服务，大幅提升客户满意度。',
        link: 'https://example.com/chatbot',
        paper: 'https://example.com/paper4'
      },
      {
        id: 2,
        name: '跨语言知识图谱构建',
        partner: 'XX研究所',
        duration: '2024-02 至 2026-02',
        description: '构建支持多语言的大规模知识图谱，研究跨语言知识表示和推理方法。',
        link: 'https://example.com/knowledge-graph',
        paper: 'https://example.com/paper5'
      }
    ]
  },
  {
    icon: '🌐',
    title: '边缘计算与物联网',
    description: '研究边缘智能计算、轻量级模型部署、物联网数据处理等技术，推动AI技术在资源受限设备上的应用。',
    keywords: ['边缘计算', '模型压缩', '物联网', '实时处理', '嵌入式AI'],
    projects: [
      {
        id: 1,
        name: '工业物联网智能监测平台',
        partner: 'XX制造企业',
        duration: '2023-08 至 2025-08',
        description: '开发基于边缘计算的工业设备智能监测系统，实现设备故障预测和维护优化。',
        link: 'https://example.com/industrial-iot',
        paper: 'https://example.com/paper6'
      }
    ]
  }
])
</script>

<style scoped>
/* 组件特定的样式 */
</style>
