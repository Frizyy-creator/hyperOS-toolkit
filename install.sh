#!/system/bin/sh
echo "🚀 HyperOS Toolkit Installer"
[ "$(whoami)" != "root" ] && echo "❌ Root required!" && exit 1
mkdir -p /data/hyperos_toolkit
cp *.sh /data/hyperos_toolkit/
chmod +x /data/hyperos_toolkit/*.sh
echo "✅ Installation complete!"
