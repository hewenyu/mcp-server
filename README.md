# MCP Server

This project provides a deployment environment for the [context7](https://github.com/upstash/context7) service using Docker and Nginx. It includes configuration for running the context7 service in a container and reverse proxying requests via Nginx.

---

本项目通过 Docker 和 Nginx 提供 [context7](https://github.com/upstash/context7) 服务的部署环境。它包含用于在容器中运行 context7 服务的配置，并通过 Nginx 进行反向代理。

## Features | 特性

- **Dockerized Deployment | Docker 化部署**: Easily deploy the context7 service using Docker Compose. | 使用 Docker Compose 快速部署 context7 服务。
- **Nginx Reverse Proxy | Nginx 反向代理**: All HTTP requests are proxied to the context7 service, with support for SSE streaming. | 所有 HTTP 请求通过 Nginx 代理到 context7 服务，支持 SSE 流式传输。
- **CI/CD Support | CI/CD 支持**: Includes GitHub Actions workflow for building and pushing Docker images. | 内置 GitHub Actions 工作流，用于构建和推送 Docker 镜像。

## Directory Structure | 目录结构

```
.
├── devops/
│   └── context7/
│       ├── docker-compose.yml
│       └── nginx/
│           └── default.conf
├── .github/
│   └── workflows/
│       └── context7-build.yml
├── LICENSE
└── README.md
```

## Quick Start | 快速开始

1. **Clone this repository | 克隆本仓库**

2. **Navigate to the deployment directory | 进入部署目录：**
   ```bash
   cd devops/context7
   ```

3. **Start the services using Docker Compose | 使用 Docker Compose 启动服务：**
   ```bash
   docker-compose up -d
   ```

4. **Access the service | 访问服务：**
   - Open your browser and visit | 在浏览器中打开：[http://localhost](http://localhost)

## Service Details | 服务说明

- `context7` runs on port 8080 inside the container. | `context7` 服务在容器内监听 8080 端口。
- Nginx listens on port 80 and proxies requests to the context7 service. | Nginx 监听 80 端口，并将请求代理到 context7 服务。

## License | 许可证

This project is licensed under the GNU General Public License v3.0. | 本项目采用 GNU 通用公共许可证 v3.0 许可。


