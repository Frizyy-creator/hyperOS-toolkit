#!/system/bin/sh
echo "📊 System Diagnostics"
echo "Device: $(getprop ro.product.model)"
echo "Android: $(getprop ro.build.version.release)"
echo "MIUI: $(getprop ro.miui.ui.version.name)"
