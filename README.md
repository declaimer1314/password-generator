# 密码生成器

一个使用 Next.js 和 shadcn/ui 构建的现代化密码生成器应用。

## 功能特性

- 🔐 **安全密码生成** - 支持自定义长度（4-50字符）
- 🎛️ **灵活配置** - 可选择包含大写字母、小写字母、数字和特殊符号
- 📊 **强度评估** - 实时显示密码强度等级
- 📋 **一键复制** - 快速复制生成的密码到剪贴板
- 🎨 **现代UI** - 使用 shadcn/ui 组件库，界面美观
- 🌙 **深色模式** - 支持明暗主题切换
- 📱 **响应式设计** - 适配各种设备屏幕

## 技术栈

- **框架**: Next.js 14 (App Router)
- **UI组件**: shadcn/ui
- **样式**: Tailwind CSS
- **图标**: Lucide React
- **类型检查**: TypeScript

## 快速开始

### 安装依赖

```bash
npm install
```

### 启动开发服务器

```bash
npm run dev
```

在浏览器中打开 [http://localhost:3000](http://localhost:3000) 查看应用。

### 构建生产版本

```bash
npm run build
npm start
```

## 项目结构

```
password-generator/
├── app/                    # Next.js App Router
│   ├── globals.css        # 全局样式
│   ├── layout.tsx         # 根布局
│   └── page.tsx           # 主页面
├── components/            # React 组件
│   ├── ui/               # shadcn/ui 基础组件
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── checkbox.tsx
│   │   ├── label.tsx
│   │   ├── slider.tsx
│   │   ├── toast.tsx
│   │   └── ...
│   └── password-generator.tsx  # 密码生成器主组件
├── lib/                  # 工具函数
│   └── utils.ts
├── components.json       # shadcn/ui 配置
├── tailwind.config.js   # Tailwind CSS 配置
├── tsconfig.json        # TypeScript 配置
└── package.json         # 项目依赖
```

## 使用说明

1. **设置密码长度**: 使用滑块调整密码长度（4-50字符）
2. **选择字符类型**: 勾选需要包含的字符类型
   - 大写字母 (A-Z)
   - 小写字母 (a-z)
   - 数字 (0-9)
   - 特殊符号 (!@#$...)
3. **生成密码**: 点击"生成密码"按钮
4. **复制密码**: 点击复制按钮将密码复制到剪贴板
5. **查看强度**: 系统会显示密码强度等级

## 安全建议

- 使用至少12个字符的密码
- 包含多种字符类型（大小写字母、数字、符号）
- 避免使用个人信息或常见词汇
- 为不同账户使用不同的密码
- 定期更换密码

## 开发说明

### 添加新的 shadcn/ui 组件

```bash
npx shadcn-ui@latest add [component-name]
```

### 自定义主题

修改 `app/globals.css` 中的 CSS 变量来自定义主题颜色。

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！
