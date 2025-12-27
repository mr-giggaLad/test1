#!/usr/bin/env bash
# DRAW OFF - Visual Setup Guide
# Run this to see the pretty setup info

cat << "EOF"

╔════════════════════════════════════════════════════════════════════════════╗
║                                                                            ║
║             🎨 DRAW OFF - QUICK REFERENCE CARD 🎨                        ║
║                                                                            ║
║        "Where Bad Artists Become Legend (Ironically)"                    ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝


⚡ FASTEST START (30 SECONDS):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  $ cd server
  $ npm start

  Then open: http://localhost:3001


🎮 THE GAME:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1️⃣  Draw something hilariously bad
  2️⃣  Click "POST MY MASTERPIECE"
  3️⃣  Brothers vote by clicking "ROAST IT"
  4️⃣  Highest votes = funniest (worst) artist


🛠️ COMMANDS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  npm start           Start server
  make install        Install dependencies
  make start          Start with make
  make dev            Start with auto-reload
  chmod +x start.sh   Make script executable
  ./start.sh          Run shell script


📚 DOCS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  README.md           Full documentation
  STARTUP.md          Detailed setup guide
  PROJECT_SUMMARY.md  Overview & features
  SETUP_GUIDE.txt     This visual guide


🌐 MULTIPLAYER (Same Network):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Find IP:  ifconfig (Mac/Linux) or ipconfig (Windows)
  Share:    http://YOUR.IP:3001
  Example:  http://192.168.1.5:3001


✨ PROJECT READY! ✨

Everything is installed and ready to go!

Just run:  cd server && npm start

Then draw and roast! 🎨

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF

echo ""
ls -la client/ server/
