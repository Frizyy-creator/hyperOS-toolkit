#!/system/bin/sh
echo "=================================================="
echo "☁️  HYPEROS TOOLKIT - CLOUD INSTALLER"
echo "=================================================="

echo "📦 Checking requirements..."
pkg install -y wget curl > /dev/null 2>&1

echo "📥 Downloading scripts..."
wget -q https://raw.githubusercontent.com/Frizyy-creator/hyperos-toolkit/main/hyperos_toolkit.sh
wget -q https://raw.githubusercontent.com/Frizyy-creator/hyperos-toolkit/main/run_toolkit.sh
wget -q https://raw.githubusercontent.com/Frizyy-creator/hyperos-toolkit/main/cloud_installer.sh

echo "🔧 Setting permissions..."
chmod +x *.sh

echo ""
echo "🎉 INSTALLATION COMPLETED!"
echo "🚀 Run: ./run_toolkit.sh"
echo "📁 Location: /data/data/com.termux/files/home/"

