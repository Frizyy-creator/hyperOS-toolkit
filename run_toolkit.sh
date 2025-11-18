#!/system/bin/sh
echo "=================================================="
echo "🎮 HYPEROS TOOLKIT LAUNCHER"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

show_menu() {
    echo ""
    echo -e "${GREEN}🎯 QUICK ACTIONS:${NC}"
    echo -e "1. 🚀 Apply ALL optimizations"
    echo -e "2. ⚡ Performance only"
    echo -e "3. 📷 Camera features"
    echo -e "4. 📱 System apps"
    echo -e "5. 💾 Create backup"
    
    echo ""
    echo -e "${BLUE}🔧 ADVANCED MENU:${NC}"
    echo -e "6. 🎛️  Open Full Dashboard"
    echo -e "7. 🛠️  Maintenance Tools"
    
    echo ""
    echo -e "${RED}0. 🚪 Exit${NC}"
    echo ""
    echo -n "Enter choice [0-7]: "
}

main() {
    while true; do
        show_menu
        read choice
        
        case $choice in
            1)
                echo -e "${GREEN}🚀 Applying ALL optimizations...${NC}"
                ./hyperos_toolkit.sh
                ;;
            2)
                echo -e "${GREEN}⚡ Performance optimizations...${NC}"
                ./hyperos_toolkit.sh performance
                ;;
            3)
                echo -e "${GREEN}📷 Camera features...${NC}"
                ./hyperos_toolkit.sh camera
                ;;
            4)
                echo -e "${GREEN}📱 System apps...${NC}"
                ./hyperos_toolkit.sh system
                ;;
            5)
                echo -e "${GREEN}💾 Creating backup...${NC}"
                ./hyperos_toolkit.sh backup
                ;;
            6)
                echo -e "${BLUE}🎛️  Opening Full Dashboard...${NC}"
                ./hyperos_dashboard.sh
                ;;
            7)
                echo -e "${BLUE}🛠️  Maintenance Tools...${NC}"
                ./toolkit_updater_fixed.sh
                ;;
            0)
                echo -e "${GREEN}👋 Goodbye!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}❌ Invalid choice! Enter 0-7${NC}"
                ;;
        esac
        
        echo ""
        echo -e "${BLUE}Press Enter to continue...${NC}"
        read
    done
}

main
