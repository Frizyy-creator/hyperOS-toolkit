#!/system/bin/sh
echo "🚀 HyperOS Toolkit Installer"
echo "============================"
if [ "$(whoami)" != "root" ]; then
    echo "❌ Root access required!"
    exit 1
fi
mkdir -p /data/hyperos_toolkit
cp *.sh /data/hyperos_toolkit/
chmod +x /data/hyperos_toolkit/*.sh
echo "✅ Installation complete!"
echo "Usage: /data/hyperos_toolkit/hyperos_dashboard.sh"
