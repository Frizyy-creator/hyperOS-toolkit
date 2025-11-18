#!/system/bin/sh
echo "=================================================="
echo "🔒 HYPEROS SECURITY & PRIVACY"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Отключение телеметрии
disable_telemetry() {
    echo -e "${BLUE}📵 Disabling Telemetry...${NC}"
    
    # MIUI аналитика
    pm disable com.miui.analytics 2>/dev/null
    pm disable com.xiaomi.analytics 2>/dev/null
    pm disable com.miui.daemon 2>/dev/null
    
    # Google телеметрия
    pm disable com.google.android.gms/.ads.measurement.GmpConversionTrackingService 2>/dev/null
    pm disable com.google.android.gms/.measurement.PackageMeasurementTaskService 2>/dev/null
    
    # Системные сборщики данных
    settings put global adb_enabled 0
    settings put global development_settings_enabled 0
    
    echo -e "${GREEN}✅ Telemetry disabled${NC}"
}

# Очистка кэша
clear_cache() {
    echo -e "${BLUE}🧹 Clearing System Cache...${NC}"
    
    # Очистка кэша приложений
    pm trim-caches 512M 2>/dev/null
    
    # Очистка Dalvik кэша (требует root)
    if [ -d "/data/dalvik-cache" ]; then
        rm -rf /data/dalvik-cache/* 2>/dev/null
    fi
    
    # Очистка временных файлов
    rm -rf /data/local/tmp/* 2>/dev/null
    rm -rf /cache/* 2>/dev/null
    
    echo -e "${GREEN}✅ System cache cleared${NC}"
}

# Защита приватности
enhance_privacy() {
    echo -e "${BLUE}🛡️ Enhancing Privacy...${NC}"
    
    # Отключение сбора диагностических данных
    settings put secure usage_metrics_marketing_enabled 0
    settings put global send_action_app_error 0
    settings put global logcat.enabled 0
    
    # Ограничение отслеживания рекламы
    settings put secure bluetooth_address 02:00:00:00:00:00
    settings put secure wifi_mac_address 02:00:00:00:00:00
    
    # Отключение персонализированной рекламы
    settings put secure limit_ad_tracking 1
    settings put global adb_enabled 0
    
    echo -e "${GREEN}✅ Privacy enhanced${NC}"
}

# Блокировка рекламы
block_ads() {
    echo -e "${BLUE}🚫 Blocking Ads...${NC}"
    
    # Добавление hosts файла для блокировки рекламы
    HOSTS_FILE="/system/etc/hosts"
    if [ -w "$HOSTS_FILE" ]; then
        echo "" >> "$HOSTS_FILE"
        echo "# Ad blocking entries" >> "$HOSTS_FILE"
        echo "127.0.0.1 googleads.g.doubleclick.net" >> "$HOSTS_FILE"
        echo "127.0.0.1 pubads.g.doubleclick.net" >> "$HOSTS_FILE"
        echo "127.0.0.1 securepubads.g.doubleclick.net" >> "$HOSTS_FILE"
        echo "127.0.0.1 pagead2.googlesyndication.com" >> "$HOSTS_FILE"
    fi
    
    # Отключение рекламных ID
    settings put secure limited_ad_tracking 1
    
    echo -e "${GREEN}✅ Ads blocking configured${NC}"
}

# Усиление безопасности
enhance_security() {
    echo -e "${BLUE}🔐 Enhancing Security...${NC}"
    
    # Включение проверки приложений
    settings put global install_non_market_apps 0
    
    # Отключение USB debugging
    settings put global adb_enabled 0
    settings put global development_settings_enabled 0
    
    # Включение автоматических обновлений безопасности
    settings put global auto_update_system 1
    
    # Ограничение фоновых процессов
    settings put global background_process_limit 12
    
    echo -e "${GREEN}✅ Security enhanced${NC}"
}

# Восстановление настроек по умолчанию
restore_defaults() {
    echo -e "${BLUE}🔄 Restoring Default Settings...${NC}"
    
    # Восстановление настроек приватности
    settings delete secure usage_metrics_marketing_enabled
    settings delete global send_action_app_error
    
    # Включение стандартных сервисов
    pm enable com.miui.analytics 2>/dev/null
    pm enable com.xiaomi.analytics 2>/dev/null
    
    echo -e "${GREEN}✅ Default settings restored${NC}"
}

# Главное меню
main() {
    echo -e "${BLUE}1. 📵 Disable Telemetry${NC}"
    echo -e "${BLUE}2. 🧹 Clear System Cache${NC}"
    echo -e "${BLUE}3. 🛡️ Enhance Privacy${NC}"
    echo -e "${BLUE}4. 🚫 Block Ads${NC}"
    echo -e "${BLUE}5. 🔐 Enhance Security${NC}"
    echo -e "${BLUE}6. 🔄 Restore Defaults${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) disable_telemetry ;;
        2) clear_cache ;;
        3) enhance_privacy ;;
        4) block_ads ;;
        5) enhance_security ;;
        6) restore_defaults ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
    
    echo -e "${YELLOW}🔄 Some changes may require reboot${NC}"
}

main
