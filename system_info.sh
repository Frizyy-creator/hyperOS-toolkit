#!/system/bin/sh
echo "=================================================="
echo "🔍 HYPEROS SYSTEM DIAGNOSTICS"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Информация об устройстве
echo -e "${BLUE}📱 Device Information:${NC}"
echo "Model: $(getprop ro.product.model)"
echo "Device: $(getprop ro.product.device)"
echo "Android: $(getprop ro.build.version.release)"
echo "MIUI: $(getprop ro.miui.ui.version.name)"
echo "Firmware: $(getprop ro.build.fingerprint)"

# Информация о процессоре
echo -e "${BLUE}⚡ CPU Information:${NC}"
if [ -f "/sys/devices/system/cpu/possible" ]; then
    echo "Cores: $(($(cat /sys/devices/system/cpu/possible | cut -d'-' -f2) + 1))"
fi
if [ -f "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq" ]; then
    echo "Current freq: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq) kHz"
fi

# Информация о памяти
echo -e "${BLUE}💾 Memory Information:${NC}"
if command -v free > /dev/null; then
    free -h
else
    cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable"
fi

# Информация о батарее
echo -e "${BLUE}🔋 Battery Information:${NC}"
battery_info=$(dumpsys battery 2>/dev/null)
if [ -n "$battery_info" ]; then
    echo "$battery_info" | grep -E "level|scale|status|temperature" | head -4
else
    echo "Battery info not available"
fi

# Информация о хранилище
echo -e "${BLUE}💽 Storage Information:${NC}"
df -h /data /system /sdcard 2>/dev/null | grep -v "tmpfs"

# Проверка root
echo -e "${BLUE}🔓 Root Access:${NC}"
if [ "$(whoami)" = "root" ]; then
    echo -e "${GREEN}✅ Root access available${NC}"
else
    echo -e "${RED}❌ No root access${NC}"
fi

# Проверка прошивки
echo -e "${BLUE}🔧 Firmware Detection:${NC}"
./hyperos_toolkit.sh | grep "Detected firmware" | head -1

echo -e "${GREEN}✅ Diagnostics completed!${NC}"
