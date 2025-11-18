#!/system/bin/sh
echo "=================================================="
echo "🛠️  HYPEROS TOOLKIT UPDATER - FIXED VERSION"
echo "=================================================="

# Простая функция обновления
update_scripts() {
    echo "📥 Checking for updates..."
    
    # Создаем бэкап
    BACKUP_DIR="/sdcard/HyperOS_Backup/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    cp *.sh *.md "$BACKUP_DIR/" 2>/dev/null
    echo "✅ Backup created: $BACKUP_DIR"
    
    echo "📋 Current files:"
    ls -la *.sh 2>/dev/null
    
    echo ""
    echo "🔄 Update complete!"
    echo "💡 Manual update: Replace files via GitHub website"
}

# Главное меню
show_menu() {
    echo ""
    echo "🛠️  MAINTENANCE MENU:"
    echo "1️⃣  Create backup"
    echo "2️⃣  Check files"
    echo "3️⃣  Clean temp files"
    echo "0️⃣  Exit"
    echo ""
    echo -n "Enter choice [0-3]: "
}

main() {
    while true; do
        show_menu
        read choice
        case $choice in
            1)
                BACKUP_DIR="/sdcard/HyperOS_Manual_Backup/$(date +%Y%m%d_%H%M%S)"
                mkdir -p "$BACKUP_DIR"
                cp *.sh *.md "$BACKUP_DIR/" 2>/dev/null
                echo "✅ Manual backup created: $BACKUP_DIR"
                ;;
            2)
                echo "📋 Current toolkit files:"
                ls -la *.sh *.md 2>/dev/null
                echo ""
                echo "📊 File sizes:"
                for file in *.sh; do
                    if [ -f "$file" ]; then
                        lines=$(wc -l < "$file" 2>/dev/null)
                        echo "📄 $file: $lines lines"
                    fi
                done
                ;;
            3)
                echo "🧹 Cleaning temp files..."
                rm -f *.save *.backup *.tmp 2>/dev/null
                echo "✅ Temp files cleaned!"
                ;;
            0)
                echo "👋 Goodbye!"
                exit 0
                ;;
            *)
                echo "❌ Invalid choice!"
                ;;
        esac
        echo ""
        echo "Press Enter to continue..."
        read
    done
}

main
