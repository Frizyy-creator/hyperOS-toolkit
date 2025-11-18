#!/system/bin/sh
echo "=================================================="
echo "🚀 HYPEROS ULTIMATE OPTIMIZATION TOOLKIT"
echo "=================================================="

# Определяем тип прошивки
detect_firmware() {
    MIUI_VERSION=$(getprop ro.miui.ui.version.name 2>/dev/null)
    BUILD_FINGERPRINT=$(getprop ro.build.fingerprint 2>/dev/null)
    BUILD_DESCRIPTION=$(getprop ro.build.description 2>/dev/null)
    
    # Проверяем Xiaomi.eu по различным признакам
    if echo "$BUILD_FINGERPRINT" | grep -qi "xiaomi.eu"; then
        echo "xiaomi.eu"
    elif echo "$BUILD_DESCRIPTION" | grep -qi "xiaomi.eu"; then
        echo "xiaomi.eu"
    elif [ -n "$MIUI_VERSION" ] && echo "$MIUI_VERSION" | grep -qi "EU"; then
        echo "xiaomi.eu"
    elif [ -n "$MIUI_VERSION" ]; then
        echo "official"
    else
        echo "custom"
    fi
}

# Функции для разных прошивок
xiaomi_eu_optimizations() {
    echo "🇪🇺 Xiaomi.eu firmware detected"
    echo "🔧 Applying Xiaomi.eu specific optimizations..."
    
    # Xiaomi.eu обычно уже имеет многие оптимизации, применяем дополнительные
    settings put system min_refresh_rate 120
    settings put system peak_refresh_rate 120
    settings put global window_animation_scale 0.7
    settings put global transition_animation_scale 0.7
    
    # Камера на xiaomi.eu часто уже разблокирована, но на всякий случай
    setprop persist.vendor.camera.1080p.60fps 1
    setprop persist.camera.HAL3.enabled 1
    
    # Дополнительные настройки для EU прошивки
    settings put secure show_rotation_suggestions 0
    settings put secure navigation_bar_style 0
    
    echo "✅ Xiaomi.eu optimizations applied!"
}

official_optimizations() {
    echo "📱 Official firmware detected"
    echo "🔧 Applying official firmware optimizations..."
    
    # Базовые оптимизации для стоковой прошивки
    echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null
    echo "50" > /proc/sys/vm/swappiness 2>/dev/null
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control 2>/dev/null
    
    settings put system min_refresh_rate 120
    settings put system peak_refresh_rate 120
    settings put global window_animation_scale 0.7
    settings put global transition_animation_scale 0.7
    settings put secure status_bar_show_battery_percent 1
    
    setprop persist.vendor.camera.1080p.60fps 1
    setprop persist.vendor.camera.4k.enable 1
    setprop persist.camera.HAL3.enabled 1
    
    echo "✅ Official firmware optimizations applied!"
}

custom_optimizations() {
    echo "⚙️ Custom firmware detected"
    echo "🔧 Applying generic optimizations..."
    
    # Базовые оптимизации которые работают на большинстве прошивок
    settings put global window_animation_scale 0.7 2>/dev/null
    settings put global transition_animation_scale 0.7 2>/dev/null
    settings put global animator_duration_scale 0.7 2>/dev/null
    
    # Пытаемся применить настройки дисплея
    settings put system min_refresh_rate 120 2>/dev/null
    settings put system peak_refresh_rate 120 2>/dev/null
    
    echo "✅ Custom firmware optimizations applied!"
}

# Функция проверки root
check_root() {
    if [ "$(whoami)" != "root" ]; then
        echo "❌ Root access required! Run: su"
        exit 1
    fi
    echo "✅ Root access confirmed"
}

# Основная логика
FIRMWARE_TYPE=$(detect_firmware)
echo "🔍 Detected firmware: $FIRMWARE_TYPE"

check_root

case "$1" in
    "performance")
        echo "⚡ Applying performance optimizations..."
        case $FIRMWARE_TYPE in
            "xiaomi.eu") xiaomi_eu_optimizations ;;
            "official") official_optimizations ;;
            *) custom_optimizations ;;
        esac
        ;;
    "camera")
        echo "📷 Unlocking camera features..."
        setprop persist.vendor.camera.1080p.60fps 1
        setprop persist.vendor.camera.4k.enable 1
        setprop persist.camera.HAL3.enabled 1
        echo "✅ Camera features unlocked!"
        ;;
    "system")
        echo "📱 Unlocking system apps..."
        settings put system min_refresh_rate 120
        settings put system peak_refresh_rate 120
        settings put global window_animation_scale 0.7
        settings put secure status_bar_show_battery_percent 1
        echo "✅ System apps features unlocked!"
        ;;
    "backup")
        echo "💾 Creating backup..."
        mkdir -p /sdcard/HyperOS_Backup
        settings list system > /sdcard/HyperOS_Backup/system_settings.txt 2>/dev/null
        settings list secure > /sdcard/HyperOS_Backup/secure_settings.txt 2>/dev/null
        getprop > /sdcard/HyperOS_Backup/properties.txt 2>/dev/null
        echo "✅ Backup created in /sdcard/HyperOS_Backup/"
        ;;
    *)
        echo "🚀 Applying ALL optimizations..."
        case $FIRMWARE_TYPE in
            "xiaomi.eu")
                xiaomi_eu_optimizations
                ;;
            "official")
                official_optimizations
                ;;
            *)
                custom_optimizations
                ;;
        esac
        
        # Общие настройки для всех прошивок
        mkdir -p /sdcard/HyperOS_Backup
        settings list system > /sdcard/HyperOS_Backup/system_settings.txt 2>/dev/null
        
        echo "✅ ALL optimizations applied!"
        echo "🔄 Reboot your device for best results"
        echo "💡 Firmware type: $FIRMWARE_TYPE"
        ;;
esac
