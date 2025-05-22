
# FastAPI Full-Stack Inventory Management App

A full-stack inventory management application built with **FastAPI (backend)**, **React (frontend)**, and **SQL SERVER (database)**. The app allows users to manage item records through a user-friendly interface and RESTful API, containerized with Docker and deployed to Azure.

---

## 🚀 Project Features

- CRUD operations on inventory items  
- FastAPI-based backend with PostgreSQL integration  
- React-based responsive frontend  
- Dockerized for easy container deployment  
- Azure Container Registry (ACR) and Azure Container instance support  
- Step-by-step setup and deployment guide with video demos

---

## 🧰 Tech Stack

| Layer      | Technology           |
|------------|----------------------|
| Frontend   | React                |
| Backend    | FastAPI              |
| Database   | SQL SERVER           |
| Container  | Docker               |
| Deployment | Azure Container instance |

---

## 📄 Quick Start

> ⚠️ For **full setup instructions and video demos**, visit the Notion documentation:

📘 **Documentation & Demos**: [Notion Site →](https://confusion-gardenia-15a.notion.site/CLOUD-NATIVE-AND-CONTAINERIZED-FULL-STACK-APPLICATION-IN-AZURE-1eacc4e6d26080c5a364c4ddbee71d1a?pvs=4)

---

## ✅ Basic Workflow

1. Clone the repo
2. Configure environment variables
3. Build and run with Docker
4. Push image to ACR
5. Deploy to Azure Container instance

---

## 🧪 API Preview

Example API endpoints:

```http
GET     /items/               # List all items
POST    /items/               # Create new item
GET     /items/{id}           # Get item by ID
````

---

## 📦 Docker Usage

```bash
# Build image
docker build -t fastapi-backend .

# Tag for ACR
docker tag fastapi-backend your_acr.azurecr.io/fastapi-backend:v1

# Login to ACR
echo <your-password> | docker login your_acr.azurecr.io --password-stdin

# Push to ACR
docker push your_acr.azurecr.io/fastapi-backend:v1
```

---

## 📬 Contact

For feedback, contributions, or questions, feel free to reach out to me!

---email: agonaferdegefe@gmail.com

```LinkedIn: https://www.linkedin.com/in/abenet-degefe-207769319/

```
