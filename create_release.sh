#!/system/bin/sh
echo "📦 HyperOS Toolkit Release Builder v5.0"
echo "========================================"

VERSION="5.0"
RELEASE_DIR="hyperos-toolkit-v$VERSION"
RELEASE_FILE="$RELEASE_DIR.tar.gz"

echo "🔧 Creating release directory..."
mkdir -p $RELEASE_DIR

echo "📁 Copying files..."
# Копируем основные скрипты
cp *.sh $RELEASE_DIR/
cp README.md $RELEASE_DIR/
cp LICENSE $RELEASE_DIR/

echo "📝 Creating version file..."
echo "HyperOS Ultimate Toolkit v$VERSION" > $RELEASE_DIR/version.txt
echo "Build date: $(date)" >> $RELEASE_DIR/version.txt
echo "Device: $(getprop ro.product.model)" >> $RELEASE_DIR/version.txt

echo "🗜️ Creating archive..."
tar -czf $RELEASE_FILE $RELEASE_DIR/

echo "✅ Release package created: $RELEASE_FILE"
echo ""
echo "📋 Files included:"
ls -la $RELEASE_DIR/
echo ""
echo "📊 Archive info:"
ls -lh $RELEASE_FILE
