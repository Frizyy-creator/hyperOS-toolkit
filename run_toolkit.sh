#!/system/bin/sh
echo "=================================================="
echo "🎮 HYPEROS TOOLKIT - SIMPLE LAUNCHER"
echo "=================================================="

show_menu() {
    echo ""
    echo "🎯 SELECT OPTION:"
    echo "1️⃣  Apply ALL optimizations"
    echo "2️⃣  Performance optimizations only"
    echo "3️⃣  Unlock camera features"
    echo "4️⃣  Unlock system apps"
    echo "5️⃣  Create backup"
    echo "0️⃣  Exit"
    echo ""
    echo -n "Enter choice [0-5]: "
}

while true; do
    show_menu
    read choice
    case $choice in
        1)
            echo "🚀 Applying ALL optimizations..."
            ./hyperos_toolkit.sh
            ;;
        2)
            echo "⚡ Applying performance optimizations..."
            ./hyperos_toolkit.sh performance
            ;;
        3)
            echo "📷 Unlocking camera features..."
            ./hyperos_toolkit.sh camera
            ;;
        4)
            echo "📱 Unlocking system apps..."
            ./hyperos_toolkit.sh system
            ;;
        5)
            echo "💾 Creating backup..."
            ./hyperos_toolkit.sh backup
            ;;
        0)
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            echo "❌ Invalid choice! Enter 0-5"
            ;;
    esac
    echo ""
    echo "Press Enter to continue..."
    read
done
