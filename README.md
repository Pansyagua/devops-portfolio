# 🚀 DevOps Portfolio Project: Infrastructure as Code & Local CI/CD Pipeline

Detta projekt demonstrerar en komplett, lokal DevOps-workflow som sätter upp en Kubernetes-miljö via Infrastructure as Code (IaC) och automatiserar deployment av en webbapplikation med en CI/CD-pipeline.

---

## 🛠️ Teknologier & Verktyg

* **IaC:** Terraform
* **Orkestrering:** Kubernetes (Kind - Kubernetes in Docker)
* **Containerisering:** Docker
* **CI/CD / Automatisering:** PowerShell-skript (`deploy.ps1`)
* **Webbserver:** Nginx

---

## 🏗️ Arkitektur & Flöde

1. **Infrastruktur (IaC):** Terraform skapar ett lokalt Kind-kluster (`production-replica`).
2. **Build:** PowerShell-skriptet bygger en Docker-image från applikationskoden.
3. **Registry:** Imagen taggas och skickas till det lokala container-registryt.
4. **Deploy:** Kubernetes-manifest (`deployment.yaml`) verkställs och rullar ut applikationen i klustret utan downtime (`rollout restart`).

---

## 🚀 Hur man kör projektet lokalt

### Förutsättningar
* Docker Desktop igång
* Terraform installerat
* `kubectl` och `kind` installerat

### 1. Starta infrastrukturen (IaC)
```powershell
terraform init
terraform apply -auto-approve