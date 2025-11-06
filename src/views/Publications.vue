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

        <input
            type="text"
            v-model="searchQuery"
            placeholder="搜索论文名、期刊或会议..."
            style="padding: 8px 12px; border: 1px solid #ddd; border-radius: 5px; font-size: 1rem; min-width: 250px;"
          />
        </div>
      </div>
    </div>

    <div v-if="filteredPublications.length === 0" class="card" style="text-align: center; padding: 60px;">
      <p style="font-size: 1.2rem; color: #666;">暂无符合条件的论文</p>
    </div>

    <div v-if="filteredPublications.length > 0" class="card">
      <ol class="publication-list">
        <li v-for="pub in paginatedPublications" :key="pub.id" class="publication-item">
          
          <div class="pub-line-1">
            <a :href="pub.link || pub.pdf || '#'" class="pub-title" target="_blank">
              {{ pub.title }}
            </a>
            <span class="pub-venue">, {{ pub.venue }}, {{ pub.year }}.</span>
            <span v-if="pub.ccfLevel" :class="`pub-ccf ccf-${pub.ccfLevel}`">
              (CCF {{ pub.ccfLevel }})
            </span>
          </div>
          
          <div class="pub-line-2">
            {{ pub.authors }}
          </div>

        </li>
      </ol>
    </div>
    <div v-if="totalPages > 1" class="pagination-controls">
      <button @click="prevPage" :disabled="currentPage === 1" class="page-btn">
        &laquo; 上一页
      </button>
      <span v-for="page in totalPages" :key="page">
        <button 
          @click="goToPage(page)" 
          :class="['page-btn', { 'active': page === currentPage }]">
          {{ page }}
        </button>
      </span>
      <button @click="nextPage" :disabled="currentPage === totalPages" class="page-btn">
        下一页 &raquo;
      </button>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue'

// --- 筛选状态 ---
const selectedYear = ref('all')
const searchQuery = ref('') // 

// --- 分页状态 ---
const currentPage = ref(1)
const itemsPerPage = ref(10) // <-- 每页显示条目数

// --- 原始数据 (包含所有年份) ---
const publications = ref([
  {
    id: 1,
    title: 'Comprehensive Assessment and Analysis for NSFW Content Erasure in Text-to-Image Diffusion models',
    authors: 'Die Chen, Zhiwen Li, Cen Chen*, Yuexiang Xie, Xiaodan Li, Jinyan Ye, Yingda Chen, Yaliang Li',
    venue: 'NeurIPS',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2502.12527'
  },
  {
    id: 2,
    title: 'AdaPatch:Adaptive Patch-Level Modeling for Non-Stationary Time Series Forecasting',
    authors: 'Kun Liu, Zhongjie Duan, Cen Chen*, Yanhao Wang, Dawei Cheng and Yuqi Liang',
    venue: 'CIKM',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://openreview.net/forum?id=5BqDSw8r5j' // 沿用你示例中的链接
  },
  {
    id: 3,
    title: 'Towards Instance-wise Personalized Federated Learning via Semi-Implicit Bayesian Prompt Tuning',
    authors: 'Tiandi Ye, Wenyan Liu, Kai Yao, Lichun Li, Shangchao Su, Cen Chen*, Xiang Li, Shan Yin and Ming Gao',
    venue: 'CIKM',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2508.19621'
  },
  {
    id: 4,
    title: 'CSMD: Curated Multimodal Dataset for Chinese Stock Analysis',
    authors: 'Yu Liu, Zhuoying Li, Ruifeng Yang, Fengran Mo, Cen Chen*',
    venue: 'CIKM',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2511.01318'
  },
  {
    id: 5,
    title: 'Densest Subgraph Discovery on Decentralized Graphs with Local Edge Differential Privacy',
    authors: 'Wenping Tong, Yi Zhou, Yanhao Wang, Cen Chen, Minghao Zhao',
    venue: 'CIKM',
    year: 2025,
    ccfLevel: 'B',
    link: '#'
  },
  {
    id: 6,
    title: 'Paeformer: Patch-wise Representation Learning with Autoencoders for Multivariate Time Series Forecasting',
    authors: 'Kun Liu, Zhongjie Duan, Cen Chen*',
    venue: 'ECAI',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://www.researchgate.net/publication/396787419_Paeformer_Patch-Wise_Representation_Learning_with_Autoencoder_for_Multivariate_Time_Series_Forecasting'
  },
  {
    id: 7,
    title: 'ELfolio: Strategy Evolution via Large Language Models for Portfolio Optimization',
    authors: 'Xirui Zeng, Cen Chen*, Yanhao Wang, Yuqi Liang',
    venue: 'arXiv', 
    year: 2025,
    ccfLevel: null,
    link: '#'
  },
  {
    id: 8,
    title: 'Refiner: Data Refining against Gradient Leakage Attacks in Federated Learning',
    authors: 'Mingyuan Fan, Cen Chen*, Chengyu Wang, Xiaodan Li, Wenmeng Zhou',
    venue: 'Usenix Security',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2212.02042'
  },
  {
    id: 9,
    title: 'Boosting Gradient Leakage Attacks: Data Reconstruction in Realistic FL Settings',
    authors: 'Mingyuan Fan, Fuyi Wang, Cen Chen*, Jianying Zhou',
    venue: 'Usenix Security',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2506.08435'
  },
  {
    id: 10,
    title: 'LSSF: Safety Alignment for Large Language Models through Low-Rank Safety Subspace Fusion',
    authors: 'Guanghao Zhou, Panjia Qiu, Cen Chen*, Hongyu Lo, Jason Chu, Xin zhang, Jun Zhou',
    venue: 'ACL',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://aclanthology.org/2025.acl-long.1479/'
  },
  {
    id: 11,
    title: 'AgentStory: A Multi-Agent System for Story Visualization with Multi-Subject Consistent Text-to-Image Generation',
    authors: 'Tianchen Zhou, Zhongjie Duan, Cen Chen*, Wenmeng Zhou, Yanhao Wang, Yaliang Li',
    venue: 'ICMR',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/abs/10.1145/3731715.3733271'
  },
  {
    id: 12,
    title: 'ExVideo: Extending Video Diffusion Models via Parameter-Efficient Post-Tuning',
    authors: 'Zhongjie Duan, Hong Zhang, Wenmeng Zhou, Cen Chen*, Yaliang Li, Yu Zhang, Yingda Chen',
    venue: 'IJCAI',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2406.14130'
  },
  {
    id: 13,
    title: 'FastBlend: Enhancing Video Stylization Consistency via Model-Free Patch Blending',
    authors: 'Zhongjie Duan, Chengyu Wang, Cen Chen*, Weining Qian, Jun Huang, Mingyi Jin',
    venue: 'IJCAI',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://chywang.github.io/papers/ijcai2025c.pdf'
  },
  {
    id: 14,
    title: 'Enhancing Portfolio Optimization via Heuristic-Guided Inverse Reinforcement Learning with Multi-Objective Reward and Graph-based Policy Learning',
    authors: 'Wenyi Zhang, Renjun Jia, Yanhao Wang, Dawei Cheng, Minghao Zhao, Cen Chen',
    venue: 'IJCAI',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://ijcai-preprints.s3.us-west-1.amazonaws.com/2025/9050.pdf'
  },
  {
    id: 15,
    title: 'Boosting Dataset Distillation with the Assistance of Crucial Samples for Visual Learning',
    authors: 'Xiaodan Li, Yao Zhu, Yuefeng Chen, Cen Chen*, Jianmei Guo, Shuhui Wang',
    venue: 'IEEE TMM',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://ieeexplore.ieee.org/abstract/document/11195723'
  },
  {
    id: 16,
    title: 'SLPerf: A Research Library and Benchmark Framework for Split Learning',
    authors: 'Zhanyi Hu, Tianchen Zhou, Bingzhe Wu, Cen Chen*, Yanhao Wang',
    venue: 'DAIS@ICDE',
    year: 2025,
    ccfLevel: null,
    link: 'https://ieeexplore.ieee.org/abstract/document/11108142/'
  },
  {
    id: 17,
    title: 'On the Trustworthiness Landscape of State-of-the-art Generative Models: A Survey and Outlook',
    authors: 'Mingyuan Fan, Chengyu Wang, Cen Chen*, Yang Liu, Jun Huang',
    venue: 'IJCV',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://link.springer.com/article/10.1007/s11263-025-02375-w'
  },
  {
    id: 18,
    title: 'A Review and Experimental Evaluation on Split Learning',
    authors: 'Zhanyi Hu, Tianchen Zhou, Bingzhe Wu, Cen Chen*, Yanhao Wang',
    venue: 'Future Internet',
    year: 2025,
    ccfLevel: null,
    link: 'https://www.mdpi.com/1999-5903/17/2/87'
  },
  {
    id: 19,
    title: 'Bad-PFL: Exploiting Backdoor Attacks against Personalized Federated Learning',
    authors: 'Mingyuan Fan, Zhanyi Hu, Fuyi Wang, Cen Chen*',
    venue: 'ICLR',
    year: 2025,
    ccfLevel: null,
    link: 'https://arxiv.org/abs/2501.12736'
  },
  {
    id: 20,
    title: 'Growth Inhibitors for Suppressing Inappropriate Image Concepts in Diffusion Models',
    authors: 'Die Chen, Zhiwen Li, Mingyuan Fan, Cen Chen*, Wenmeng Zhou, Yanhao Wang, Yaliang Li',
    venue: 'ICLR',
    year: 2025,
    ccfLevel: null,
    link: 'https://arxiv.org/abs/2408.01014'
  },
  {
    id: 21,
    title: 'Responsible Diffusion Models via Constraining Text Embeddings within Safe Regions',
    authors: 'Zhiwen Li, Die Chen, Mingyuan Fan, Cen Chen*, Yaliang Li, Yanhao Wang, Wenmeng Zhou',
    venue: 'TheWebConf(Best Student Paper Award)',
    year: 2025,
    ccfLevel: 'A',
    link: 'https://dl.acm.org/doi/abs/10.1145/3696410.3714912'
  },
  {
    id: 22,
    title: 'Exploiting Pre-Trained Models and Low-Frequency Preference for Cost-Effective Transfer-based Attack',
    authors: 'Mingyuan Fan, Cen Chen*, Chengyu Wang, Jun Huang',
    venue: 'TKDD',
    year: 2025,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/abs/10.1145/3680553'
  },
  {
    id: 23,
    title: 'Transferable Adversarial Examples with Bayesian Approach',
    authors: 'Mingyuan Fan, Cen Chen*, Wenmeng Zhou, Yinggui Wang',
    venue: 'AsiaCCS',
    year: 2025,
    ccfLevel: null,
    link: 'https://dl.acm.org/doi/abs/10.1145/3708821.3710827'
  },
  {
  id: 24,
    title: 'Transferability Bound Theory: Exploring Relationship between Adversarial Transferability and Flatness',
    authors: 'Mingyuan Fan, Xiaodan Li, Cen Chen*, Wenmeng Zhou, Yaliang Li',
    venue: 'NeurIPS',
    year: 2024,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2311.06423'
  },
  {
    id: 25,
    title: 'Privacy Evaluation Benchmarks for NLP Models',
    authors: 'Wei Huang, Yinggui Wang, Cen Chen',
    venue: 'EMNLP Findings',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2409.15868v3'
  },
  {
    id: 26,
    title: 'Predicting stock market trends with self-supervised learning',
    authors: 'Zelin Ying, Dawei Cheng, Cen Chen, Xiang Li, Peng Zhu, Yifeng Luo, Yuqi Liang',
    venue: 'Neurocomputing(SCI)',
    year: 2024,
    ccfLevel: null,
    link: 'https://www.sciencedirect.com/science/article/abs/pii/S0925231223011566'
  },
  {
    id: 27,
    title: 'FedMCP: Parameter-Efficient Federated Learning with Model-Contrastive Personalization',
    authors: 'Qianyi Zhao, Chen Qu, Cen Chen*, Mingyuan Fan, Yanhao Wang.',
    venue: 'ICPADS',
    year: 2024,
    ccfLevel: null,
    link: 'https://arxiv.org/abs/2409.00116'
  },
  {
    id: 28,
    title: 'FedPAB: Federated Medical Image Segmentation with Personalized Attention and Boundary-oriented Learning',
    authors: 'Xinyv Li, Cen Chen*, and Jamie Cui',
    venue: 'BIBM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://www.computer.org/csdl/proceedings-article/bibm/2024/10822730/23oodSdqIbC'
  },
  {
    id: 29,
    title: 'LST2A: Lexical-Syntactic Targeted Adversarial Attack for Texts',
    authors: 'Guanghao Zhou, Panjia Qiu, Mingyan Fan, Cen Chen*, Yaliang Li and Wenmeng Zhou',
    venue: 'CIKM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3627673.3679640'
  },
  {
    id: 30,
    title: 'SGFL-Attack: A Similarity-Guidance Strategy for Hard-Label Textual Adversarial Attack Based on Feedback Learning',
    authors: 'Panjia Qiu, Guanghao Zhou, Mingyuan Fan, Cen Chen*, Yaliang Li and Wenming Zhou',
    venue: 'CIKM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3627673.3679639'
  },
  {
    id: 31,
    title: 'PAI-Diffusion: Constructing and Serving a Family of Open Chinese Diffusion Models for Text-to-image Synthesis on the Cloud',
    authors: 'Chengyu Wang, Zhongjie Duan, Bingyan Liu, Xinyi Zou, Cen Chen, Kui Jia, Jun Huang',
    venue: 'ACL',
    year: 2024,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2309.05534'
  },
  {
    id: 32,
    title: 'DiffSynth: Latent In-Iteration Deflickering for Realistic Video Synthesis',
    authors: 'Zhongjie Duan, Lizhou You, Chengyu Wang, Cen Chen*, Ziheng Wu, Weining Qian, Jun Huang',
    venue: 'ECML PKDD',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1007/978-3-031-70381-2_21'
  },
  {
    id: 33,
    title: 'DPSW-Sketch: A Differentially Private Sketch Framework for Frequency Estimation over Sliding Windows',
    authors: 'Yiping Wang, Yanhao Wang, Cen Chen',
    venue: 'KDD',
    year: 2024,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2406.07953'
  },
  {
    id: 34,
    title: 'Approximate Kernel Density Estimation under Metric-based Local Differential Privacy',
    authors: 'Yi Zhou, Yanhao Wang, Long Teng, Qiang Huang, Cen Chen',
    venue: 'UAI',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://openreview.net/forum?id=FFsbpo2fwF'
  },
  {
    id: 35,
    title: 'Diffutoon: High-Resolution Editable Toon Shading via Diffusion Models',
    authors: 'Zhongjie Duan, Chengyu Wang, Cen Chen*, Weining Qian, Jun Huang',
    venue: 'IJCAI',
    year: 2024,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2401.16224'
  },
  {
    id: 36,
    title: 'TaiChi: Improving the Robustness of NLP Models by Seeking Common Ground While Reserving Differences',
    authors: 'Huimin Chen, Chengyu Wang, Yanhao Wang, Cen Chen*, Yinggui Wang',
    venue: 'COLING',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://aclanthology.org/2024.lrec-main.1351/'
  },
  {
    id: 37,
    title: 'BapFL: You can Backdoor Personalized Federated Learning',
    authors: 'Tiandi Ye, Cen Chen*, Yinggui Wang, Xiang Li, Ming Gao',
    venue: 'TKDD(SCI I区)',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2307.15971'
  },
  {
    id: 38,
    title: 'DualToken-ViT: Position-aware Efficient Vision Transformer with Dual Token Fusion',
    authors: 'Zhenzhen Chu, Jiayu Chen, Cen Chen*, Chengyu Wang, Ziheng Wu, Jun Huang, Weining Qian',
    venue: 'SDM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2309.12424'
  },
  {
    id: 39,
    title: 'UPFL: Unsupervised Personalized Federated Learning towards New Clients',
    authors: 'Tiandi Ye, Cen Chen*, Yinggui Wang, Xiang Li, Ming Gao',
    venue: 'SDM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2307.15994'
  },
  {
    id: 40,
    title: 'Guardian: Guarding against Gradient Leakage with Provable Defense for Federated Learning',
    authors: 'Mingyuan Fan, Yang Liu, Cen Chen*, Chengyu Wang, Minghui Qiu, Wenmeng Zhou',
    venue: 'WSDM',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3616855.3635758'
  },
  {
    id: 41,
    title: 'Accelerating BERT inference with GPU-efficient exit prediction',
    authors: 'Lei Li , Chengyu Wang , Minghui Qui , Cen Chen*, Ming Gao, and Aoying Zhou',
    venue: 'Frontiers of Computer Science',
    year: 2024,
    ccfLevel: 'B',
    link: 'https://openreview.net/forum?id=qTfr01HvpX'
  },
  // --- 2023 年论文 (16 篇) ---
  {
    id: 42,
    title: 'Federated Submodular Maximization with Differential Privacy',
    authors: 'Yanhao Wang, Tianchen Zhou, Cen Chen*, and Yinggui Wang',
    venue: 'IEEE Internet of Things Journal (SCI I区)',
    year: 2023,
    ccfLevel: null,
    link: 'https://ieeexplore.ieee.org/document/10286024/'
  },
  {
    id: 43,
    title: 'Learning Knowledge-Enhanced Contextual Language Representations for Domain Natural Language Understanding',
    authors: 'Taolin Zhang, Ruyao Xu, Chengyu Wang, Zhongjie Duan, Cen Chen*, Minghui Qiu, Dawei Cheng, Xiaofeng He, Weining Qian',
    venue: 'EMNLP',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2311.06761'
  },
  {
    id: 44,
    title: 'DocAsRef: A Pilot Empirical Study on Repurposing Reference-based Summary Quality Metrics as Reference-free Metrics',
    authors: 'Forrest Sheng Bao, Ruixuan Tu, Ge Luo, Yinfei Yang, Hebi Li, Minghui Qiu, Youbiao He, and Cen Chen',
    venue: 'Findings of EMNLP',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2212.10013'
  },
  {
    id: 45,
    title: 'Optimal Linear Subspace Search: Learning to Construct Fast and High-Quality Schedulers for Diffusion Models',
    authors: 'Zhongjie Duan, Chengyu Wang, Cen Chen*, Jun Huang, and Weining Qian',
    venue: 'CIKM',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2305.14677'
  },
  {
    id: 46,
    title: 'Online Efficient Secure Logistic Regression based on Function Secret Sharing',
    authors: 'Jing Liu, Jamie Cui, and Cen Chen*',
    venue: 'CIKM',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2309.09486?context=cs'
  },
  {
    id: 47,
    title: 'Learning Invariant Representations for New Product Sales Forecasting via Multi-Granularity Adversarial Learning',
    authors: 'Zhenzhen Chu, Chengyu Wang, Cen Chen*, Yuqi Liang, Dawei Cheng, and Weining Qian',
    venue: 'CIKM',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3583780.3615219'
  },
  {
    id: 48,
    title: 'On the Robustness of Split Learning against Adversarial Attacks',
    authors: 'Mingyuan Fan, Cen Chen*, Chengyu Wang, Wenmeng Zhou, and Jun Huang',
    venue: 'ECAI',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2307.07916'
  },
  {
    id: 49,
    title: 'SLPerf: a Unified Framework for Benchmarking Split Learning',
    authors: 'Tianchen Zhou, Zhanyi Hu, Bingzhe Wu, and Cen Chen*',
    venue: 'FL-IJCAI',
    year: 2023,
    ccfLevel: null,
    link: 'https://arxiv.org/abs/2304.01502'
  },
  {
    id: 50,
    title: 'Rapid Diffusion: Building Domain-Specific Text-to-Image Synthesizers with Fast Inference Speed',
    authors: 'Bingyan Liu, Weifeng Lin, Zhongjie Duan, Chengyu Wang, Wu Ziheng, Zhang Zipeng, Kui Jia, Lianwen Jin, Cen Chen, and Jun Huang',
    venue: 'ACL',
    year: 2023,
    ccfLevel: 'A',
    link: 'https://aclanthology.org/2023.acl-industry.28/'
  },
  {
    id: 51,
    title: 'Customized Text Sanitization Mechanism with Differential Privacy',
    authors: 'Huimin Chen, Fengran Mo, Yanhao Wang, Cen Chen*, Jian-Yun Nie, Chengyu Wang, and Jamie Cui',
    venue: 'Findings of ACL',
    year: 2023,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2207.01193'
  },
  {
    id: 52,
    title: 'XtremeCLIP: Extremely Parameter-efficient Tuning for Low-resource Vision Language Understanding',
    authors: 'Moming Tang, Chengyu Wang, Jianing Wang, Cen Chen*, and Weining Qian',
    venue: 'Findings of ACL',
    year: 2023,
    ccfLevel: 'A',
    link: 'https://aclanthology.org/2023.findings-acl.397/'
  },
  {
    id: 53,
    title: 'ParaSum: Contrastive Paraphrasing for Low-resource Extractive Text Summarization',
    authors: 'Moming Tang, Chengyu Wang, Jianing Wang, Cen Chen*, Ming Gao, and Weining Qian',
    venue: 'KSME',
    year: 2023,
    ccfLevel: null,
    link: 'https://dl.acm.org/doi/10.1007/978-3-031-40289-0_9'
  },
  {
    id: 54,
    title: 'Resizing Codebook of Vector Quantization Without Retraining',
    authors: 'Lei Li, Tingting Liu, Chengyu Wang, Minghui Qiu, Cen Chen*, Ming Gao, and Aoying Zhou',
    venue: 'Multimedia Systems (SCI)',
    year: 2023,
    ccfLevel: null,
    link: 'https://dl.acm.org/doi/abs/10.1007/s00530-023-01065-2'
  },
  {
    id: 55,
    title: 'Match4Match: Enhancing Text-Video Retrieval by Maximum Flow with Minimum Cost',
    authors: 'Zhongjie Duan, Chengyu Wang, Cen Chen*, Wenmeng Zhou, Jun Huang, and Weining Qian',
    venue: 'WWW',
    year: 2023,
    ccfLevel: 'A',
    link: 'https://dl.acm.org/doi/10.1145/3543507.3583365'
  },
  {
    id: 56,
    title: 'Robust Clustered Federated Learning',
    authors: 'Tiandi Ye, Senhui Wei, Jamie Cui, Cen Chen*, Yingnan Fu, and Ming Gao',
    venue: 'DASFAA',
    year: 2023,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1007/978-3-031-30637-2_45'
  },
  {
    id: 57,
    title: 'Communication Efficient Federated Learning via Channel-wise Dynamic Pruning',
    authors: 'Bo Tao, Cen Chen*, and Huimin Chen',
    venue: 'IEEE WCNC',
    year: 2023,
    ccfLevel: null,
    link: 'https://ieeexplore.ieee.org/document/10118879'
  },

  // --- 2022 年论文 (11 篇) ---
  {
    id: 58,
    title: 'A Weakly Supervised Approach to Evaluating Single-Document Summarization via Negative Sampling',
    authors: 'Forrest Bao, Ge Luo, Hebi Li, Minghui Qiu, Yinfei Yang, Youbiao He, and Cen Chen',
    venue: 'NAACL',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2005.06377'
  },
  {
    id: 59,
    title: 'Optimal Action Space Search: An Effective Deep Reinforcement Learning Method for Algorithmic Trading',
    authors: 'Zhongjie Duan, Cen Chen*, Dawei Cheng, Yuqi Liang, and Weining Qian',
    venue: 'CIKM',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3511808.3557412'
  },
  {
    id: 60,
    title: 'Learning to Generalize in Heterogeneous Federated Networks',
    authors: 'Cen Chen, Tiandi Ye, Li Wang, and Ming Gao',
    venue: 'CIKM',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3511808.3557378'
  },
  {
    id: 61,
    title: 'FedFAIM: A Model Performance-based Fair Incentive Mechanism for Federated Learning',
    authors: 'Zhuan Shi, Lan Zhang, Zhenyu Yao, Lingjuan Lyu, Cen Chen, Li Wang, Junhao Wang, and Xiang-Yang Li',
    venue: 'Transactions on Big Data (SCI)',
    year: 2022,
    ccfLevel: null,
    link: 'https://ieeexplore.ieee.org/document/9797864'
  },
  {
    id: 62,
    title: 'Understanding Long Programming Languages with Structure-Aware Sparse Attention',
    authors: 'Tingting Liu, Chengyu Wang, Cen Chen*, Ming Gao, and Aoying Zhou',
    venue: 'SIGIR',
    year: 2202,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2205.13730'
  },
  {
    id: 63,
    title: 'Combating False Sense of Security: Breaking the Defense of Adversarial Training via Non-Gradient Adversarial Attack',
    authors: 'Mingyuan Fan, Yang Liu, Cen Chen, Shengxing Yu, Wenzhong Guo, and Ximeng Liu',
    venue: 'ICASSP',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://ieeexplore.ieee.org/document/9746138'
  },
  {
    id: 64,
    title: 'TaskSum: Task-Driven Extractive Text Summarization for Long News Documents Based on Reinforcement Learning',
    authors: 'Moming Tang, Dawei Cheng, Cen Chen*, Yuqi Liang, Yifeng Luo, and Weining Qian',
    venue: 'DASFAA',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/abs/10.1007/978-3-031-00129-1_25'
  },
  {
    id: 65,
    title: 'Multi-scale Time Based Stock Appreciation Ranking Prediction via Price Co-movement Discrimination',
    authors: 'Ruyao Xu, Dawei Cheng, Cen Chen*, Siqiang Luo, Yifeng Luo, and Weining Qian',
    venue: 'DASFAA',
    year: 2022,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1007/978-3-031-00129-1_39'
  },
  {
    id: 66,
    title: 'Towards Evaluating the Reliability of Deep Neural Networks based IoT Devices',
    authors: 'Mingyuan Fan, Yang Liu, Cen Chen, Shengxing Yu, Wenzhong Guo, Li Wang, and Ximeng Liu',
    venue: 'IEEE Internet of Things Journal (SCI I区)',
    year: 2022,
    ccfLevel: null,
    link: 'https://ieeexplore.ieee.org/document/9663531'
  },
  {
    id: 67,
    title: 'Backdoor Defense with Machine Unlearning',
    authors: 'Yang Liu, Mingyuan Fan, Cen Chen, Ximeng Liu, Zhuo Ma, Li Wang, and Jianfeng Ma',
    venue: 'INFOCOM',   
    year: 2022,
    ccfLevel: 'A',
    link: 'https://arxiv.org/abs/2201.09538'
  },
  {
    id: 68,
    title: 'Towards Scalable and Privacy-Preserving Deep Neural Network via Algorithmic-Cryptographic Co-design',
    authors: 'Jun Zhou, Longfei Zheng, Chaochao Chen, Yan Wang, Xiaolin Zheng, Bingzhe Wu, Cen Chen, Li Wang, and Jianwei Yin',
    venue: 'ACM TIST',
    year: 2022,
    ccfLevel: null,
    link: 'https://arxiv.org/abs/2012.09364'
  },
  // --- 2021 年论文 (7 篇) ---
  {
    id: 69,
    title: 'Learning to Expand: Reinforced Response Expansion for Information-seeking Conversations',
    authors: 'Haojie Pan, Cen Chen*, Chengyu Wang, Minghui Qiu, Liu Yang, Feng Ji, and Jun Huang.',
    venue: 'CIKM',
    year: 2021,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/10.1145/3459637.3481932'
  },
  {
    id: 70,
    title: 'EasyTransfer -- A Simple and Scalable Deep Transfer Learning Platform for NLP Applications',
    authors: 'Minghui Qiu , Peng Li , Chengyu Wang , Haojie Pan , Ang Wang , Cen Chen , Xianyan Jia , Yaliang Li , Jun Huang , Deng Cai , Wei Lin',
    venue: 'CIKM',
    year: 2021,
    ccfLevel: 'B',
    link: 'https://arxiv.org/abs/2011.09463'
  },
  {
    id: 71,
    title: 'Weakly-Supervised Open-Retrieval Conversational Question Answering',
    authors: 'Chen Qu, Liu Yang, Cen Chen, W. Bruce Croft, Kalpesh Krishna, Mohit Iyyer.',
    venue: 'ECIR',
    year: 2021,
    ccfLevel: null,
    link: '#'
  },
  {
    id: 72,
    title: 'Cross-domain Knowledge Distillation for Retrieval-based Question Answering Systems',
    authors: 'Cen Chen, Chengyu Wang, Minghui Qiu, Dehong Gao, Linbo Jin, and Wang Li.',
    venue: 'WWW',
    year: 2021,
    ccfLevel: 'A',
    link: 'https://dl.acm.org/doi/10.1145/3442381.3449814'
  },
  {
    id: 73,
    title: 'Privacy-preserving Optimal Insulin Dosing Decision',
    authors: 'Zuobin Ying, Shuanglong Cao, Shengmin Xu, Ximeng Liu, Lingjuan Lyu, Cen Chen, Li Wang.',
    venue: 'ICASSP',
    year: 2021,
    ccfLevel: 'B',
    link: 'https://ieeexplore.ieee.org/document/9414807/'
  },
  {
    id: 74,
    title: 'Reinforced History Backtracking for Conversational Question Answering',
    authors: 'Minghui Qiu, Xinjing Huang, Cen Chen*, Feng Ji, Chen Qu, Wei Wei, Jun Huang, and Yin Zhang.',
    venue: 'AAAI',
    year: 2021,
    ccfLevel: 'A',
    link: 'https://ojs.aaai.org/index.php/AAAI/article/view/17617'
  },
  {
    id: 75,
    title: 'CAT-BERT: A Context-Aware Transferable BERT Model for Multi-Turn MRC',
    authors: 'Cen Chen , Xinjing Huang, Feng Ji, Chengyu Wang, Minghui Qiu, Jun Huang, and Yin Zhang.',
    venue: 'DASFAA',
    year: 2021,
    ccfLevel: 'B',
    link: 'https://dl.acm.org/doi/abs/10.1007/978-3-030-73197-7_10'
  }

])

// --- 计算属性 ---

// 年份列表 (用于筛选)
const years = computed(() => {
  const yearSet = new Set(publications.value.map(p => p.year))
  // 过滤掉无效年份 (比如 null 或 undefined)，并排序
  return Array.from(yearSet).filter(y => y).sort((a, b) => b - a)
})

// 1. 先计算出所有符合筛选条件的列表 (包含搜索和年份)
const filteredPublications = computed(() => {
  const query = searchQuery.value.trim().toLowerCase()

  return publications.value.filter(pub => {
    // 检查年份匹配
    const yearMatch = selectedYear.value === 'all' || pub.year === parseInt(selectedYear.value)
    
    // 检查搜索词匹配 (使用更安全的方式，防止 title 或 venue 为 null)
    let searchMatch = true
    if (query) {
      const titleLower = (pub.title || '').toLowerCase()
      const venueLower = (pub.venue || '').toLowerCase()
      searchMatch = titleLower.includes(query) || venueLower.includes(query)
    }

    // 返回同时满足两者的结果
    return yearMatch && searchMatch
  })
})

// 2. 计算总页数
const totalPages = computed(() => {
  return Math.ceil(filteredPublications.value.length / itemsPerPage.value)
})

// 3. 根据当前页码，从筛选结果中“切片”出当前页的数据
const paginatedPublications = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value
  const end = start + itemsPerPage.value
  return filteredPublications.value.slice(start, end)
})

// --- 侦听器 ---
// 侦听筛选条件和搜索词的变化，如果变化了，自动跳回第1页
watch([selectedYear, searchQuery], () => {
  currentPage.value = 1
})

// --- 方法 ---

function goToPage(page) {
  if (page >= 1 && page <= totalPages.value) {
    currentPage.value = page
  }
}

function prevPage() {
  if (currentPage.value > 1) {
    currentPage.value--
  }
}

function nextPage() {
  if (currentPage.value < totalPages.value) {
    currentPage.value++
  }
}
</script>

<style scoped>
/* ### 修改后的样式：两行式列表 ### */
.publication-list {
  list-style: decimal; /* 1, 2, 3... */
  padding-left: 25px; /* 为数字腾出空间 */
  margin: 0;
}

.publication-item {
  padding: 12px 0;
  border-bottom: 1px solid #eee;
  line-height: 1.6;
}

.publication-item:last-child {
  border-bottom: none;
}

.pub-line-1 {
  /* 第一行：标题, Venue, CCF */
  font-size: 1.05rem;
  color: #333;
}

.pub-line-2 {
  /* 第二行：作者 */
  font-size: 0.95rem;
  color: #555;
  margin-top: 5px;
}

.pub-title {
  font-weight: 600;
  color: #667eea;
  text-decoration: none;
}
.pub-title:hover {
  text-decoration: underline;
}

.pub-venue {
  color: #444;
  font-style: italic;
  margin-left: 4px;
}

.pub-ccf {
  font-weight: bold;
  margin-left: 6px;
  white-space: nowrap;
}
.ccf-A { color: #ef4444; } /* CCF A 红色 */
.ccf-B { color: #f59e0b; } /* CCF B 橙色 */
.ccf-C { color: #10b981; } /* CCF C 绿色 */


/* --- 分页样式 (保持不变) --- */
.pagination-controls {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
  margin-top: 30px;
}

.page-btn {
  padding: 8px 14px;
  border: 1px solid #ddd;
  background-color: #fff;
  color: #667eea;
  border-radius: 5px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.2s ease;
}

.page-btn:hover:not(:disabled) {
  background-color: #f4f5fa;
  border-color: #c3c9ef;
}

.page-btn:disabled {
  color: #aaa;
  cursor: not-allowed;
  background-color: #f9f9f9;
}

.page-btn.active {
  background-color: #667eea;
  color: white;
  border-color: #667eea;
}

/* --- 假设的全局样式 (保持不变) --- */
.card {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
  padding: 20px;
  margin-bottom: 20px;
}
.page-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 20px;
  color: #333;
}

/* 筛选下拉框的简单样式 */
select {
  padding: 8px 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
  font-size: 1rem;
}
</style>