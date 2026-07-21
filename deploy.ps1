# 🚀 LOKAL CI/CD PIPELINE FÖR KUBERNETES

# 1. Inställningar
$IMAGE_NAME = "localhost:5001/frontend-app"
$TAG = "latest"
$FULL_IMAGE = "${IMAGE_NAME}:${TAG}"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host " Startar lokal CI/CD-pipeline..." -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# STAGE 1: Bygg Docker-image
Write-Host " Steg 1: Bygger Docker-image från app/Dockerfile..." -ForegroundColor Yellow
Set-Location app
docker build -t $FULL_IMAGE .
Set-Location ..

# STAGE 2: Pusha till vårt lokala Registry
Write-Host " Steg 2: Pushar image till lokalt kluster-registry..." -ForegroundColor Yellow
docker push $FULL_IMAGE

# STAGE 3: Rulla ut ändringarna till Kubernetes
Write-Host " Steg 3: Uppdaterar applikationen i Kubernetes..." -ForegroundColor Yellow
kubectl apply -f deployment.yaml

# STAGE 4: Starta om poddarna med den nya koden
Write-Host " Steg 4: Startar om poddarna för att läsa in ny kod..." -ForegroundColor Yellow
kubectl rollout restart deployment/frontend-app

Write-Host "=============================================" -ForegroundColor Green
Write-Host " KLART! Appen är uppdaterad och rullar live!" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green