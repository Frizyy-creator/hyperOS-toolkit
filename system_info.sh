#!/system/bin/sh
echo "📊 HyperOS System Diagnostics"
echo "============================="
echo "Device: $(getprop ro.product.model)"
echo "Android: $(getprop ro.build.version.release)"
echo "MIUI: $(getprop ro.miui.ui.version.name)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(getprop ro.product.cpu.abi)"
