# skills-hub

企业级技能中心 - 基于企查查 MCP 的企业调查与分析工具集

## 📦 已有 Skills

| Skill | 描述 | 使用场景 |
|-------|------|---------|
| **headhunter-verify** 🎯 | 猎头职位验证 | 验证猎头推荐职位真实性、核实企业背景 |
| **job-company-check** 💼 | 求职公司调查 | 面试前了解目标公司、评估入职风险 |
| **enterprise-risk-check** 🔍 | 企业快速风险排查 | 快速了解企业风险状况、合作可行性判断 |
| **mma-dd** 🤝 | 并购尽职调查 | 并购目标全面尽调、股权收购分析 |
| **investment-dd** 💰 | 投资尽职调查 | 被投企业尽调、估值分析、投资风险评估 |
| **customer-credit** 💳 | 客户资信评估 | 客户信用评估、赊销审查、账期审批 |
| **supplier-audit** 📋 | 供应商准入审查 | 供应商资质核查、履约能力评估 |

## 🚀 如何使用 Skills

### 方式一：下载 ZIP 包安装（推荐）

1. **下载 Skill ZIP 包**

```bash
# 下载示例（以 enterprise-risk-check 为例）
curl -L https://raw.githubusercontent.com/zhensherlock/skills-hub/main/releases/enterprise-risk-check-v1.0.0.zip -o enterprise-risk-check.zip
```

2. **解压 ZIP 包**

```bash
unzip enterprise-risk-check.zip
```

3. **设置环境变量**

```bash
# 设置企查查 API Key（必需）
export QCC_AGENT_API_KEY=xxxx

# 或添加到 ~/.zshrc / ~/.bashrc
echo 'export QCC_AGENT_API_KEY=xxxx' >> ~/.zshrc
source ~/.zshrc
```

4. **在 Agent 中加载 Skill**

使用 `use_skill` 命令加载已下载的 skill：

```
use_skill enterprise-risk-check
```

### 方式二：直接克隆仓库

```bash
# 克隆整个 skills-hub 仓库
git clone https://github.com/zhensherlock/skills-hub.git

# 设置环境变量
export QCC_AGENT_API_KEY=xxxx

# 在 Agent 中加载 skill
use_skill ./skills-hub/enterprise-risk-check
```

## ⚙️ 配置要求

### 获取 API Key

所有 Skills 都需要配置企查查 API Key：

1. 访问 https://agent.qcc.com 登录/注册
2. 在控制台获取个人 API Key
3. 配置环境变量 `QCC_AGENT_API_KEY`

> **注意**：如果未提供 API Key，所有工具调用将返回鉴权失败。

### 验证配置

```bash
# 验证环境变量是否设置成功
echo $QCC_AGENT_API_KEY

# 验证 MCP 配置（如已配置 MCP Server）
mcporter list | grep -E "(company-server|risk-server|operation-server)"
```

## 📖 使用示例

### 示例 1：猎头职位验证

```
use_skill headhunter-verify

用户：有猎头推荐 XXX 公司的职位，帮我核实一下是不是真的
```

### 示例 2：求职公司调查

```
use_skill job-company-check

用户：我收到 XXX 公司的 Offer，帮我查一下这家公司靠不靠谱
```

### 示例 3：企业快速风险排查

```
use_skill enterprise-risk-check

用户：帮我查一下"XXX 公司"靠不靠谱，能不能合作
```

### 示例 4：投资尽职调查

```
use_skill investment-dd

用户：我们准备投一个 A 轮项目，帮我做一下尽调
```

### 示例 5：供应商准入审查

```
use_skill supplier-audit

用户：我们要采购一批设备，帮我审查一下 XXX 公司能不能做供应商
```

### 示例 6：客户资信评估

```
use_skill customer-credit

用户：XXX 客户申请 60 天账期，帮我评估一下能不能批
```

## 📋 输出报告

每个 Skill 都会输出标准化的调查报告，包含：

- **风险速览**：首屏展示风险等级和核心结论
- **基本信息**：企业工商登记信息
- **风险分析**：红色/橙色/黄色风险分级展示
- **评估结论**：明确的合作/投资/入职建议
- **数据截至**：标注数据时效性

## ⚠️ 注意事项

1. **数据时效性**：所有报告数据截至查询日期，建议定期复查
2. **API 限制**：注意企查查 API 的调用频率限制
3. **信息核实**：重要信息建议通过多源验证
4. **风险提示**：发现红色风险必须明确提示
5. **建议明确**：每个 Skill 都会给出明确的结论和建议

## 📄 License

MIT
