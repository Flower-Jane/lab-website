import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Members from '../views/Members.vue'
import Research from '../views/Research.vue'
import Publications from '../views/Publications.vue'
import Recruitment from '../views/Recruitment.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/members',
      name: 'members',
      component: Members
    },
    {
      path: '/research',
      name: 'research',
      component: Research
    },
    {
      path: '/publications',
      name: 'publications',
      component: Publications
    },
    {
      path: '/recruitment',
      name: 'recruitment',
      component: Recruitment
    }
  ]
})

export default router
