import tailwindcss from '@tailwindcss/vite'
import { isUndefined } from 'lodash-es'
import { defineConfig } from 'vitepress'
import { groupIconMdPlugin, groupIconVitePlugin } from 'vitepress-plugin-group-icons'
import llmstxt from 'vitepress-plugin-llms'
import pkg from '../../../package.json' with { type: 'json' }

const isGithubPages = isUndefined(process.env.VERCEL)
const base = isGithubPages ? '/skills-hub/' : '/'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: 'Skills Hub',
  description: '企业级技能中心 - 基于企查查 MCP 的企业调查与分析工具集',
  rewrites: {
    'en/:rest*': ':rest*',
    'en/index.md': 'index.md',
    'en/guide/what-is-it.md': 'guide/what-is-it.md',
    'en/guide/getting-started.md': 'guide/getting-started.md',
    'en/extra/examples.md': 'extra/examples.md',
  },
  base,
  head: [
    ['link', { rel: 'shortcut icon', href: `${base}logo.svg` }],
    ['link', { rel: 'apple-touch-icon', sizes: '180x180', href: `${base}logo.svg` }],
    ['meta', { name: 'baidu-site-verification', content: 'codeva-hoImtNdY4x' }],
  ],
  locales: {
    root: { label: 'English', lang: 'en-US', dir: 'ltr' },
    zh: { label: '简体中文', lang: 'zh-Hans', dir: 'ltr' },
  },
  themeConfig: {
    logo: '/logo.svg',
    socialLinks: [{ icon: 'github', link: 'https://github.com/zhensherlock/skills-hub' }],
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/getting-started', activeMatch: '/guide/' },
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

    outline: {
      level: [2, 6],
    },

    sidebar: [
      {
        text: 'Introduction',
        items: [
          { text: 'What is Skills Hub?', link: '/guide/what-is-it' },
          { text: 'Getting Started', link: '/guide/getting-started' },
        ],
      },
    ],

    search: {
      provider: 'local',
    },
  },
  markdown: {
    config(md) {
      md.use(groupIconMdPlugin)
    },
  },
  vite: {
    server: {
      open: true,
    },
    plugins: [
      tailwindcss(),
      llmstxt({
        ignoreFiles: ['en/index.md', 'zh/index.md', 'CHANGELOG.md'],
        description:
          'Enterprise skill center providing investigation and analysis tools based on QCC MCP, including due diligence, risk assessment, credit evaluation, and more.',
        sidebar: [
          {
            text: 'Introduction',
            base: '',
            items: [
              { text: 'What is Skills Hub?', link: '/guide/what-is-it' },
              { text: 'Getting Started', link: '/guide/getting-started' },
            ],
          },
        ],
        details: `\
- 🔍 Enterprise Investigation
- 🤝 Due Diligence
- 💼 Job Background Check
- 💳 Credit Assessment
- 🚀 One-Click Install
- 📊 QCC Data Source
`,
      }),
      groupIconVitePlugin(),
    ],
  },
})
