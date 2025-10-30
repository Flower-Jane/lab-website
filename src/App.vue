<template>
  <div id="app">
    <nav class="navbar">
      <div class="nav-container">
        <router-link to="/" class="nav-brand">
        <img 
            src="@/assets/logo.png"  
            alt="计算智能实验室logo"  
            class="nav-logo"  
        >
        计算智能实验室
        </router-link>
        <ul class="nav-menu">
          <li>
            <router-link to="/" class="nav-link">主页</router-link>
          </li>
          <li>
            <router-link to="/members" class="nav-link">成员介绍</router-link>
          </li>
          <li>
            <router-link to="/research" class="nav-link">研究方向</router-link>
          </li>
          <li>
            <router-link to="/publications" class="nav-link">发表论文</router-link>
          </li>
          <li>
            <router-link to="/recruitment" class="nav-link">实验室招生</router-link>
          </li>
        </ul>
      </div>
    </nav>
    
    <main class="main-content fade-in">
      <router-view />
    </main>
    
    <footer class="footer">
      <p>&copy; 计算智能实验室. All rights reserved.</p>
      <p>联系邮箱: cenchen@dase.ecnu.edu.cn | 欢迎与我们联系</p>
    </footer>
  </div>
</template>

<script setup>
// 这里可以添加全局的逻辑
</script>

<style>
/* 组件特定的样式可以放在这里 */
</style>
