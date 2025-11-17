setprop ro.media.enc.hprof.vid.bps 8000000

# Графика
setprop persist.sys.composition.type gpu
setprop debug.composition.type gpu
setprop debug.egl.hw 1
setprop debug.egl.profiler 1

# Игры
setprop ro.kernel.android.checkjni 0
setprop ro.config.hw_quickpoweron true
setprop persist.sys.purgeable_assets 1

# Батарея
setprop ro.ril.disable.power.collapse 0
setprop pm.sleep_mode 1
setprop wifi.supplicant_scan_interval 180
EOF

su -c "chmod 755 /sdcard/buildprop_tweaks.sh"
# Создаем папку для init.d
su -c "mkdir -p /system/etc/init.d"
cat > /sdcard/restore_defaults.sh << 'EOF'
#!/system/bin/sh
# Восстановление CPU
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Восстановление яркости
echo "500" > /sys/class/backlight/panel/brightness

# Восстановление цветов
echo "256 256 256" > /sys/devices/platform/kcal_ctrl.0/kcal
echo "255" > /sys/devices/platform/kcal_ctrl.0/kcal_sat

# Удаление автозапуска
rm -f /system/etc/init.d/99optimize
EOF

*#*#717717#*#*
→ Debug Settings → Display
# Улучшение производительности
debug.performance.tuning=1
video.accelerate.hw=1
persist.sys.composition.type=gpu
# Улучшение дисплея  
persist.sys.sf.color_saturation=1.1
ro.surface_flinger.use_color_management=true
# Улучшение звука
audio.offload.disable=0
persist.vendor.audio.fluence.speaker=true
# Даем Termux права на хранилище
termux-setup-storage
# Устанавливаем необходимые утилиты
pkg update && pkg upgrade
pkg install root-repo
pkg install tsu git wget curl python
# Обновление пакетов
pkg update && pkg upgrade
# Снятие thermal throttling
echo "performance" > /sys/class/thermal/thermal_zone*/policy
# Увеличение скорости зарядки (осторожно!)
echo "1" > /sys/class/power_supply/battery/fastchg_enabled
# Оптимизация памяти
echo "3" > /proc/sys/vm/drop_caches
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
# Монтируем систему в режим записи
su -c "mount -o rw,remount /system"
su
#!/system/bin/sh
echo "=================================================="
echo "🚀 HYPEROS ULTIMATE OPTIMIZATION SCRIPT"
echo "=================================================="
# 🔧 ОСНОВНЫЕ ОПТИМИЗАЦИИ
apply_optimizations() {     echo "🔧 Applying performance optimizations...";     
    echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;     echo "691200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;     echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor;     echo "1056000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq;     
    echo "50" > /proc/sys/vm/swappiness;     echo "50" > /proc/sys/vm/vfs_cache_pressure;     echo "10" > /proc/sys/vm/dirty_ratio;     
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control; }
# 📱 РАЗБЛОКИРОВКА ФУНКЦИЙ
unlock_features() {     echo "📱 Unlocking flagship features...";     
    settings put secure multi_window_enabled 1;     settings put global enable_multi_window 1;     setprop persist.vendor.mi_multi_window_count 8;     
    setprop persist.vendor.xiaomi_ai_enabled 1;     settings put secure ai_service_enabled 1;     
    setprop persist.vendor.graphics.quality ultra;     settings put system screen_color_mode_advanced 1;     
    setprop persist.vendor.gaming.mode extreme;     settings put global game_turbo_advanced 1;     
    setprop persist.vendor.audio.hifi true;     settings put system spatial_audio_enabled 1; }
# ⚡ СИСТЕМНЫЕ НАСТРОЙКИ
system_tweaks() {     echo "⚡ Applying system tweaks...";     
    settings put system min_refresh_rate 120;     settings put system peak_refresh_rate 120;     
    settings put global window_animation_scale 0.7;     settings put global transition_animation_scale 0.7;     
    pm disable com.miui.analytics > /dev/null 2>&1;     pm disable com.xiaomi.misubscreenui > /dev/null 2>&1; }
# 🔄 АВТОЗАПУСК ПРИ ЗАГРУЗКЕ
setup_autostart() {     echo "🔄 Setting up autostart...";     
    if [ -d "/data/adb/service.d" ]; then
        cat > /data/adb/service.d/hyperos_optimize_service.sh << 'EOF'
#!/system/bin/sh
sleep 60
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 5
done
sleep 15
sh /data/data/com.termux/files/home/hyperos_optimize.sh
EOF
         chmod 755 /data/adb/service.d/hyperos_optimize_service.sh;         echo "✅ Magisk autostart configured";     fi;     
    echo "*/5 * * * * sh /data/data/com.termux/files/home/hyperos_optimize.sh" > /data/data/com.termux/files/home/crontab.txt;     crontab /data/data/com.termux/files/home/crontab.txt;     echo "✅ Crontab autostart configured"; }
# 🏃‍♂️ ОСНОВНОЙ ВЫПОЛНЕНИЕ
main() {     echo "Starting optimization process...";          apply_optimizations;     unlock_features;     system_tweaks;     setup_autostart;          echo "";     echo "==================================================";     echo "✅ OPTIMIZATION COMPLETED!";     echo "📁 Script location: /data/data/com.termux/files/home/";     echo "🔄 Autostart: Configured";     echo "🔍 Run './check_optimize.sh' to verify";     echo "==================================================";     
    am broadcast -a android.intent.action.CONFIGURATION_CHANGED > /dev/null 2>&1; }
# Запуск
main
nano /data/data/com.termux/files/home/check_optimize.sh
nano /data/data/com.termux/files/home/fix_optimize.sh
# Создаем главный скрипт
nano /data/data/com.termux/files/home/hyperos_optimize.sh
chmod +x /data/data/com.termux/files/home/*.sh
./hyperos_optimize.sh
./check_optimize.sh
# Добавляем в автозагрузку Termux
echo "sh /data/data/com.termux/files/home/hyperos_optimize.sh" >> /data/data/com.termux/files/home/.bashrc
# Добавляем в автозагрузку Termux
echo "sh /data/data/com.termux/files/home/hyperos_optimize.sh" >> /data/data/com.termux/files/home/.bashrc
📱 ВАШЕ УСТРОЙСТВО:
└── 📂 Internal Storage
# Быстрая проверка
./check_optimize.sh
# Принудительное применение
./hyperos_optimize.sh
# Исправление проблем
./fix_optimize.sh
# Просмотр логов
cat /sdcard/hyperos_optimization_report.txt
chmod +x /data/data/com.termux/files/home/*.sh
exit
nano /data/data/com.termux/files/home/hyperos_ultimate.sh
#!/bin/bash
echo "=================================================================="
echo " HYPEROS OPTIMIZATION VERIFICATION TOOL"
echo "=================================================================="
echo "Device: Redmi Note 12 (SD685) | HyperOS 3.0.30.0"
echo "Checking all optimizations and unlocked features..."
echo "=================================================================="
# 📊 ФУНКЦИИ ДЛЯ ПРОВЕРКИ
check_status() {     local name="$1";     local command="$2";     local expected="$3";          echo -n "🔍 $name... ";     result=$(eval "$command" 2>/dev/null);          if [ "$result" = "$expected" ]; then         echo "✅ APPLIED";         return 0;     elif [ -n "$result" ]; then         echo "⚠️  DIFFERENT: $result";         return 1;     else         echo "❌ NOT FOUND";         return 2;     fi; }
check_prop() {     local name="$1";     local prop="$2";     local expected="$3";          echo -n "🔍 $name... ";     result=$(getprop "$prop" 2>/dev/null);          if [ "$result" = "$expected" ]; then         echo "✅ APPLIED";         return 0;     elif [ -n "$result" ]; then         echo "⚠️  DIFFERENT: $result";         return 1;     else         echo "❌ NOT FOUND";         return 2;     fi; }
# 🚀 ПРОВЕРКА ОПТИМИЗАЦИЙ ПРОИЗВОДИТЕЛЬНОСТИ
echo ""
echo "🎯 PERFORMANCE OPTIMIZATIONS:"
echo "------------------------------"
check_status "CPU Little Governor" "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" "schedutil"
check_status "CPU Little Min Freq" "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq" "691200"
check_status "CPU Big Governor" "cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor" "schedutil"
check_status "CPU Big Min Freq" "cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq" "1056000"
check_status "Memory Swappiness" "cat /proc/sys/vm/swappiness" "50"
check_status "VFS Cache Pressure" "cat /proc/sys/vm/vfs_cache_pressure" "50"
check_status "Dirty Ratio" "cat /proc/sys/vm/dirty_ratio" "10"
check_status "OOM Kill Allocating Task" "cat /proc/sys/vm/oom_kill_allocating_task" "1"
check_status "I/O Scheduler" "cat /sys/block/mmcblk0/queue/scheduler 2>/dev/null | grep -o '\\[noop\\]'" "\[noop\]"
check_status "TCP Congestion Control" "cat /proc/sys/net/ipv4/tcp_congestion_control" "westwood"
# 📱 ПРОВЕРКА РАЗБЛОКИРОВАННЫХ ФУНКЦИЙ
echo ""
echo "🔓 UNLOCKED FEATURES:"
echo "------------------------------"
check_status "Multi-Window Enabled" "settings get secure multi_window_enabled" "1"
check_status "Force Resizable Activities" "settings get global force_resizable_activities" "1"
check_prop "Multi-Window Count" "persist.vendor.mi_multi_window_count" "8"
check_prop "AI Services Enabled" "persist.vendor.xiaomi_ai_enabled" "1"
check_status "AI System Service" "settings get secure ai_service_enabled" "1"
check_prop "Graphics Quality" "persist.vendor.graphics.quality" "ultra"
check_prop "HDR Enabled" "persist.vendor.hdr.enabled" "1"
check_status "Advanced Color Mode" "settings get system screen_color_mode_advanced" "1"
check_prop "Gaming Mode" "persist.vendor.gaming.mode" "extreme"
check_status "Game Turbo Advanced" "settings get global game_turbo_advanced" "1"
check_prop "Camera Professional" "ro.vendor.camera.professional" "true"
check_prop "Camera Super Night" "ro.vendor.camera.supernight" "true"
check_prop "Hi-Fi Audio" "persist.vendor.audio.hifi" "true"
check_prop "Dolby Audio" "persist.vendor.audio.dolby" "true"
check_status "Spatial Audio" "settings get system spatial_audio_enabled" "1"
# ⚡ ПРОВЕРКА СИСТЕМНЫХ ОПТИМИЗАЦИЙ
echo ""
echo "⚡ SYSTEM OPTIMIZATIONS:"
echo "------------------------------"
check_status "120Hz Min Refresh" "settings get system min_refresh_rate" "120"
check_status "120Hz Peak Refresh" "settings get system peak_refresh_rate" "120"
check_status "Window Animation Scale" "settings get global window_animation_scale" "0.7"
check_status "Transition Animation Scale" "settings get global transition_animation_scale" "0.7"
check_status "Animator Duration Scale" "settings get global animator_duration_scale" "0.7"
check_status "Battery Optimization Advanced" "settings get secure battery_optimization_advanced" "1"
check_status "Smart Charging" "settings get global smart_charging_enabled" "1"
# 🧹 ПРОВЕРКА ОТКЛЮЧЕННЫХ СЛУЖБ
echo ""
echo "🧹 DISABLED BLOATWARE:"
echo "------------------------------"
check_bloatware() {     local package="$1";     local name="$2";          echo -n "🔍 $name... ";     result=$(pm list packages -d | grep "$package");          if [ -n "$result" ]; then         echo "✅ DISABLED";         return 0;     else         echo "❌ STILL ACTIVE";         return 1;     fi; }
check_bloatware "com.miui.analytics" "MIUI Analytics"
check_bloatware "com.xiaomi.misubscreenui" "MIUI Subscreen"
check_bloatware "com.miui.optimizecenter" "Optimize Center"
check_bloatware "com.miui.powerkeeper" "Power Keeper"
# 🎯 ПРОВЕРКА ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ
echo ""
echo "🎯 ADDITIONAL FEATURES:"
echo "------------------------------"
check_status "Window Blur Enabled" "settings get global window_blur_enabled" "1"
check_status "Fluid Navigation Gestures" "settings get secure fluid_navigation_gestures" "1"
check_status "Advanced App Ops" "settings get global app_ops_advanced" "1"
check_status "Development Settings" "settings get global development_settings_enabled" "1"
check_prop "Performance Mode" "persist.vendor.performance.mode" "extreme"
check_prop "Enhanced Performance" "ro.vendor.perf.enhanced" "true"
# 📊 СБОР СТАТИСТИКИ
echo ""
echo "📊 SYSTEM STATISTICS:"
echo "------------------------------"
# Память
echo "📈 Memory Usage:"
free -h | grep -E "Mem|Swap"
# CPU частоты
echo ""
echo "⚡ CPU Frequencies:"
echo "Little Cluster: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq) kHz"
echo "Big Cluster: $(cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq) kHz"
# Температура
echo ""
echo "🌡️ Temperature:"
if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then     temp=$(cat /sys/class/thermal/thermal_zone0/temp);     echo "CPU: $((temp / 1000))°C"; fi
# zRAM статистика
echo ""
echo "💾 zRAM Statistics:"
if [ -f "/proc/swaps" ]; then     grep -E "zram|swap" /proc/swaps; fi
# 🔧 ПРОВЕРКА ДОСТУПНОСТИ СЕРВИСОВ
echo ""
echo "🔧 SERVICE AVAILABILITY:"
echo "------------------------------"
check_service() {     local service="$1";     local name="$2";          echo -n "🔍 $name... ";     if pm list features | grep -q "$service"; then         echo "✅ AVAILABLE";         return 0;     else         echo "❌ UNAVAILABLE";         return 1;     fi; }
check_service "xiaomi.ai" "AI Services"
check_service "multi.window" "Multi-Window"
check_service "game.turbo" "Game Turbo"
check_service "camera.professional" "Professional Camera"
# 📝 ФИНАЛЬНЫЙ ОТЧЕТ
echo ""
echo "=================================================================="
echo " 📊 VERIFICATION SUMMARY"
echo "=================================================================="
# Подсчет результатов
total_checks=0
passed_checks=0
failed_checks=0
while IFS= read -r line; do     if [[ $line == *"APPLIED"* ]] || [[ $line == *"DISABLED"* ]] || [[ $line == *"AVAILABLE"* ]]; then         ((passed_checks++));     elif [[ $line == *"DIFFERENT"* ]] || [[ $line == *"STILL ACTIVE"* ]] || [[ $line == *"UNAVAILABLE"* ]] || [[ $line == *"NOT FOUND"* ]]; then         ((failed_checks++));     fi;     ((total_checks++)); done < <(grep -E "APPLIED|DISABLED|AVAILABLE|DIFFERENT|STILL ACTIVE|UNAVAILABLE|NOT FOUND" $0)
echo "✅ Applied: $passed_checks"
echo "❌ Issues: $failed_checks" 
echo "📊 Total checks: $total_checks"
echo ""
if [ $failed_checks -eq 0 ]; then     echo "🎉 ALL OPTIMIZATIONS SUCCESSFULLY APPLIED!";     echo "🚀 Your device is fully optimized!"; elif [ $failed_checks -le 5 ]; then     echo "⚠️  MOST OPTIMIZATIONS APPLIED";     echo "🔧 Some minor issues detected"; else     echo "❌ MULTIPLE ISSUES DETECTED";     echo "🛠️  Consider re-running optimization script"; fi
echo ""
echo "💡 TIPS:"
echo "- Reboot device if any issues detected"
echo "- Some features require app restarts"
echo "- Check individual settings in system menus"
echo "=================================================================="
# Сохранение отчета в файл
echo "Verification report generated on: $(date)" > /sdcard/hyperos_optimization_report.txt
echo "Applied: $passed_checks | Issues: $failed_checks | Total: $total_checks" >> /sdcard/hyperos_optimization_report.txt
echo "Report saved to: /sdcard/hyperos_optimization_report.txt"
nano /data/data/com.termux/files/home/check_optimization.sh
sh /data/data/com.termux/files/home/hyperos_optimize.sh
#!/bin/bash
echo "=================================================================="
echo " HYPEROS ULTIMATE OPTIMIZATION - iOS STYLE + FLAGSHIP FEATURES"
echo "=================================================================="
# 🔧 ОСНОВНЫЕ НАСТРОЙКИ ПРОИЗВОДИТЕЛЬНОСТИ
echo "🔧 [1/8] Applying CPU/GPU/Memory optimizations..."
# CPU OPTIMIZATION
echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "691200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1800000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor  
echo "1056000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "2000000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# CPU BOOST
echo "1" > /sys/module/cpu_boost/parameters/input_boost_enabled 2>/dev/null
echo "1200" > /sys/module/cpu_boost/parameters/input_boost_freq 2>/dev/null
echo "150" > /sys/module/cpu_boost/parameters/input_boost_ms 2>/dev/null
# MEMORY OPTIMIZATION (iOS STYLE)
echo "50" > /proc/sys/vm/swappiness
echo "50" > /proc/sys/vm/vfs_cache_pressure
echo "10" > /proc/sys/vm/dirty_ratio
echo "5" > /proc/sys/vm/dirty_background_ratio
echo "3000" > /proc/sys/vm/dirty_expire_centisecs
echo "500" > /proc/sys/vm/dirty_writeback_centisecs
echo "8192" > /proc/sys/vm/min_free_kbytes
echo "1" > /proc/sys/vm/oom_kill_allocating_task
# GPU OPTIMIZATION
echo "msm-adreno-tz" > /sys/class/kgsl/kgsl-3d0/devfreq/governor 2>/dev/null
echo "825000000" > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq 2>/dev/null
# I/O OPTIMIZATION
for block in /sys/block/mmcblk* /sys/block/sd*; do     if [ -d "$block" ]; then         echo "noop" > "$block/queue/scheduler" 2>/dev/null;         echo "256" > "$block/queue/read_ahead_kb" 2>/dev/null;         echo "0" > "$block/queue/add_random" 2>/dev/null;         echo "0" > "$block/queue/iostats" 2>/dev/null;     fi; done
# 📱 РАЗБЛОКИРОВКА СИСТЕМНЫХ ФУНКЦИЙ
echo "📱 [2/8] Unlocking system features..."
# МНОГООКОННОСТЬ (до 8 окон)
settings put secure multi_window_enabled 1
settings put global enable_multi_window 1
settings put global force_resizable_activities 1
settings put global enable_freeform_support 1
setprop persist.vendor.mi_multi_window_count 8
setprop ro.sys.mi_multi_window_count 8
# AI СЕРВИСЫ
setprop persist.vendor.xiaomi_ai_enabled 1
setprop ro.vendor.xiaomi_ai_version 3.0
settings put secure ai_service_enabled 1
settings put global miai_function_enabled 1
pm enable com.miui.voiceassist > /dev/null 2>&1
pm enable com.xiaomi.voiceactivated > /dev/null 2>&1
pm enable com.xiaomi.ai > /dev/null 2>&1
# ГРАФИКА И ДИСПЛЕЙ
setprop persist.vendor.graphics.quality ultra
setprop ro.vendor.graphics.renderer vulkan,opengl
setprop ro.hardware.vulkan level 1
setprop persist.vendor.hdr.enabled 1
setprop ro.vendor.display.hdr 1
settings put system screen_color_mode_advanced 1
settings put system display_quality_advanced 1
settings put secure display_enhanced_mode 1
setprop persist.vendor.display.truetone.enable 1
# 🎮 ИГРОВЫЕ И ГРАФИЧЕСКИЕ ФУНКЦИИ
echo "🎮 [3/8] Enabling gaming and graphics features..."
setprop persist.vendor.gaming.mode extreme
setprop ro.vendor.gaming.performance 1
setprop persist.vendor.game.boost.fps 1
settings put global game_turbo_advanced 1
settings put secure gaming_mode_enhanced 1
# Камера PRO функции
setprop persist.vendor.camera.aux.enabled 1
setprop persist.vendor.camera.sat.enabled 1
setprop persist.vendor.camera.hdr.mode auto
setprop ro.vendor.camera.supernight true
setprop ro.vendor.camera.professional true
setprop persist.vendor.camera.highres.enabled 1
setprop persist.vendor.camera.pro_mode 1
# 🔊 ЗВУКОВЫЕ ФУНКЦИИ
echo "🔊 [4/8] Unlocking audio features..."
setprop persist.vendor.audio.hifi true
setprop ro.vendor.audio.hardware hifi
setprop persist.vendor.audio.dolby true
setprop ro.vendor.audio.dolby.version 5.1
settings put system spatial_audio_enabled 1
settings put secure audio_effect_advanced 1
# ⚡ СИСТЕМНЫЕ ОПТИМИЗАЦИИ
echo "⚡ [5/8] Applying system optimizations..."
# Частота обновления 120 Гц
settings put system min_refresh_rate 120
settings put system peak_refresh_rate 120
settings put system user_refresh_rate 120
# Ускорение анимаций
settings put global window_animation_scale 0.7
settings put global transition_animation_scale 0.7  
settings put global animator_duration_scale 0.7
# Сетевые оптимизации
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
setprop persist.vendor.wifi.advanced true
setprop persist.vendor.bt.hd.audio 1
# Энергоэффективность
echo "1" > /sys/module/workqueue/parameters/power_efficient
settings put secure battery_optimization_advanced 1
settings put global smart_charging_enabled 1
# 🧹 ОЧИСТКА И ОТКЛЮЧЕНИЕ ЛИШНЕГО
echo "🧹 [6/8] Cleaning and disabling bloatware..."
# Отключение телеметрии и bloatware
pm disable com.miui.analytics > /dev/null 2>&1
pm disable com.xiaomi.misubscreenui > /dev/null 2>&1
pm disable com.xiaomi.finddevice > /dev/null 2>&1
pm disable com.miui.daemon > /dev/null 2>&1
pm disable com.miui.optimizecenter > /dev/null 2>&1
pm disable com.xiaomi.glgm > /dev/null 2>&1
pm disable com.miui.powerkeeper > /dev/null 2>&1
# Очистка кэша
pm trim-caches 500M
# 🔒 БЕЗОПАСНОСТЬ И ПРИВАТНОСТЬ
echo "🔒 [7/8] Applying security and privacy settings..."
settings put secure face_unlock_app_encryption 1
settings put global app_ops_advanced 1
setprop persist.vendor.security.enhanced 1
settings put global private_dns_specifier dns.google
# 🎨 ВИЗУАЛЬНЫЕ УЛУЧШЕНИЯ
echo "🎨 [8/8] Applying visual enhancements..."
settings put global window_blur_enabled 1
settings put secure launcher_blur_enabled 1
settings put secure fluid_navigation_gestures 1
settings put system full_screen_gesture_mode 1
settings put secure navigation_bar_style 0
settings put secure screenshot_quality 100
# SCHEDULER OPTIMIZATIONS
echo "100" > /proc/sys/kernel/sched_rr_timeslice_ms
echo "1" > /proc/sys/kernel/sched_energy_aware
echo "1" > /proc/sys/kernel/sched_tunable_scaling
echo "10" > /proc/sys/kernel/sched_child_runs_first
echo "1250000" > /proc/sys/kernel/sched_rt_runtime_us
# ФИНАЛЬНЫЕ НАСТРОЙКИ
settings put global development_settings_enabled 1
setprop persist.vendor.performance.mode extreme
setprop ro.vendor.perf.enhanced true
echo "=================================================================="
echo "✅ OPTIMIZATION COMPLETED!"
echo "📱 Device: Redmi Note 12 (SD685) + HyperOS"
echo "🎯 Features: iOS-style performance + Flagship functions"
echo "🔄 Please reboot your device to apply all changes"
echo "=================================================================="
# Перезапуск системных сервисов
am broadcast -a android.intent.action.CONFIGURATION_CHANGED > /dev/null 2>&1
am force-stop com.android.systemui > /dev/null 2>&1
am start -n com.android.systemui/.SystemUIService > /dev/null 2>&1 &
echo "System UI restarted. Some changes applied immediately."
echo "Full optimization will be active after reboot."
nano /data/adb/service.d/hyperos_ultimate.sh
# Быстрая проверка
./check_optimize.sh
# Принудительное применение
./hyperos_optimize.sh
# Исправление проблем
./fix_optimize.sh
# Просмотр логов
cat /sdcard/hyperos_optimization_report.txt
nano /data/data/com.termux/files/home/hyperos_toolkit.sh
#!/system/bin/sh
# ==================================================
# 🚀 HYPEROS ULTIMATE TOOLKIT v3.0
# 📱 Universal Optimizer for Xiaomi Devices
# ==================================================
# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
# Configuration
TOOLKIT_DIR="/data/data/com.termux/files/home"
BACKUP_DIR="/sdcard/HyperOS_Backup"
LOG_FILE="/sdcard/hyperos_toolkit.log"
# Logging function
log() {     echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE;     echo "$1"; }
# Check root access
check_root() {     if [ "$(whoami)" != "root" ]; then         echo -e "${RED}❌ Root access required# Check root access{NC}"        echo "Please run: su";         exit 1;     fi; }
# Create backup of current settings
backup_settings() {     echo -e "${BLUE}📦 Creating backup...${NC}";     mkdir -p $BACKUP_DIR;     
    settings list system > $BACKUP_DIR/system_settings.txt;     settings list global > $BACKUP_DIR/global_settings.txt;     settings list secure > $BACKUP_DIR/secure_settings.txt;     
    getprop > $BACKUP_DIR/properties.txt;          echo -e "${GREEN}✅ Backup saved to $BACKUP_DIR${NC}";     log "Backup created in $BACKUP_DIR"; }
# 🎯 OPTIMIZATION MODULES
apply_performance_optimizations() {     echo -e "${CYAN}🚀 Applying performance optimizations...${NC}";     
    echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null;     echo "691200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 2>/dev/null;     echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor 2>/dev/null;     echo "1056000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 2>/dev/null;     
    echo "50" > /proc/sys/vm/swappiness;     echo "50" > /proc/sys/vm/vfs_cache_pressure;     echo "10" > /proc/sys/vm/dirty_ratio;     echo "5" > /proc/sys/vm/dirty_background_ratio;     
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control;     echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle;     
    for block in /sys/block/mmcblk* /sys/block/sd*; do         if [ -d "$block" ]; then             echo "noop" > "$block/queue/scheduler" 2>/dev/null;             echo "256" > "$block/queue/read_ahead_kb" 2>/dev/null;         fi;     done;          log "Performance optimizations applied"; }
apply_camera_unlock() {     echo -e "${PURPLE}🎥 Unlocking camera features...${NC}";     
    setprop persist.vendor.camera.4k.enable 1;     setprop persist.vendor.camera.4k.30fps 1;     setprop persist.vendor.camera.1080p.60fps 1;     setprop persist.vendor.camera.slowmo.240fps 1;     
    setprop persist.vendor.camera.leica.mode 1;     setprop persist.vendor.camera.leica.color 1;     setprop persist.vendor.camera.leica.filter 1;     
    setprop persist.vendor.camera.pro.mode 1;     setprop persist.vendor.camera.raw.enable 1;     setprop persist.vendor.camera.super.night 1;     
    setprop persist.camera.HAL3.enabled 1;     setprop persist.vendor.camera.api2.enabled 1;          log "Camera features unlocked"; }
apply_system_apps_unlock() {     echo -e "${YELLOW}🎨 Unlocking system apps features...${NC}";     
    settings put secure launcher_grid_columns 5;     settings put secure launcher_grid_rows 6;     settings put secure launcher_icon_size 100;     settings put global launcher_animation_scale 0.8;     
    settings put secure status_bar_show_battery_percent 1;     settings put secure clock_seconds 1;     settings put secure sysui_qs_count 12;     settings put secure notification_num_columns 2;     
    setprop persist.vendor.music.quality high;     setprop persist.vendor.gallery.pro 1;     settings put system equalizer_enabled 1;     
    settings put global development_settings_enabled 1;     settings put secure advanced_reboot 1;     settings put global battery_advanced 1;     
    settings put secure aod_enabled 1;     settings put system screen_off_animation 1;     settings put global theme_advanced 1;          log "System apps features unlocked"; }
apply_flagship_features() {     echo -e "${GREEN}📱 Applying flagship features...${NC}";     
    settings put secure multi_window_enabled 1;     settings put global enable_multi_window 1;     setprop persist.vendor.mi_multi_window_count 8;     
    setprop persist.vendor.xiaomi_ai_enabled 1;     settings put secure ai_service_enabled 1;     
    setprop persist.vendor.graphics.quality ultra;     setprop persist.vendor.hdr.enabled 1;     settings put system screen_color_mode_advanced 1;     
    setprop persist.vendor.gaming.mode extreme;     settings put global game_turbo_advanced 1;     
    setprop persist.vendor.audio.hifi true;     setprop persist.vendor.audio.dolby true;     settings put system spatial_audio_enabled 1;     
    settings put system min_refresh_rate 120;     settings put system peak_refresh_rate 120;     settings put global window_animation_scale 0.7;          log "Flagship features applied"; }
disable_bloatware() {     echo -e "${RED}🧹 Disabling bloatware...${NC}";     
    bloat_packages=(         "com.miui.analytics"         "com.xiaomi.misubscreenui"         "com.miui.optimizecenter"         "com.miui.powerkeeper"         "com.xiaomi.finddevice"         "com.miui.daemon"         "com.xiaomi.glgm"     );          for package in "${bloat_packages[@]}"; do         pm disable $package > /dev/null 2>&1 && echo -e "${GREEN}✅ Disabled: $package${NC}" || echo -e "${YELLOW}⚠️  Not found: $package${NC}";     done;          log "Bloatware disabled"; }
setup_autostart() {     echo -e "${BLUE}🔄 Setting up autostart...${NC}";     
    if [ -d "/data/adb/service.d" ]; then
        cat > /data/adb/service.d/hyperos_toolkit_service.sh << 'EOF'
#!/system/bin/sh
sleep 60
while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 5
done
sleep 15
sh /data/data/com.termux/files/home/hyperos_toolkit.sh --apply-all
EOF
         chmod 755 /data/adb/service.d/hyperos_toolkit_service.sh;         echo -e "${GREEN}✅ Magisk autostart configured${NC}";     fi;     
    if [ -d "/data/data/com.termux/files/home/.termux/boot" ]; then         cp $TOOLKIT_DIR/hyperos_toolkit.sh /data/data/com.termux/files/home/.termux/boot/;         echo -e "${GREEN}✅ Termux boot configured${NC}";     fi;          log "Autostart configured"; }
# 🔍 VERIFICATION SYSTEM
verify_optimizations() {     echo -e "${CYAN}🔍 Verifying optimizations...${NC}";          total_checks=0;     passed_checks=0;          verify_setting() {         local name="$1";         local command="$2";         local expected="$3";                  ((total_checks++));         echo -n "Checking $name... ";         result=$(eval "$command" 2>/dev/null);                  if [ "$result" = "$expected" ]; then             echo -e "${GREEN}✅${NC}";             ((passed_checks++));         else             echo -e "${RED}❌ ($result)${NC}";         fi;     };          echo -e "\n${BLUE}Performance:${NC}";     verify_setting "CPU Governor" "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor" "schedutil";     verify_setting "Memory Swappiness" "cat /proc/sys/vm/swappiness" "50";     verify_setting "TCP Congestion" "cat /proc/sys/net/ipv4/tcp_congestion_control" "westwood";          echo -e "\n${BLUE}Camera:${NC}";     verify_setting "4K Video" "getprop persist.vendor.camera.4k.enable" "1";     verify_setting "Leica Mode" "getprop persist.vendor.camera.leica.mode" "1";     verify_setting "PRO Mode" "getprop persist.vendor.camera.pro.mode" "1";          echo -e "\n${BLUE}System UI:${NC}";     verify_setting "Battery Percent" "settings get secure status_bar_show_battery_percent" "1";     verify_setting "120Hz Refresh" "settings get system min_refresh_rate" "120";     verify_setting "Advanced Reboot" "settings get secure advanced_reboot" "1";          echo -e "\n${BLUE}Results:${NC}";     echo -e "Passed: ${GREEN}$passed_checks/$total_checks${NC}";          if [ $passed_checks -eq $total_checks ]; then         echo -e "${GREEN}🎉 All optimizations verified successfully# 🔍 VERIFICATION SYSTEM{NC}"    else;         echo -e "${YELLOW}⚠️  Some optimizations need attention${NC}";     fi;          log "Verification completed: $passed_checks/$total_checks"; }
# 🆘 HELP AND INFO
show_help() {     echo -e "${CYAN}";     echo "==================================================";     echo "🚀 HYPEROS ULTIMATE TOOLKIT - USAGE GUIDE";     echo "==================================================";     echo "${NC}";     echo -e "${GREEN}Available commands:${NC}";     echo "  --apply-all          Apply all optimizations";     echo "  --performance        Apply performance optimizations only";     echo "  --camera             Unlock camera features only";     echo "  --system-apps        Unlock system apps features only";     echo "  --flagship           Apply flagship features only";     echo "  --disable-bloat      Disable bloatware only";     echo "  --verify             Verify applied optimizations";     echo "  --backup             Create backup of current settings";     echo "  --autostart          Setup autostart on boot";     echo "  --help               Show this help message";     echo "";     echo -e "${YELLOW}Examples:${NC}";     echo "  ./hyperos_toolkit.sh --apply-all";     echo "  ./hyperos_toolkit.sh --camera --system-apps";     echo "  ./hyperos_toolkit.sh --verify";     echo "";     echo -e "${BLUE}Location:${NC} $TOOLKIT_DIR/hyperos_toolkit.sh";     echo -e "${BLUE}Backup:${NC} $BACKUP_DIR";     echo -e "${BLUE}Logs:${NC} $LOG_FILE"; }
# 🏃‍♂️ MAIN EXECUTION
main() {     echo -e "${CYAN}";     echo "==================================================";     echo "🚀 HYPEROS ULTIMATE TOOLKIT v3.0";     echo "📱 Universal Optimizer for Xiaomi Devices";     echo "==================================================";     echo "${NC}";          check_root;          case "$1" in         "--apply-all")             backup_settings;             apply_performance_optimizations;             apply_camera_unlock;             apply_system_apps_unlock;             apply_flagship_features;             disable_bloatware;             setup_autostart;             verify_optimizations;             ;;         "--performance")             apply_performance_optimizations;             verify_optimizations;             ;;         "--camera")             apply_camera_unlock;             verify_optimizations;             ;;         "--system-apps")             apply_system_apps_unlock;             verify_optimizations;             ;;         "--flagship")             apply_flagship_features;             verify_optimizations;             ;;         "--disable-bloat")             disable_bloatware;             ;;         "--verify")             verify_optimizations;             ;;         "--backup")             backup_settings;             ;;         "--autostart")             setup_autostart;             ;;         "--help"|"")             show_help;             ;;         *)             echo -e "${RED}❌ Unknown command: $1${NC}";             echo "Use --help for usage information";             ;;     esac;          echo -e "\n${GREEN}✅ Operation completed# 🏃‍♂️ MAIN EXECUTION{NC}"    echo -e "${BLUE}📋 Log: $LOG_FILE${NC}"; }
# Start the script
main "$@"
