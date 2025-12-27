#!/bin/bash

echo "🎨 DRAW OFF Setup Script 🎨"
echo "================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

echo "✅ Node.js version: $(node -v)"
echo ""

# Install server dependencies
echo "📦 Installing server dependencies..."
cd server
npm install

if [ $? -eq 0 ]; then
    echo "✅ Server dependencies installed!"
else
    echo "❌ Failed to install server dependencies"
    exit 1
fi

cd ..

echo ""
echo "✨ Setup complete! ✨"
echo ""
echo "To start the app:"
echo "  1. cd server"
echo "  2. npm start"
echo "  3. Open http://localhost:3001 in your browser"
echo ""
echo "🚀 Ready to draw some dumb stuff!"
