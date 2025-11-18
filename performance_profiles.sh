#!/system/bin/sh
echo "=================================================="
echo "⚡ PERFORMANCE PROFILES MANAGER"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Режим игры
gaming_mode() {
    echo -e "${BLUE}🎮 Enabling Gaming Mode...${NC}"
    
    # Максимальная производительность CPU
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        echo "performance" > "$cpu" 2>/dev/null
    done
    
    # Отключение thermal throttling
    echo "0" > /sys/class/thermal/thermal_zone0/mode 2>/dev/null
    
    # Настройки GPU
    echo "performance" > /sys/class/kgsl/kgsl-3d0/devfreq/governor 2>/dev/null
    
    # Отключение энергосбережения
    setprop persist.vendor.gaming.mode 1
    settings put global game_driver_all_apps 0
    
    echo -e "${GREEN}✅ Gaming Mode activated!${NC}"
}

# Режим экономии
battery_saver() {
    echo -e "${BLUE}🔋 Enabling Battery Saver Mode...${NC}"
    
    # Экономия CPU
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        echo "powersave" > "$cpu" 2>/dev/null
    done
    
    # Понижение частоты обновления
    settings put system min_refresh_rate 60
    settings put system peak_refresh_rate 60
    
    # Ограничение фоновых процессов
    settings put global background_process_limit 8
    
    # Экономия памяти
    echo "30" > /proc/sys/vm/swappiness
    
    echo -e "${GREEN}✅ Battery Saver Mode activated!${NC}"
}

# Сбалансированный режим
balanced_mode() {
    echo -e "${BLUE}⚖️ Enabling Balanced Mode...${NC}"
    
    # Сбалансированные настройки CPU
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        echo "schedutil" > "$cpu" 2>/dev/null
    done
    
    # Оптимальная частота обновления
    settings put system min_refresh_rate 90
    settings put system peak_refresh_rate 120
    
    # Стандартные настройки памяти
    echo "50" > /proc/sys/vm/swappiness
    
    echo -e "${GREEN}✅ Balanced Mode activated!${NC}"
}

# Главное меню
main() {
    echo -e "${BLUE}1. 🎮 Gaming Mode (Max Performance)${NC}"
    echo -e "${BLUE}2. 🔋 Battery Saver (Max Battery)${NC}"
    echo -e "${BLUE}3. ⚖️ Balanced Mode (Recommended)${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) gaming_mode ;;
        2) battery_saver ;;
        3) balanced_mode ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
    
    echo -e "${YELLOW}🔄 Some changes may require reboot${NC}"
}

main
