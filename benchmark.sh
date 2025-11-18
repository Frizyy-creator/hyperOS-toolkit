#!/system/bin/sh
echo "=================================================="
echo "📈 HYPEROS PERFORMANCE BENCHMARK"
echo "=================================================="

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

RESULTS_FILE="/sdcard/HyperOS_Toolkit/benchmark_results.txt"

# Тест CPU
cpu_benchmark() {
    echo -e "${BLUE}🧠 Running CPU Benchmark...${NC}"
    start_time=$(date +%s%N)
    
    # Простой математический тест
    count=0
    while [ $count -lt 10000 ]; do
        echo "scale=100; 4*a(1)" | bc -l > /dev/null 2>&1
        count=$((count + 1))
    done
    
    end_time=$(date +%s%N)
    cpu_time=$(( (end_time - start_time) / 1000000 ))
    echo -e "${GREEN}✅ CPU Test completed in ${cpu_time}ms${NC}"
    echo "CPU Performance: ${cpu_time}ms" >> "$RESULTS_FILE"
}

# Тест памяти
memory_benchmark() {
    echo -e "${BLUE}💾 Running Memory Benchmark...${NC}"
    start_time=$(date +%s%N)
    
    # Тест операций с памятью
    temp_file="/data/local/tmp/memtest"
    dd if=/dev/zero of="$temp_file" bs=1M count=10 >/dev/null 2>&1
    sync
    
    end_time=$(date +%s%N)
    memory_time=$(( (end_time - start_time) / 1000000 ))
    rm -f "$temp_file" 2>/dev/null
    
    echo -e "${GREEN}✅ Memory Test completed in ${memory_time}ms${NC}"
    echo "Memory Performance: ${memory_time}ms" >> "$RESULTS_FILE"
}

# Тест ввода-вывода
io_benchmark() {
    echo -e "${BLUE}📁 Running I/O Benchmark...${NC}"
    start_time=$(date +%s%N)
    
    # Тест записи/чтения
    test_file="/sdcard/io_test.tmp"
    dd if=/dev/zero of="$test_file" bs=1M count=5 >/dev/null 2>&1
    sync
    dd if="$test_file" of=/dev/null bs=1M >/dev/null 2>&1
    rm -f "$test_file" 2>/dev/null
    
    end_time=$(date +%s%N)
    io_time=$(( (end_time - start_time) / 1000000 ))
    
    echo -e "${GREEN}✅ I/O Test completed in ${io_time}ms${NC}"
    echo "I/O Performance: ${io_time}ms" >> "$RESULTS_FILE"
}

# Системная информация
system_info() {
    echo -e "${BLUE}📊 System Information:${NC}" >> "$RESULTS_FILE"
    {
        echo "Device: $(getprop ro.product.model)"
        echo "Android: $(getprop ro.build.version.release)"
        echo "MIUI: $(getprop ro.miui.ui.version.name)"
        echo "Kernel: $(uname -r)"
        echo "CPU Cores: $(cat /sys/devices/system/cpu/possible 2>/dev/null)"
        echo "Test Date: $(date)"
    } >> "$RESULTS_FILE"
    echo "======================================" >> "$RESULTS_FILE"
}

# Полный бенчмарк
full_benchmark() {
    echo -e "${BLUE}🏃 Starting Full Benchmark...${NC}"
    
    # Очистка предыдущих результатов
    mkdir -p "/sdcard/HyperOS_Toolkit"
    echo "=== HYPEROS BENCHMARK RESULTS ===" > "$RESULTS_FILE"
    
    system_info
    cpu_benchmark
    memory_benchmark
    io_benchmark
    
    echo -e "${GREEN}🎉 Benchmark completed!${NC}"
    echo -e "${BLUE}📄 Results saved to: $RESULTS_FILE${NC}"
}

# Быстрый тест
quick_test() {
    echo -e "${BLUE}⚡ Quick Performance Test...${NC}"
    
    # Быстрый CPU тест
    start_time=$(date +%s%N)
    for i in $(seq 1 1000); do
        result=$((i * i))
    done
    end_time=$(date +%s%N)
    quick_time=$(( (end_time - start_time) / 1000000 ))
    
    echo -e "${GREEN}✅ Quick Test: ${quick_time}ms${NC}"
    
    # Оценка производительности
    if [ $quick_time -lt 100 ]; then
        echo -e "${GREEN}🎯 Performance: Excellent${NC}"
    elif [ $quick_time -lt 500 ]; then
        echo -e "${YELLOW}🎯 Performance: Good${NC}"
    else
        echo -e "${RED}🎯 Performance: Needs optimization${NC}"
    fi
}

# Просмотр результатов
view_results() {
    if [ -f "$RESULTS_FILE" ]; then
        echo -e "${BLUE}📋 Previous Benchmark Results:${NC}"
        cat "$RESULTS_FILE"
    else
        echo -e "${YELLOW}No previous results found${NC}"
    fi
}

# Главное меню
main() {
    echo -e "${BLUE}1. 🏃 Full Benchmark (All tests)${NC}"
    echo -e "${BLUE}2. ⚡ Quick Performance Test${NC}"
    echo -e "${BLUE}3. 📋 View Previous Results${NC}"
    echo -e "${RED}0. Exit${NC}"
    echo ""
    echo -n "Enter choice: "
    read choice
    
    case $choice in
        1) full_benchmark ;;
        2) quick_test ;;
        3) view_results ;;
        0) echo "👋 Goodbye!"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid choice${NC}" ;;
    esac
}

main
