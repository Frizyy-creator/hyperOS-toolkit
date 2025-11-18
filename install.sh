#!/system/bin/sh
echo "🚀 HyperOS Toolkit Installer"

# Check root
if [ "$(whoami)" != "root" ]; then
    echo "❌ Root access required!"
    exit 1
fi

# Create directory
mkdir -p /data/hyperos_toolkit

# Copy files
cp *.sh /data/hyperos_toolkit/
chmod +x /data/hyperos_toolkit/*.sh

echo "✅ Installation complete!"
echo "Usage: /data/hyperos_toolkit/hyperos_dashboard.sh"
