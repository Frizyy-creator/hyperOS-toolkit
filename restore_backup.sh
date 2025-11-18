#!/system/bin/sh
echo "=================================================="
echo "🔄 HYPEROS BACKUP RESTORATION"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

show_backups() {
    echo -e "${BLUE}📂 Available backups:${NC}"
    if [ -d "/sdcard/HyperOS_Backup" ]; then
        find /sdcard/HyperOS_Backup -name "system_settings.txt" -exec dirname {} \; | while read backup_dir; do
            backup_name=$(basename "$backup_dir")
            backup_date=$(stat -c %y "$backup_dir" 2>/dev/null | cut -d' ' -f1)
            echo "📁 $backup_name (created: $backup_date)"
        done
    else
        echo -e "${YELLOW}No backups found${NC}"
    fi
}

restore_backup() {
    local backup_dir="$1"
    
    if [ ! -d "$backup_dir" ]; then
        echo -e "${RED}❌ Backup directory not found: $backup_dir${NC}"
        return 1
    fi
    
    echo -e "${BLUE}🔄 Restoring from: $backup_dir${NC}"
    
    # Восстановление системных настроек
    if [ -f "$backup_dir/system_settings.txt" ]; then
        echo -e "${YELLOW}📋 Restoring system settings...${NC}"
        while IFS= read -r line; do
            if echo "$line" | grep -q "="; then
                key=$(echo "$line" | cut -d'=' -f1)
                value=$(echo "$line" | cut -d'=' -f2-)
                settings put system "$key" "$value" 2>/dev/null
            fi
        done < "$backup_dir/system_settings.txt"
    fi
    
    # Восстановление secure настроек
    if [ -f "$backup_dir/secure_settings.txt" ]; then
        echo -e "${YELLOW}🔒 Restoring secure settings...${NC}"
        while IFS= read -r line; do
            if echo "$line" | grep -q "="; then
                key=$(echo "$line" | cut -d'=' -f1)
                value=$(echo "$line" | cut -d'=' -f2-)
                settings put secure "$key" "$value" 2>/dev/null
            fi
        done < "$backup_dir/secure_settings.txt"
    fi
    
    echo -e "${GREEN}✅ Backup restored from: $backup_dir${NC}"
    echo -e "${YELLOW}🔄 Reboot recommended for full restoration${NC}"
}

# Главное меню
main() {
    echo -e "${BLUE}1. List available backups${NC}"
    echo -e "${BLUE}2. Restore specific backup${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1)
            show_backups
            ;;
        2)
            echo -n "Enter backup folder name: "
            read backup_name
            restore_backup "/sdcard/HyperOS_Backup/$backup_name"
            ;;
        0)
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            echo -e "${RED}❌ Invalid choice${NC}"
            ;;
    esac
}

main
