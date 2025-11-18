#!/system/bin/sh
echo "=================================================="
echo "📊 HYPEROS LOGGING SYSTEM"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

LOG_DIR="/sdcard/HyperOS_Toolkit/logs"
mkdir -p "$LOG_DIR"

# Функция логирования
log_action() {
    local message="$1"
    local log_file="$LOG_DIR/toolkit_$(date +%Y%m%d).log"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "$timestamp - $message" >> "$log_file"
    echo -e "${BLUE}📝 LOG: $message${NC}"
}

# Функция создания отчета
generate_report() {
    local report_file="$LOG_DIR/system_report_$(date +%Y%m%d_%H%M%S).txt"
    
    echo "=== HYPEROS TOOLKIT SYSTEM REPORT ===" > "$report_file"
    echo "Generated: $(date)" >> "$report_file"
    echo "======================================" >> "$report_file"
    
    # Информация о системе
    echo "" >> "$report_file"
    echo "=== SYSTEM INFORMATION ===" >> "$report_file"
    {
        echo "Model: $(getprop ro.product.model)"
        echo "Android: $(getprop ro.build.version.release)"
        echo "MIUI: $(getprop ro.miui.ui.version.name)"
        echo "Kernel: $(uname -r)"
    } >> "$report_file"
    
    # Информация о производительности
    echo "" >> "$report_file"
    echo "=== PERFORMANCE ===" >> "$report_file"
    {
        echo "CPU Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || echo "N/A")"
        echo "Memory Swappiness: $(cat /proc/sys/vm/swappiness 2>/dev/null || echo "N/A")"
        echo "Refresh Rate: $(settings get system min_refresh_rate)/$(settings get system peak_refresh_rate)"
    } >> "$report_file"
    
    # Последние действия
    echo "" >> "$report_file"
    echo "=== RECENT ACTIVITIES ===" >> "$report_file"
    if [ -f "$LOG_DIR/toolkit_$(date +%Y%m%d).log" ]; then
        tail -10 "$LOG_DIR/toolkit_$(date +%Y%m%d).log" >> "$report_file"
    fi
    
    echo -e "${GREEN}✅ Report generated: $report_file${NC}"
    log_action "Generated system report"
}

# Просмотр логов
view_logs() {
    echo -e "${BLUE}📋 Recent logs:${NC}"
    if [ -f "$LOG_DIR/toolkit_$(date +%Y%m%d).log" ]; then
        tail -20 "$LOG_DIR/toolkit_$(date +%Y%m%d).log"
    else
        echo -e "${YELLOW}No logs found for today${NC}"
    fi
}

# Очистка старых логов
clean_old_logs() {
    find "$LOG_DIR" -name "*.log" -mtime +7 -delete
    echo -e "${GREEN}✅ Old logs cleaned (older than 7 days)${NC}"
    log_action "Cleaned old log files"
}

# Главное меню
main() {
    echo -e "${BLUE}1. Generate system report${NC}"
    echo -e "${BLUE}2. View recent logs${NC}"
    echo -e "${BLUE}3. Clean old logs${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) generate_report ;;
        2) view_logs ;;
        3) clean_old_logs ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
}

main
