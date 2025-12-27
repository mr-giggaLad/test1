#!/usr/bin/env bash
# DRAW OFF - Pre-Flight Checklist
# Verify everything is set up correctly

cat << 'EOF'

╔══════════════════════════════════════════════════════════════════════════╗
║  🎨 DRAW OFF - PRE-FLIGHT CHECKLIST 🎨                                 ║
║                                                                          ║
║  Verify all systems are GO before launching!                           ║
╚══════════════════════════════════════════════════════════════════════════╝

EOF

echo ""

# Function to check and display status
check_item() {
    if [ -f "$1" ] || [ -d "$1" ]; then
        echo "  ✅ $2"
        return 0
    else
        echo "  ❌ $2"
        return 1
    fi
}

echo "📋 CHECKING PROJECT FILES:"
echo ""

all_good=true

check_item "client/index.html" "Frontend app (HTML, CSS, JS)" || all_good=false
echo ""

check_item "server/server.js" "Backend API (Express)" || all_good=false
check_item "server/package.json" "Server dependencies" || all_good=false
check_item "server/node_modules" "Dependencies installed" || all_good=false
check_item "server/.env.example" "Environment config" || all_good=false
echo ""

check_item "README.md" "Full documentation" || all_good=false
check_item "STARTUP.md" "Setup guide" || all_good=false
check_item "PROJECT_SUMMARY.md" "Overview" || all_good=false
check_item "BUILD_COMPLETE.md" "Build summary" || all_good=false
check_item "START_HERE.txt" "Quick start" || all_good=false
check_item "SETUP_GUIDE.txt" "Visual guide" || all_good=false
echo ""

check_item "package.json" "Root npm config" || all_good=false
check_item "Makefile" "Quick commands" || all_good=false
check_item "start.sh" "Start script" || all_good=false
check_item "setup.sh" "Setup script" || all_good=false
echo ""

# Check Node.js installation
echo "🔧 CHECKING SYSTEM:"
echo ""

if command -v node &> /dev/null; then
    echo "  ✅ Node.js installed ($(node -v))"
else
    echo "  ❌ Node.js NOT installed (required!)"
    all_good=false
fi

if command -v npm &> /dev/null; then
    echo "  ✅ npm installed ($(npm -v))"
else
    echo "  ❌ npm NOT installed (required!)"
    all_good=false
fi

echo ""
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""

if [ "$all_good" = true ]; then
    echo "✨ ALL SYSTEMS GO! ✨"
    echo ""
    echo "Ready to launch? Run:"
    echo ""
    echo "  cd server"
    echo "  npm start"
    echo ""
    echo "Then open: http://localhost:3001"
    echo ""
else
    echo "⚠️  SOME ITEMS MISSING"
    echo ""
    echo "Make sure:"
    echo "  1. Node.js is installed (https://nodejs.org/)"
    echo "  2. Run 'npm install' in the server/ folder"
    echo ""
fi

echo "═══════════════════════════════════════════════════════════════════════════"
echo ""

EOF
