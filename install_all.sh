#!/system/bin/sh
echo "=================================================="
echo "📦 HYPEROS COMPLETE SUITE INSTALLER"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

install_all_tools() {
    echo -e "${BLUE}📦 Installing complete HyperOS Toolkit suite...${NC}"
    
    # Даем права на все скрипты
    chmod +x *.sh
    
    # Создаем структуру папок
    mkdir -p /sdcard/HyperOS_Toolkit/{logs,backups,reports}
    
    echo -e "${GREEN}✅ All tools installed and configured!${NC}"
    echo ""
    echo -e "${YELLOW}📋 Available tools:${NC}"
    echo "🎛️  hyperos_dashboard.sh    - Main dashboard"
    echo "🚀 hyperos_toolkit.sh      - Core optimizer"
    echo "🎮 run_toolkit.sh          - Quick launcher"
    echo "⚡ performance_profiles.sh - Performance modes"
    echo "🔍 system_info.sh          - Diagnostics"
    echo "💾 restore_backup.sh       - Backup manager"
    echo "📊 logger.sh               - Logging system"
    echo "🔄 auto_update.sh          - Update checker"
    echo "🎨 personalization.sh      - Themes & appearance"
    echo "🌐 network_optimizer.sh    - Network optimizer"
    echo "🔒 security.sh             - Security & privacy"
    echo "📈 benchmark.sh            - Performance tests"
    echo "🛠️  toolkit_updater_fixed.sh - Maintenance"
}

show_usage() {
    echo -e "${YELLOW}Usage:${NC}"
    echo "  ./install_all.sh          - Install all tools"
    echo "  ./install_all.sh check    - Check installation"
    echo ""
    echo -e "${GREEN}After installation, run: ./hyperos_dashboard.sh${NC}"
}

check_installation() {
    echo -e "${BLUE}🔍 Checking installation...${NC}"
    
    missing_tools=0
    for tool in hyperos_dashboard.sh hyperos_toolkit.sh run_toolkit.sh; do
        if [ -f "$tool" ]; then
            echo -e "${GREEN}✅ $tool${NC}"
        else
            echo -e "${RED}❌ $tool${NC}"
            missing_tools=$((missing_tools + 1))
        fi
    done
    
    if [ $missing_tools -eq 0 ]; then
        echo -e "${GREEN}🎉 All tools are installed!${NC}"
    else
        echo -e "${YELLOW}⚠️  Some tools are missing${NC}"
    fi
}

# Основная логика
case "$1" in
    "check")
        check_installation
        ;;
    "")
        install_all_tools
        ;;
    *)
        echo -e "${RED}❌ Unknown option: $1${NC}"
        show_usage
        ;;
esac

echo ""
echo -e "${BLUE}🚀 Next steps:${NC}"
echo "1. Run: su"
echo "2. Run: ./hyperos_dashboard.sh"
echo "3. Explore all features!"
