#!/bin/bash

# 企业快速风险排查 Skill 安装脚本
# 使用企查查 MCP 服务进行企业风险调查

set -e

# 版本号定义
SKILL_VERSION="v1.0.0"

echo "🚀 企业快速风险排查 Skill 安装程序"
echo "📦 当前版本: $SKILL_VERSION"
echo "=================================="
echo ""

# 检查 mcporter 是否安装
if ! command -v mcporter &> /dev/null; then
    echo "❌ 错误：未找到 mcporter 命令"
    echo "请先安装 mcporter: npm install -g mcporter"
    exit 1
fi

echo "✅ mcporter 已安装"
echo ""

# 检查 TENCENT_MEETING_TOKEN 环境变量
echo "🔍 检查企查查 API Key 环境变量..."
if [ -z "$QCC_AGENT_API_KEY" ]; then
    echo "❌ 错误：未检测到 QCC_AGENT_API_KEY 环境变量！"
    echo "请先执行以下命令设置环境变量（替换为真实 API Key）："
    echo "  export QCC_AGENT_API_KEY=\"your_actual_api_key_here\""
    echo "或在执行脚本时直接传入："
    echo "  QCC_AGENT_API_KEY=\"your_actual_api_key_here\" bash this_script.sh"
    echo ""
    echo "📋 获取 API Key：访问 https://agent.qcc.com 登录/注册获取"
    exit 1
else
    echo "✅ QCC_AGENT_API_KEY 环境变量已配置"
fi
echo ""

# 创建或更新环境变量文件
ENV_FILE="$HOME/.qcc-agent/.env"
mkdir -p "$(dirname "$ENV_FILE")"

echo "QCC_AGENT_API_KEY=$QCC_AGENT_API_KEY" > "$ENV_FILE"
echo "✅ API Key 已保存到 $ENV_FILE"
echo ""

# 安装 MCP Server
echo "📦 正在安装企查查 MCP 服务..."
echo ""

# company-server
echo "   安装 company-server..."
mcporter add company-server \
  --url "https://agent.qcc.com/mcp/company/stream" \
  --header "Authorization:Bearer $QCC_AGENT_API_KEY" \
  --transport streamable-http 2>/dev/null || true

# risk-server
echo "   安装 risk-server..."
mcporter add risk-server \
  --url "https://agent.qcc.com/mcp/risk/stream" \
  --header "Authorization:Bearer $QCC_AGENT_API_KEY" \
  --transport streamable-http 2>/dev/null || true

# ipr-server
echo "   安装 ipr-server..."
mcporter add ipr-server \
  --url "https://agent.qcc.com/mcp/ipr/stream" \
  --header "Authorization:Bearer $QCC_AGENT_API_KEY" \
  --transport streamable-http 2>/dev/null || true

# operation-server
echo "   安装 operation-server..."
mcporter add operation-server \
  --url "https://agent.qcc.com/mcp/operation/stream" \
  --header "Authorization:Bearer $QCC_AGENT_API_KEY" \
  --transport streamable-http 2>/dev/null || true

echo ""
echo "✅ MCP 服务安装完成"
echo ""

# 验证安装
echo "🔍 验证安装..."
echo ""
mcporter list | grep -E "(company-server|risk-server|ipr-server|operation-server)" || echo "⚠️  未找到已安装的 MCP 服务，请检查配置"

echo ""
echo "=================================="
echo "✅ 安装完成！"
echo ""
echo "📝 使用说明："
echo "   1. 在对话中加载技能：/skill enterprise-risk-check"
echo "   2. 然后可以说：帮我查一下 XXX 公司的风险"
echo ""
echo "🔗 企查查 MCP 服务地址："
echo "   - company-server:   https://agent.qcc.com/mcp/company/stream"
echo "   - risk-server:      https://agent.qcc.com/mcp/risk/stream"
echo "   - ipr-server:       https://agent.qcc.com/mcp/ipr/stream"
echo "   - operation-server: https://agent.qcc.com/mcp/operation/stream"
echo ""
echo "📊 本技能专注 8 个核心风险指标："
echo "   ✓ 失信信息    ✓ 被执行人    ✓ 严重违法"
echo "   ✓ 经营异常    ✓ 行政处罚    ✓ 工商登记"
echo "   ✓ 股东信息    ✓ 主要人员"
echo ""
