/** @type {import('next').NextConfig} */
const nextConfig = {
  // App Router is stable in Next.js 14, no need for experimental flag
  output: 'standalone', // 启用 standalone 输出，用于 Docker 部署
}

module.exports = nextConfig

 