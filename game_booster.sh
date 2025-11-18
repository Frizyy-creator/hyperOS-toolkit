#!/system/bin/sh
echo "🎮 Game Booster Activated"

# Performance mode
setprop debug.sf.nobootanimation 1
setprop ro.config.hw_power_saving false

# Clear cache
sync
echo 3 > /proc/sys/vm/drop_caches

# GPU optimization
setprop debug.egl.profiler 1
setprop debug.egl.swapinterval 0

echo "✅ Game mode optimized!"
