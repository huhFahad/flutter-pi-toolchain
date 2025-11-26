#!/bin/bash
set -e

echo "===================================="
echo " Installing Docker"
echo "===================================="

sudo apt update
sudo apt install -y docker.io qemu-user-static rsync
sudo systemctl enable --now docker 
sudo usermod -aG docker $USER

echo "Docker installed. You MUST logout/login once."

echo ""
echo "===================================="
echo " Building flutter-arm64 Docker image"
echo "===================================="

docker build -t flutter-arm64 .

echo ""
echo "===================================="
echo " Making flutter-pi CLI globally available"
echo "===================================="

sudo cp flutter-pi /usr/local/bin/flutter-pi
sudo chmod +x /usr/local/bin/flutter-pi

echo ""
echo "===================================="
echo " Installation Complete!"
echo " Use:"
echo "   flutter-pi build"
echo "   flutter-pi deploy --ip <ip> --path <folder>"
echo "   flutter-pi run --ip <ip> --path <folder>"
echo "===================================="

