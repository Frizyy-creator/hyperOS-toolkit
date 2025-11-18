#!/system/bin/sh
echo "📊 HyperOS System Diagnostics"

# Device info
echo "Model: $(getprop ro.product.model)"
echo "Android: $(getprop ro.build.version.release)"
echo "HyperOS: $(getprop ro.miui.ui.version.name)"

# Storage
echo "Storage: $(df -h /data | awk 'NR==2{print $4 " free"}')"

# Memory
if [ -f /proc/meminfo ]; then
    echo "RAM: $(grep MemAvailable /proc/meminfo | awk '{print $2}') KB available"
fi

# Battery
if [ -d /sys/class/power_supply/battery/ ]; then
    echo "Battery: $(cat /sys/class/power_supply/battery/capacity)%"
fi
