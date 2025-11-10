<template>
  <div class="research">
    <h1 class="page-title">研究方向</h1>
    
    <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; margin-bottom: 40px;">
      <h2 style="color: white;">研究概述</h2>
      <p style="margin-top: 15px; line-height: 1.8;">
        本实验室主要研究方向涵盖隐私计算、AIGC、金融科技等前沿领域，
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
    title: '隐私保护计算',
    description: '图像脱敏研究主要探索如何在去除或掩盖图像敏感信息的同时，尽可能保留数据可用性以实现安全高效的模型训练与应用。 联邦学习能够有效帮助平台在满足用户隐私保护、数据安全和政府法规的要求下，利用用户产生的数据进行机器学习建模。大模型安全与攻防对抗则关注如何提升大规模预训练模型的鲁棒性与安全性，防范潜在的攻击威胁。',
    keywords: ['图像脱敏', '联邦学习', '大模型安全', '攻防对抗'],
    projects: [
      {
        id: 1,
        name: 'Research on Privacy Protection Techniques for Pretrained Models',
        partner: '蚂蚁集团项目',
        duration: '2022-11 至 2024-01',
        // description: '开发基于深度学习的智能医疗影像分析系统，辅助医生进行疾病诊断。系统已在多家医院试点应用，取得良好效果。',
        link: 'https://example.com/medical-ai',
        paper: 'https://example.com/paper1'
      },
      {
        id: 2,
        name: 'Key Technologies for Efficient and Secure Federated System',
        partner: '区块链与数据安全国家重点实验室开放研究基金项目',
        duration: '2024-05 至 2025-04',
        // description: '研究基于深度学习和强化学习的个性化推荐算法，提升推荐系统的准确性和用户体验。',
        link: 'https://example.com/recommendation',
        paper: 'https://example.com/paper1'
      },
      {
        id: 3,
        name: 'Privacy Preserving Cross-silo Question-Answering Systems',
        partner: '国家自然科学基金项目',
        duration: '2023-01 至 2025-12',
        // description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      },
      {
        id: 4,
        name: 'Video Image Data Desensitization Platform',
        partner: '上海机动车检测认证技术研究中心',
        duration: '2023-10 至 2024-10',
        // description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      },
      {
        id: 5,
        name: 'Federated Learning for Multi-source Heterogeneous Scenarios',
        partner: 'KLATASDS-MOE 开放研究基金项目',
        duration: '2022-05 至 2024-04',
        // description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      },
      {
        id: 6,
        name: 'Research and Implementation of GC-based SHA256 and AES Protocols',
        partner: '蚂蚁集团项目',
        duration: '2024-06 至 2025-06',
        // description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      },
      {
        id: 7,
        name: 'Research on Enhancing Interaction and Security of LLMs in Complex Multi-turn Dialogues',
        partner: '蚂蚁集团项目',
        duration: '2025-08 至 2026-08',
        // description: '开发支持大规模分布式机器学习的联邦学习框架，保护数据隐私的同时提升模型性能。',
        link: 'https://example.com/federated-learning',
        paper: 'https://example.com/paper2'
      }
    ]
  },
  {
    icon: '👁️',
    title: 'AIGC',
    description: '研究 AIGC 在图像生成、视频生成、多模态推理等领域的应用，探索提升安全可控的生成质量和效率的方法。',
    keywords: ['视频生成', '多模态推理', '图像理解'],
    projects: [
      {
        id: 1,
        name: 'Exploration of Multimodal Reasoning Large Models in E-commerce After-sales Scenarios',
        partner: '字节跳动项目',
        duration: '2025-07 至 2026-07',
        // description: '开发用于自动驾驶的多模态感知系统，融合摄像头、激光雷达等传感器数据，实现精准的环境感知。',
        link: 'https://example.com/autonomous-driving',
        paper: 'https://example.com/paper3'
      },
      {
        id: 2,
        name: 'Safe and Controllable Unified Multimodal Generation and Understanding',
        partner: '阿里巴巴通义实验室项目',
        duration: '2025-06 至 2026-06',
        // description: '研发基于深度学习的智能视频分析系统，实现异常行为检测、人群密度估计等功能。',
        link: 'https://example.com/surveillance',
        paper: 'https://example.com/paper3'
      },
      {
        id: 3,
        name: 'Research on Intelligent, Controllable, and Secure Long Video Generation',
        partner: '阿里巴巴通义实验室项目',
        duration: '2024-05 至 2025-05',
        // description: '研发基于深度学习的智能视频分析系统，实现异常行为检测、人群密度估计等功能。',
        link: 'https://example.com/surveillance',
        paper: 'https://example.com/paper3'
      },
      {
        id: 4,
        name: 'Efficient, Controllable, and Secure Multimodal Pretraining',
        partner: '阿里巴巴通义实验室项目',
        duration: '2022-06 至 2023-06',
        // description: '研发基于深度学习的智能视频分析系统，实现异常行为检测、人群密度估计等功能。',
        link: 'https://example.com/surveillance',
        paper: 'https://example.com/paper3'
      },
    ]
  },
  {
    icon: '💬',
    title: '金融科技',
    description: '研究金融领域中的算法交易、因子挖掘、时序预测等技术，提升金融数据分析和决策的智能化水平。',
    keywords: ['算法交易', '因子挖掘', '时序预测'],
    projects: [
      {
        id: 1,
        name: 'Research on Enhancing Financial User Understanding and Experience with Large Language Models',
        partner: '滴滴集团项目',
        duration: '2025-07 至 2026-07',
        // description: '开发基于大语言模型的智能客服系统，提供7x24小时的客户服务，大幅提升客户满意度。',
        link: 'https://example.com/chatbot',
        paper: 'https://example.com/paper4'
      },
      {
        id: 2,
        name: 'Joint Lab for Financial Big Data Mining and Analytics',
        partner: '华东师范大学-瞰点科技金融大数据联合实验室',
        duration: '2022-10 至 2025-10',
        // description: '构建支持多语言的大规模知识图谱，研究跨语言知识表示和推理方法。',
        link: 'https://example.com/knowledge-graph',
        paper: 'https://example.com/paper5'
      }
    ]
  },
])
</script>

<style scoped>
/* 组件特定的样式 */
</style>
