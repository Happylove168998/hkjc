#!/bin/bash
# ============================================================
#  AI-BOY OS — 仓库重建脚本
#  本地路径 : /root/hkjc
#  远程仓库 : https://github.com/Happylove168998/hkjc
#  提交信息 : Initialize AI-BOY OS and clean old repository
# ============================================================

set -e

REPO_DIR="/root/hkjc"
GITHUB_URL="https://github.com/Happylove168998/hkjc.git"
BRANCH="main"
GIT_USER="Happy-boy"
GIT_EMAIL="happylove168998@users.noreply.github.com"
COMMIT_MSG="Initialize AI-BOY OS and clean old repository"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║         AI-BOY OS — 仓库重建脚本 启动               ║"
echo "╚══════════════════════════════════════════════════════╝"

# ── Step 1: 进入仓库 ─────────────────────────────────────────
echo ""
echo "▶ Step 1 / 进入本地仓库 $REPO_DIR ..."
cd "$REPO_DIR"
echo "   ✅ 当前目录: $(pwd)"

# ── Step 2: 清空所有文件（保留 .git） ────────────────────────
echo ""
echo "▶ Step 2 / 清空仓库文件（保留 .git）..."
find . -mindepth 1 \
  -not -path './.git' \
  -not -path './.git/*' \
  -delete
echo "   ✅ 所有旧文件已删除"

# ── Step 3: 创建 AI-BOY OS 项目结构 ─────────────────────────
echo ""
echo "▶ Step 3 / 创建 AI-BOY OS 项目结构..."

# 目录骨架
mkdir -p frontend/pages
mkdir -p backend/routes
mkdir -p ai-engine
mkdir -p data-engine
mkdir -p crawler
mkdir -p automation
mkdir -p dashboard

# ── README.md ─────────────────────────────────────────────────
cat > README.md << 'EOF'
# 🤖 AI-BOY OS

> 智能助手操作系统 — 核心项目

## 项目结构

```
AI-BOY-OS/
├── frontend/           前端界面层
│   └── pages/
│       ├── dashboard.tsx
│       └── data-center.tsx
├── backend/            后端服务层
│   ├── main.py
│   └── routes/
├── ai-engine/          AI 推理引擎
├── data-engine/        数据处理引擎
├── crawler/            数据爬取模块
├── automation/         自动化任务模块
└── dashboard/          可视化仪表盘
```

## 快速开始

```bash
# 启动后端
cd backend && python main.py

# 启动前端
cd frontend && npm run dev
```

## 维护者
Happy-boy
EOF

# ── .gitignore ────────────────────────────────────────────────
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.pyc
*.pyo
.venv/
venv/
*.egg-info/

# Node
node_modules/
.next/
dist/
build/

# 环境变量
.env
.env.local
.env.*.local

# 系统
.DS_Store
Thumbs.db

# 编辑器
.vscode/
.idea/
*.swp

# 日志
*.log
logs/
EOF

# ── frontend/pages/dashboard.tsx ─────────────────────────────
cat > frontend/pages/dashboard.tsx << 'EOF'
import React from "react";

const Dashboard: React.FC = () => {
  return (
    <div className="dashboard">
      <h1>🤖 AI-BOY OS — Dashboard</h1>
      <p>系统状态监控中心</p>
    </div>
  );
};

export default Dashboard;
EOF

# ── frontend/pages/data-center.tsx ───────────────────────────
cat > frontend/pages/data-center.tsx << 'EOF'
import React from "react";

const DataCenter: React.FC = () => {
  return (
    <div className="data-center">
      <h1>📊 AI-BOY OS — Data Center</h1>
      <p>数据中心 — 实时数据管理与分析</p>
    </div>
  );
};

export default DataCenter;
EOF

# ── frontend/package.json ─────────────────────────────────────
cat > frontend/package.json << 'EOF'
{
  "name": "ai-boy-os-frontend",
  "version": "1.0.0",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.0.0",
    "react-dom": "^18.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/react": "^18.0.0"
  }
}
EOF

# ── backend/main.py ───────────────────────────────────────────
cat > backend/main.py << 'EOF'
"""
AI-BOY OS — 后端主程序
"""
from fastapi import FastAPI
from backend.routes import router

app = FastAPI(
    title="AI-BOY OS API",
    description="AI-BOY OS 后端接口服务",
    version="1.0.0"
)

app.include_router(router)

@app.get("/health")
def health_check():
    return {"status": "ok", "system": "AI-BOY OS", "version": "1.0.0"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
EOF

# ── backend/routes/__init__.py ────────────────────────────────
cat > backend/routes/__init__.py << 'EOF'
from fastapi import APIRouter

router = APIRouter()

@router.get("/api/status")
def get_status():
    return {"agent": "Happy-boy", "status": "running"}
EOF

# ── backend/requirements.txt ──────────────────────────────────
cat > backend/requirements.txt << 'EOF'
fastapi>=0.100.0
uvicorn>=0.23.0
pydantic>=2.0.0
httpx>=0.24.0
EOF

# ── ai-engine ─────────────────────────────────────────────────
cat > ai-engine/README.md << 'EOF'
# 🧠 AI Engine

AI 推理引擎模块 — 负责模型调用、推理管线、Agent 任务编排。

## 模块规划
- `model/`    模型加载与推理
- `agent/`    Agent 任务调度
- `memory/`   上下文记忆管理
EOF
touch ai-engine/.gitkeep

# ── data-engine ───────────────────────────────────────────────
cat > data-engine/README.md << 'EOF'
# 📦 Data Engine

数据处理引擎 — 负责数据清洗、转换、存储管线。

## 模块规划
- `pipeline/`   数据流水线
- `storage/`    数据存储适配器
- `transform/`  数据转换处理器
EOF
touch data-engine/.gitkeep

# ── crawler ───────────────────────────────────────────────────
cat > crawler/README.md << 'EOF'
# 🕷️ Crawler

数据爬取模块 — 负责外部数据源抓取与解析。

## 模块规划
- `spiders/`    爬虫任务
- `parsers/`    数据解析器
- `scheduler/`  任务调度器
EOF
touch crawler/.gitkeep

# ── automation ────────────────────────────────────────────────
cat > automation/README.md << 'EOF'
# ⚙️ Automation

自动化任务模块 — 负责定时任务、工作流自动化。

## 模块规划
- `tasks/`      自动化任务定义
- `triggers/`   触发器管理
- `workflows/`  工作流编排
EOF
touch automation/.gitkeep

# ── dashboard ─────────────────────────────────────────────────
cat > dashboard/README.md << 'EOF'
# 📊 Dashboard

可视化仪表盘 — 系统监控、数据可视化。

## 模块规划
- `widgets/`    仪表盘组件
- `charts/`     图表模块
- `alerts/`     告警管理
EOF
touch dashboard/.gitkeep

echo "   ✅ AI-BOY OS 项目结构创建完成"

# ── Step 4: 初始化 Git ────────────────────────────────────────
echo ""
echo "▶ Step 4 / 初始化 Git..."
git init
git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"
git remote remove origin 2>/dev/null || true
git remote add origin "$GITHUB_URL"
echo "   ✅ Git 初始化完成，远程已绑定: $GITHUB_URL"

# ── Step 5: git add . ─────────────────────────────────────────
echo ""
echo "▶ Step 5 / git add ."
git add .
echo "   ✅ 所有文件已暂存"

# ── Step 6: git commit ────────────────────────────────────────
echo ""
echo "▶ Step 6 / git commit..."
git commit -m "$COMMIT_MSG"
echo "   ✅ 提交成功"

# ── Step 7: git push --force ──────────────────────────────────
echo ""
echo "▶ Step 7 / git push --force → $BRANCH ..."
git branch -M "$BRANCH"
git push -u origin "$BRANCH" --force
echo "   ✅ Push 完成"

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║   🎉 AI-BOY OS 部署完成！                           ║"
echo "╠══════════════════════════════════════════════════════╣"
echo "║   📁 本地路径 : /root/hkjc                          ║"
echo "║   🌐 远程仓库 : https://github.com/Happylove168998/hkjc ║"
echo "║   🌿 分支     : main                                 ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""
cat > /root/setup-aiboy-os.sh << 'SCRIPT'
#!/bin/bash
set -e
cd /root/hkjc
find . -mindepth 1 -not -path './.git' -not -path './.git/*' -delete
mkdir -p frontend/pages backend/routes ai-engine data-engine crawler automation dashboard
echo "# AI-BOY OS" > README.md
touch frontend/pages/dashboard.tsx frontend/pages/data-center.tsx
touch backend/main.py backend/routes/__init__.py
touch ai-engine/.gitkeep data-engine/.gitkeep crawler/.gitkeep automation/.gitkeep dashboard/.gitkeep
git init
git config user.name "Happy-boy"
git config user.email "happylove168998@users.noreply.github.com"
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/Happylove168998/hkjc.git"
git add .
git commit -m "Initialize AI-BOY OS and clean old repository"
git branch -M main
git push -u origin main --force
SCRIPT
chmod +x /root/setup-aiboy-os.sh
./setup-aiboy-os.sh
