<template>
  <div class="home">
    <section class="hero">
      <h1 class="page-title">欢迎来到我们的实验室</h1>
      <!-- <p style="text-align: center; font-size: 1.2rem; color: #666; margin-bottom: 40px;">
        致力于前沿科学研究，培养优秀人才
      </p> -->
    </section>

    <!-- 实验室成员合照轮播展示 - 移到最前面 -->
    <div class="team-photos-wrapper">
      <div class="team-photos" ref="photoContainer">
        <div class="photo-item" v-for="(photo, index) in teamPhotos" :key="index">
          <img :src="photo" alt="实验室成员" />
        </div>
      </div>
      <!-- 轮播指示器 -->
      <div class="photo-indicators">
        <span 
          v-for="(photo, index) in teamPhotos" 
          :key="'indicator-' + index"
          :class="['indicator', { active: index === photoIndex }]"
          @click="goToPhoto(index)"
        ></span>
      </div>
    </div>

    <div class="card">
      <h2>实验室简介</h2>
      <p style="line-height: 1.8; margin-top: 15px;">
        华东师范大学计算智能实验室成立于 2021 年，是一个年轻的团体，致力于打造一支学科交叉融合、学术氛围浓厚的一流研究团队。目前我们聚焦但不仅限于以下方向：
      </p>
      <ul style="line-height: 1.8; margin: 10px 0 10px 20px; padding-left: 10px;">
        <li>隐私计算（如联邦学习、差分隐私、算法攻防、MPC 等）</li>
        <li>AIGC（如多模态图像生成、大语言模型等）</li>
        <li>金融领域数据挖掘相关应用及技术</li>
      </ul>
      <p style="line-height: 1.8; margin-bottom: 0;">
        我们力争在所研究的领域，努力创新，撰写高质量论文，进行高质量研究，培养高质量人才。目前实验室与阿里巴巴、蚂蚁集团、瞰点科技等互联网公司的核心算法研发团队有密切稳定的合作关系，共同培养学术与工程的人才。对于想要做研究的同学，我们会每周组织学术研究的探讨；对于想要去工业界发展的研究生，我们会着重培养动手能力与参与、领导项目的能力。
      </p>
    </div>

    <div class="card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white;">
      <h2 style="color: white;">最新动态</h2>
      <ul style="margin-top: 20px; list-style-position: inside;">
        <li style="margin-bottom: 15px;">
          <strong>2025-12:</strong> 实验室团队成员在 NeurIPS 2025 发表首次针对NSFW内容擦除评测基准的重要研究成果
        </li>
        <li style="margin-bottom: 15px;">
          <strong>2025-05:</strong> 喜讯！《Responsible Diffusion Models via Constraining Text Embeddings within Safe Regions》获 WWW 2025 最佳论文奖项！
        </li>
        <li style="margin-bottom: 15px;">
          <strong>2025-02:</strong> 实验室团队成员在 ICLR 2025 发表两篇研究型论文
        </li>
      </ul>
    </div>

    <div style="text-align: center; margin-top: 40px;">
      <router-link to="/recruitment" class="btn" style="font-size: 1.1rem; padding: 15px 40px;">
        加入我们 →
      </router-link>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

// 使用 import 方式引入图片
import photo1 from '../assets/team/1.jpg';
import photo2 from '../assets/team/2.jpg';
import photo3 from '../assets/team/3.jpg';
import photo4 from '../assets/team/4.jpg';

// 创建图片数组
const teamPhotos = [photo1, photo2, photo3, photo4];

const photoIndex = ref(0);
const photoContainer = ref(null);
let intervalId = null;

// 定时切换照片
const rotatePhotos = () => {
  if (photoContainer.value) {
    photoIndex.value = (photoIndex.value + 1) % teamPhotos.length;
    photoContainer.value.style.transform = `translateX(-${photoIndex.value * 100}%)`;
  }
};

// 跳转到指定照片
const goToPhoto = (index) => {
  if (photoContainer.value) {
    photoIndex.value = index;
    photoContainer.value.style.transform = `translateX(-${index * 100}%)`;
  }
};

onMounted(() => {
  // 设置每隔5秒切换一次图片
  intervalId = setInterval(rotatePhotos, 5000);
});

onUnmounted(() => {
  // 清除定时器
  if (intervalId) {
    clearInterval(intervalId);
  }
});
</script>

<style scoped>
.team-photos-wrapper {
  position: relative;
  overflow: hidden;
  width: 100%;
  margin: 0 0 40px 0;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  background: white;
}

.team-photos {
  display: flex;
  transition: transform 0.8s ease-in-out;
  width: 100%;
}

.photo-item {
  flex-shrink: 0;
  width: 100%;
}

.photo-item img {
  width: 100%;
  height: auto;
  display: block;
  object-fit: cover;
  max-height: 500px;
}

/* 轮播指示器 */
.photo-indicators {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 10px;
  z-index: 10;
}

.indicator {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  transition: all 0.3s ease;
}

.indicator:hover {
  background-color: rgba(255, 255, 255, 0.8);
  transform: scale(1.2);
}

.indicator.active {
  background-color: white;
  width: 30px;
  border-radius: 6px;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .team-photos-wrapper {
    margin-bottom: 30px;
  }
  
  .photo-item img {
    max-height: 300px;
  }
  
  .photo-indicators {
    bottom: 10px;
  }
  
  .indicator {
    width: 8px;
    height: 8px;
  }
  
  .indicator.active {
    width: 20px;
  }
}
</style>