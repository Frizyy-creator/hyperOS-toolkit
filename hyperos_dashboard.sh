#!/system/bin/sh
echo "=================================================="
echo "🎛️  HYPEROS ULTIMATE DASHBOARD"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Проверка root
check_root() {
    if [ "$(whoami)" != "root" ]; then
        echo -e "${RED}❌ Root access required! Run: su${NC}"
        exit 1
    fi
}

# Системная информация
show_system_info() {
    echo -e "${CYAN}📊 System Overview:${NC}"
    echo "Device: $(getprop ro.product.model)"
    echo "Android: $(getprop ro.build.version.release)"
    echo "MIUI: $(getprop ro.miui.ui.version.name)"
    echo "Kernel: $(uname -r)"
    
    # Определение прошивки
    FIRMWARE_TYPE=$(./hyperos_toolkit.sh | grep "Detected firmware" | cut -d':' -f2 | tr -d ' ')
    echo "Firmware: $FIRMWARE_TYPE"
    
    # Память
    if command -v free > /dev/null; then
        echo "Memory: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    fi
}

# Главное меню
show_menu() {
    echo ""
    echo -e "${PURPLE}🎯 CORE OPTIMIZATIONS:${NC}"
    echo -e "${GREEN}1.  🚀 Quick Optimize (All-in-one)${NC}"
    echo -e "${GREEN}2.  ⚡ Performance Profiles${NC}"
    echo -e "${GREEN}3.  📷 Camera Unlock${NC}"
    echo -e "${GREEN}4.  📱 System Tweaks${NC}"
    
    echo ""
    echo -e "${BLUE}🔧 MAINTENANCE TOOLS:${NC}"
    echo -e "${CYAN}5.  🔍 System Diagnostics${NC}"
    echo -e "${CYAN}6.  💾 Backup & Restore${NC}"
    echo -e "${CYAN}7.  🧹 Cleanup & Cache${NC}"
    echo -e "${CYAN}8.  📊 Benchmark & Tests${NC}"
    
    echo ""
    echo -e "${YELLOW}🎨 PERSONALIZATION:${NC}"
    echo -e "${YELLOW}9.  🎨 Themes & Appearance${NC}"
    echo -e "${YELLOW}10. 🌐 Network Optimizer${NC}"
    echo -e "${YELLOW}11. 🔒 Security & Privacy${NC}"
    
    echo ""
    echo -e "${PURPLE}🛠️  ADVANCED TOOLS:${NC}"
    echo -e "${BLUE}12. 📝 Logs & Reports${NC}"
    echo -e "${BLUE}13. 🔄 Auto Updates${NC}"
    echo -e "${BLUE}14. 🛠️  Toolkit Updater${NC}"
    
    echo ""
    echo -e "${RED}0.  🚪 Exit${NC}"
    echo ""
    echo -n "Enter choice [0-14]: "
}

# Обработка выбора
handle_choice() {
    case $1 in
        1)
            echo -e "${GREEN}🚀 Running Quick Optimization...${NC}"
            ./hyperos_toolkit.sh
            ;;
        2)
            echo -e "${GREEN}⚡ Performance Profiles...${NC}"
            ./performance_profiles.sh
            ;;
        3)
            echo -e "${GREEN}📷 Unlocking Camera...${NC}"
            ./hyperos_toolkit.sh camera
            ;;
        4)
            echo -e "${GREEN}📱 System Tweaks...${NC}"
            ./hyperos_toolkit.sh system
            ;;
        5)
            echo -e "${CYAN}🔍 System Diagnostics...${NC}"
            ./system_info.sh
            ;;
        6)
            echo -e "${CYAN}💾 Backup & Restore...${NC}"
            ./restore_backup.sh
            ;;
        7)
            echo -e "${CYAN}🧹 Cleanup & Cache...${NC}"
            ./security.sh clear_cache
            ;;
        8)
            echo -e "${CYAN}📊 Benchmark & Tests...${NC}"
            ./benchmark.sh
            ;;
        9)
            echo -e "${YELLOW}🎨 Themes & Appearance...${NC}"
            ./personalization.sh
            ;;
        10)
            echo -e "${YELLOW}🌐 Network Optimizer...${NC}"
            ./network_optimizer.sh
            ;;
        11)
            echo -e "${YELLOW}🔒 Security & Privacy...${NC}"
            ./security.sh
            ;;
        12)
            echo -e "${BLUE}📝 Logs & Reports...${NC}"
            ./logger.sh
            ;;
        13)
            echo -e "${BLUE}🔄 Auto Updates...${NC}"
            ./auto_update.sh
            ;;
        14)
            echo -e "${BLUE}🛠️  Toolkit Updater...${NC}"
            ./toolkit_updater_fixed.sh
            ;;
        0)
            echo -e "${GREEN}👋 Thank you for using HyperOS Toolkit!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Invalid choice! Please enter 0-14${NC}"
            ;;
    esac
}

# Основная функция
main() {
    check_root
    
    while true; do
        clear
        echo "=================================================="
        echo "🎛️  HYPEROS ULTIMATE DASHBOARD v3.0"
        echo "=================================================="
        
        show_system_info
        show_menu
        
        read choice
        handle_choice "$choice"
        
        echo ""
        echo -e "${BLUE}Press Enter to continue...${NC}"
        read
    done
}

main
