# 🚀 DevOps Portfolio: Local Kubernetes Cluster via IaC

Detta projekt demonstrerar hur man sätter upp en komplett, produktionsliknande DevOps-miljö lokalt på en Windows-maskin med hjälp av infrastruktur som kod (IaC) och container-orkestrering.

---

## 🏗️ Arkitekturöversikt

Projektet bygger upp ett lokalt **Kubernetes-kluster (3 noder)** som körs inuti **Docker Desktop** via **WSL2 (Ubuntu)**. Hela infrastrukturen är deklarerad och uppsatt automatiskt med **Terraform**.

*   **Infrastrukturverktyg:** Terraform (med `siderolabs/kind`-providern)
*   **Klusterlösning:** Kubernetes via KiND (Kubernetes in Docker)
*   **Lokalt Registry:** En privat container-register (port `5001`) för att lagra lokala Docker-images.
*   **Klusterstruktur:**
    *   1 Control Plane (Hjärnan som styr klustret)
    *   2 Worker-noder (Arbetshästar som kör applikationerna)

---

## 🛠️ Kommandoreferens (Cheat Sheet)

Här är de viktigaste kommandona som används för att hantera miljön:

### Infrastruktur (Terraform)
```powershell
# Initiera Terraform-projektet och ladda ner providers
terraform init

# Planera och se vad som kommer att skapas
terraform plan

# Starta upp hela klustret och registryt automatiskt
terraform apply

# Riv ner och nollställ hela miljön
terraform destroy