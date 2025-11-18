#!/system/bin/sh
echo "=================================================="
echo "🌐 HYPEROS NETWORK OPTIMIZER"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Оптимизация Wi-Fi
optimize_wifi() {
    echo -e "${BLUE}📶 Optimizing Wi-Fi...${NC}"
    
    # Агрессивный поиск сетей
    settings put global wifi_scan_always_enabled 1
    
    # Отключение экономного режима Wi-Fi
    settings put global wifi_sleep_policy 2
    
    # Приоритет 5GHz сетям
    settings put global wifi_band 2
    
    # Улучшение стабильности
    settings put secure wifi_display_on 1
    
    echo -e "${GREEN}✅ Wi-Fi optimized${NC}"
}

# Оптимизация мобильной сети
optimize_mobile() {
    echo -e "${BLUE}📱 Optimizing Mobile Network...${NC}"
    
    # Приоритет LTE/5G
    settings put global preferred_network_mode 20
    
    # Агрессивное переключение между сетями
    settings put global mobile_data_always_on 1
    
    # Улучшение сигнала
    setprop persist.vendor.radio.add_power_save 0
    
    echo -e "${GREEN}✅ Mobile network optimized${NC}"
}

# Настройка DNS
optimize_dns() {
    echo -e "${BLUE}🔗 Optimizing DNS...${NC}"
    
    # Использование быстрых DNS серверов
    settings put global private_dns_specifier dns.google
    settings put global private_dns_mode hostname
    
    # Альтернативные DNS
    echo "nameserver 8.8.8.8" > /etc/resolv.conf 2>/dev/null
    echo "nameserver 1.1.1.1" >> /etc/resolv.conf 2>/dev/null
    
    echo -e "${GREEN}✅ DNS optimized${NC}"
}

# Оптимизация TCP
optimize_tcp() {
    echo -e "${BLUE}📡 Optimizing TCP Settings...${NC}"
    
    # Улучшенные TCP алгоритмы
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
    echo "1" > /proc/sys/net/ipv4/tcp_fastopen
    echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
    
    # Увеличение буферов
    echo "2097152" > /proc/sys/net/core/rmem_max
    echo "2097152" > /proc/sys/net/core/wmem_max
    
    echo -e "${GREEN}✅ TCP settings optimized${NC}"
}

# Сброс сетевых настроек
reset_network() {
    echo -e "${BLUE}🔄 Resetting Network Settings...${NC}"
    
    # Сброс к заводским настройкам
    settings delete global private_dns_specifier
    settings delete global private_dns_mode
    settings put global wifi_sleep_policy 1
    
    # Сброс TCP настроек
    echo "cubic" > /proc/sys/net/ipv4/tcp_congestion_control
    
    echo -e "${GREEN}✅ Network settings reset${NC}"
}

# Тест скорости сети
network_test() {
    echo -e "${BLUE}🏃 Testing Network...${NC}"
    
    # Проверка подключения
    if ping -c 3 google.com >/dev/null 2>&1; then
        echo -e "${GREEN}✅ Internet connection: OK${NC}"
    else
        echo -e "${RED}❌ Internet connection: FAILED${NC}"
    fi
    
    # Проверка DNS
    if nslookup google.com >/dev/null 2>&1; then
        echo -e "${GREEN}✅ DNS resolution: OK${NC}"
    else
        echo -e "${RED}❌ DNS resolution: FAILED${NC}"
    fi
    
    echo -e "${YELLOW}📊 For detailed speed test, use speedtest app${NC}"
}

# Главное меню
main() {
    echo -e "${BLUE}1. 📶 Optimize Wi-Fi${NC}"
    echo -e "${BLUE}2. 📱 Optimize Mobile Network${NC}"
    echo -e "${BLUE}3. 🔗 Optimize DNS${NC}"
    echo -e "${BLUE}4. 📡 Optimize TCP${NC}"
    echo -e "${BLUE}5. 🏃 Test Network${NC}"
    echo -e "${BLUE}6. 🔄 Reset Network Settings${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) optimize_wifi ;;
        2) optimize_mobile ;;
        3) optimize_dns ;;
        4) optimize_tcp ;;
        5) network_test ;;
        6) reset_network ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
    
    echo -e "${YELLOW}🔄 Some changes may require reboot${NC}"
}

main
