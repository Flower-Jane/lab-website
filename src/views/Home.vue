<template>
  <div class="home">
    <section class="hero">
      <h1 class="page-title">欢迎来到我们的实验室</h1>
      <p style="text-align: center; font-size: 1.2rem; color: #666; margin-bottom: 40px;">
        致力于前沿科学研究，培养优秀人才
      </p>
    </section>

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
// 可以在这里添加组件逻辑
</script>

<style scoped>
/* 组件特定的样式 */
</style>
