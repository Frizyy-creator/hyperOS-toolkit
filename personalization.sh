#!/system/bin/sh
echo "=================================================="
echo "🎨 HYPEROS PERSONALIZATION"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Темная тема
apply_dark_theme() {
    echo -e "${BLUE}🌙 Applying Dark Theme...${NC}"
    settings put secure ui_night_mode 2
    settings put system screen_brightness_mode 0
    settings put system screen_auto_brightness 0
    echo -e "${GREEN}✅ Dark theme applied${NC}"
}

# Светлая тема
apply_light_theme() {
    echo -e "${BLUE}☀️ Applying Light Theme...${NC}"
    settings put secure ui_night_mode 1
    settings put system screen_brightness_mode 1
    echo -e "${GREEN}✅ Light theme applied${NC}"
}

# Авто тема
apply_auto_theme() {
    echo -e "${BLUE}🌓 Applying Auto Theme...${NC}"
    settings put secure ui_night_mode 0
    settings put system screen_brightness_mode 1
    echo -e "${GREEN}✅ Auto theme applied${NC}"
}

# Минималистичные анимации
minimal_animations() {
    echo -e "${BLUE}⚡ Applying Minimal Animations...${NC}"
    settings put global window_animation_scale 0.5
    settings put global transition_animation_scale 0.5
    settings put global animator_duration_scale 0.5
    echo -e "${GREEN}✅ Minimal animations applied${NC}"
}

# Отключение анимаций
disable_animations() {
    echo -e "${BLUE}🚫 Disabling All Animations...${NC}"
    settings put global window_animation_scale 0
    settings put global transition_animation_scale 0
    settings put global animator_duration_scale 0
    echo -e "${GREEN}✅ Animations disabled${NC}"
}

# Сброс к стандартным анимациям
default_animations() {
    echo -e "${BLUE}🔄 Restoring Default Animations...${NC}"
    settings put global window_animation_scale 1
    settings put global transition_animation_scale 1
    settings put global animator_duration_scale 1
    echo -e "${GREEN}✅ Default animations restored${NC}"
}

# Настройки шрифтов
increase_font_size() {
    echo -e "${BLUE}🔠 Increasing Font Size...${NC}"
    settings put system font_scale 1.15
    echo -e "${GREEN}✅ Font size increased${NC}"
}

decrease_font_size() {
    echo -e "${BLUE}🔡 Decreasing Font Size...${NC}"
    settings put system font_scale 0.85
    echo -e "${GREEN}✅ Font size decreased${NC}"
}

default_font_size() {
    echo -e "${BLUE}📝 Restoring Default Font Size...${NC}"
    settings put system font_scale 1.0
    echo -e "${GREEN}✅ Default font size restored${NC}"
}

# Главное меню
main() {
    echo -e "${BLUE}=== THEMES ===${NC}"
    echo -e "1. 🌙 Dark Theme"
    echo -e "2. ☀️ Light Theme" 
    echo -e "3. 🌓 Auto Theme"
    echo -e ""
    echo -e "${BLUE}=== ANIMATIONS ===${NC}"
    echo -e "4. ⚡ Minimal Animations"
    echo -e "5. 🚫 Disable Animations"
    echo -e "6. 🔄 Default Animations"
    echo -e ""
    echo -e "${BLUE}=== FONTS ===${NC}"
    echo -e "7. 🔠 Increase Font Size"
    echo -e "8. 🔡 Decrease Font Size"
    echo -e "9. 📝 Default Font Size"
    echo -e ""
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) apply_dark_theme ;;
        2) apply_light_theme ;;
        3) apply_auto_theme ;;
        4) minimal_animations ;;
        5) disable_animations ;;
        6) default_animations ;;
        7) increase_font_size ;;
        8) decrease_font_size ;;
        9) default_font_size ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
    
    echo -e "${YELLOW}🔄 Some changes may require app restart${NC}"
}

main
