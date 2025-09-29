# 🚀 Vercel 部署指南

## 问题解决方案

如果您在 Vercel 部署时遇到 "Couldn't find any `pages` or `app` directory" 错误，请按照以下步骤解决：

### 1. 检查项目结构

确保您的项目根目录包含以下文件结构：

```
password-generator/
├── app/
│   ├── globals.css
│   ├── layout.tsx
│   └── page.tsx
├── components/
│   └── password-generator.tsx
├── lib/
│   └── utils.ts
├── package.json
├── next.config.mjs
├── tsconfig.json
└── tailwind.config.js
```

### 2. 确保文件编码正确

所有文件都应该使用 UTF-8 编码，没有 BOM。

### 3. 提交代码到 Git

```bash
git add .
git commit -m "Fix Vercel deployment"
git push origin main
```

### 4. 在 Vercel 中重新部署

1. 登录 [Vercel Dashboard](https://vercel.com/dashboard)
2. 找到您的项目
3. 点击 "Redeploy" 按钮
4. 或者删除项目重新导入

### 5. 如果问题仍然存在

尝试以下解决方案：

#### 方案 A：使用 Pages Router（临时解决）

创建 `pages/index.tsx` 文件：

```tsx
import PasswordGenerator from '@/components/password-generator'

export default function Home() {
  return <PasswordGenerator />
}
```

#### 方案 B：检查 Vercel 构建设置

在 Vercel 项目设置中：
- Framework Preset: Next.js
- Build Command: `npm run build`
- Output Directory: `.next`
- Install Command: `npm install`

#### 方案 C：使用环境变量

在 Vercel 项目设置中添加环境变量：
- `NEXT_PRIVATE_STANDALONE=true`

### 6. 验证部署

部署成功后，您应该能够访问：
- 主页：`https://your-project.vercel.app`
- 应用正常工作，显示密码生成器界面

## 常见问题

### Q: 为什么会出现这个错误？
A: 通常是因为 Vercel 在构建时无法正确识别 Next.js App Router 结构，可能是由于文件编码、配置问题或缓存问题。

### Q: 本地构建成功但 Vercel 失败？
A: 这通常表明是环境差异问题，尝试清理 Vercel 缓存或重新部署。

### Q: 如何清理 Vercel 缓存？
A: 在 Vercel Dashboard 中，进入项目设置 → Functions → 点击 "Clear Cache"。

## 联系支持

如果问题仍然存在，请：
1. 检查 Vercel 构建日志中的详细错误信息
2. 确保所有依赖项都已正确安装
3. 考虑使用 Vercel 的 GitHub 集成来自动部署
