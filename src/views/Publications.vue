<template>
  <div class="publications">
    <h1 class="page-title">发表论文</h1>

    <div class="card" style="margin-bottom: 30px;">
      <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px;">
        <div>
          <h3 style="color: #667eea;">筛选条件</h3>
        </div>
        <div style="display: flex; gap: 15px; flex-wrap: wrap;">
          <select v-model="selectedYear">
            <option value="all">所有年份</option>
            <option v-for="year in years" :key="year" :value="year">{{ year }}</option>
          </select>
          <select v-model="selectedType">
            <option value="all">所有类型</option>
            <option value="journal">期刊论文</option>
            <option value="conference">会议论文</option>
          </select>
        </div>
      </div>
    </div>

    <!-- <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                             color: white; margin-bottom: 30px;">
      <div style="display: flex; justify-content: space-around; text-align: center; flex-wrap: wrap; gap: 20px;">
        <div>
          <div style="font-size: 2.5rem; font-weight: bold;">{{ statistics.total }}</div>
          <div style="margin-top: 5px;">总论文数</div>
        </div>
        <div>
          <div style="font-size: 2.5rem; font-weight: bold;">{{ statistics.topJournals }}</div>
          <div style="margin-top: 5px;">顶级期刊</div>
        </div>
        <div>
          <div style="font-size: 2.5rem; font-weight: bold;">{{ statistics.topConferences }}</div>
          <div style="margin-top: 5px;">顶级会议</div>
        </div>
        <div>
          <div style="font-size: 2.5rem; font-weight: bold;">{{ statistics.citations }}</div>
          <div style="margin-top: 5px;">总引用数</div>
        </div>
      </div>
    </div> -->

    <div v-if="filteredPublications.length === 0" class="card" style="text-align: center; padding: 60px;">
      <p style="font-size: 1.2rem; color: #666;">暂无符合条件的论文</p>
    </div>

    <div v-for="pub in filteredPublications" :key="pub.id" class="card" 
         style="border-left: 4px solid #667eea;">
      <div style="display: flex; justify-content: space-between; align-items: start; gap: 20px; flex-wrap: wrap;">
        <div style="flex: 1; min-width: 300px;">
          <h3 style="color: #667eea; margin-bottom: 10px; line-height: 1.4;">
            {{ pub.title }}
          </h3>
          <p style="color: #666; margin-bottom: 8px;">
            <strong>作者:</strong> {{ pub.authors }}
          </p>
          <p style="color: #666; margin-bottom: 8px;">
            <strong>发表于:</strong> {{ pub.venue }}
          </p>
          <p style="color: #666; margin-bottom: 8px;">
            <strong>年份:</strong> {{ pub.year }}
          </p>
          <p v-if="pub.citations" style="color: #666; margin-bottom: 15px;">
            <strong>引用数:</strong> {{ pub.citations }}
          </p>
          <div style="display: flex; gap: 10px; flex-wrap: wrap;">
            <span :style="{
              background: pub.type === 'journal' ? '#667eea' : '#764ba2',
              color: 'white',
              padding: '5px 15px',
              borderRadius: '20px',
              fontSize: '0.85rem'
            }">
              {{ pub.type === 'journal' ? '期刊论文' : '会议论文' }}
            </span>
            <span v-if="pub.ccfLevel" 
                  :style="{
                    background: pub.ccfLevel === 'A' ? '#ef4444' : 
                              pub.ccfLevel === 'B' ? '#f59e0b' : '#10b981',
                    color: 'white',
                    padding: '5px 15px',
                    borderRadius: '20px',
                    fontSize: '0.85rem'
                  }">
              {{ pub.ccfLevel === 'A' ? '⭐ CCF A' : 
                pub.ccfLevel === 'B' ? '🔶 CCF B' : '🔷 CCF C' }}
            </span>
          </div>
        </div>
        <div style="display: flex; flex-direction: column; gap: 10px;">
          <a v-if="pub.pdf" :href="pub.pdf" target="_blank" class="btn" 
             style="text-align: center; white-space: nowrap;">
            📄 PDF
          </a>
          <a v-if="pub.link" :href="pub.link" target="_blank" 
             style="display: inline-block; padding: 10px 25px; background: white; 
                    color: #667eea; text-decoration: none; border-radius: 5px; 
                    border: 2px solid #667eea; font-weight: 500; text-align: center; 
                    white-space: nowrap;">
            🔗 链接
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const selectedYear = ref('all')
const selectedType = ref('all')

const publications = ref([
  {
    id: 1,
    title: 'Deep Learning for Medical Image Analysis: A Comprehensive Survey',
    authors: '张三, 李四, 王五',
    venue: 'Nature Medicine',
    year: 2024,
    type: 'journal',
    ccfLevel: 'A',
    citations: 156,
    pdf: 'https://example.com/paper1.pdf',
    link: 'https://example.com/paper1'
  },
  {
    id: 2,
    title: 'Efficient Transformer Models for Natural Language Processing',
    authors: '李四, 赵六, 张三',
    venue: 'NeurIPS 2024',
    year: 2024,
    type: 'conference',
    ccfLevel: 'B',
    citations: 89,
    pdf: 'https://example.com/paper2.pdf',
    link: 'https://example.com/paper2'
  },
  {
    id: 3,
    title: 'Federated Learning with Privacy Preservation: Methods and Applications',
    authors: '王五, 张三, 刘七',
    venue: 'IEEE TPAMI',
    year: 2024,
    type: 'journal',
    ccfLevel: 'A',
    citations: 234,
    pdf: 'https://example.com/paper3.pdf',
    link: 'https://example.com/paper3'
  },
  {
    id: 4,
    title: 'Real-time Object Detection for Autonomous Driving',
    authors: '赵六, 李四, 孙八',
    venue: 'CVPR 2024',
    year: 2024,
    type: 'conference',
    ccfLevel: 'C',
    citations: 178,
    pdf: 'https://example.com/paper4.pdf',
    link: 'https://example.com/paper4'
  },
  {
    id: 5,
    title: 'Graph Neural Networks for Social Network Analysis',
    authors: '刘七, 王五, 周九',
    venue: 'ACM TKDD',
    year: 2023,
    type: 'journal',
    ccfLevel: 'B',
    citations: 312,
    pdf: 'https://example.com/paper5.pdf',
    link: 'https://example.com/paper5'
  },
  {
    id: 6,
    title: 'Reinforcement Learning for Robotics: Recent Advances',
    authors: '孙八, 赵六, 吴十',
    venue: 'ICRA 2023',
    year: 2023,
    type: 'conference',
    ccfLevel: 'A',
    citations: 267,
    pdf: 'https://example.com/paper6.pdf',
    link: 'https://example.com/paper6'
  },
  {
    id: 7,
    title: 'Transfer Learning for Low-Resource Languages',
    authors: '周九, 郑十一, 李四',
    venue: 'ACL 2023',
    year: 2023,
    type: 'conference',
    ccfLevel: 'B',
    citations: 145,
    pdf: 'https://example.com/paper7.pdf',
    link: 'https://example.com/paper7'
  },
  {
    id: 8,
    title: 'Edge Computing for Internet of Things: Challenges and Solutions',
    authors: '吴十, 张三, 钱十二',
    venue: 'IEEE IoT Journal',
    year: 2023,
    type: 'journal',
    ccfLevel: 'C',
    citations: 98,
    pdf: 'https://example.com/paper8.pdf',
    link: 'https://example.com/paper8'
  }
])

const years = computed(() => {
  const yearSet = new Set(publications.value.map(p => p.year))
  return Array.from(yearSet).sort((a, b) => b - a)
})

const filteredPublications = computed(() => {
  return publications.value.filter(pub => {
    const yearMatch = selectedYear.value === 'all' || pub.year === parseInt(selectedYear.value)
    const typeMatch = selectedType.value === 'all' || pub.type === selectedType.value
    return yearMatch && typeMatch
  })
})

const statistics = computed(() => {
  return {
    total: publications.value.length,
    topJournals: publications.value.filter(p => p.type === 'journal' && p.isTop).length,
    topConferences: publications.value.filter(p => p.type === 'conference' && p.isTop).length,
    citations: publications.value.reduce((sum, p) => sum + (p.citations || 0), 0)
  }
})
</script>

<style scoped>
/* 组件特定的样式 */
</style>
