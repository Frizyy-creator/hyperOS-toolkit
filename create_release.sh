#!/system/bin/sh
echo "📦 Creating HyperOS Toolkit v5.0 Release"
VERSION="5.0"
DIR="hyperos-toolkit-v$VERSION"
mkdir -p $DIR
cp *.sh README.md LICENSE $DIR/
echo "v$VERSION - $(date)" > $DIR/version.txt
tar -czf $DIR.tar.gz $DIR/
echo "✅ Created: $DIR.tar.gz"
ls -lh $DIR.tar.gz
