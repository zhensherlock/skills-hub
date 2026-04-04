import { defineAdditionalConfig } from 'vitepress'
import pkg from '../../../package.json' with { type: 'json' }

// https://vitepress.dev/reference/site-config
export default defineAdditionalConfig({
  description: '基于企查查 MCP 的企业调查与分析工具集',
  themeConfig: {
    nav: [
      { text: '首页', link: '/zh/' },
      { text: '指南', link: '/zh/guide/getting-started', activeMatch: '/guide/' },
      {
        text: pkg.version,
        items: [
          {
            text: 'Changelog',
            link: 'https://github.com/zhensherlock/skills-hub/releases',
          },
        ],
      },
    ],

    sidebar: [
      {
        text: '简介',
        items: [
          { text: '什么是 Skills Hub？', link: '/zh/guide/what-is-it' },
          { text: '快速开始', link: '/zh/guide/getting-started' },
        ],
      },
    ],
  },
})
