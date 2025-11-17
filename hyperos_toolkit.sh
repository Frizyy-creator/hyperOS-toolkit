#!/system/bin/sh
echo "=================================================="
echo "🚀 HYPEROS ULTIMATE OPTIMIZATION TOOLKIT"
echo "=================================================="

echo "🔧 Checking root access..."
whoami_result=$(whoami)
if [ "$whoami_result" != "root" ]; then
    echo "❌ Root access required! Run: su"
    exit 1
fi

echo "✅ Root access confirmed"

case "$1" in
    performance)
        echo "⚡ Applying performance optimizations..."
        echo schedutil > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null
        echo 50 > /proc/sys/vm/swappiness 2>/dev/null
        echo westwood > /proc/sys/net/ipv4/tcp_congestion_control 2>/dev/null
        echo "✅ Performance optimizations applied!"
        ;;
    camera)
        echo "📷 Unlocking camera features..."
        setprop persist.vendor.camera.1080p.60fps 1
        setprop persist.vendor.camera.4k.enable 1
        setprop persist.camera.HAL3.enabled 1
        echo "✅ Camera features unlocked!"
        ;;
    system)
        echo "📱 Unlocking system apps..."
        settings put system min_refresh_rate 120
        settings put system peak_refresh_rate 120
        settings put global window_animation_scale 0.7
        settings put secure status_bar_show_battery_percent 1
        echo "✅ System apps features unlocked!"
        ;;
    backup)
        echo "💾 Creating backup..."
        mkdir -p /sdcard/HyperOS_Backup
        settings list system > /sdcard/HyperOS_Backup/system_settings.txt
        echo "✅ Backup created in /sdcard/HyperOS_Backup/"
        ;;
    *)
        echo "🚀 Applying ALL optimizations..."
        # Производительность
        echo schedutil > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null
        echo 50 > /proc/sys/vm/swappiness 2>/dev/null
        
        # Камера
        setprop persist.vendor.camera.1080p.60fps 1
        
        # Система
        settings put system min_refresh_rate 120
        settings put global window_animation_scale 0.7
        settings put secure status_bar_show_battery_percent 1
        
        # Бэкап
        mkdir -p /sdcard/HyperOS_Backup
        settings list system > /sdcard/HyperOS_Backup/system_settings.txt
        
        echo "✅ ALL optimizations applied!"
        echo "🔄 Reboot your device for best results"
        ;;
esac
