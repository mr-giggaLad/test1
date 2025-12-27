#!/usr/bin/env python3
"""
DRAW OFF - Quick Setup Checker
Verifies all files are in place and ready to go!
"""

import os
import sys

def check_file(path, description):
    """Check if a file exists and print status."""
    exists = os.path.exists(path)
    status = "✅" if exists else "❌"
    print(f"  {status} {description}: {path}")
    return exists

def main():
    print("\n🎨 DRAW OFF - Setup Verification 🎨\n")
    
    base_path = os.path.dirname(os.path.abspath(__file__))
    
    print("Checking project structure...")
    
    all_good = True
    
    # Frontend files
    print("\n📱 Frontend:")
    all_good &= check_file(os.path.join(base_path, "client/index.html"), "Drawing app")
    
    # Backend files
    print("\n🔧 Backend:")
    all_good &= check_file(os.path.join(base_path, "server/server.js"), "Express server")
    all_good &= check_file(os.path.join(base_path, "server/package.json"), "Dependencies")
    all_good &= check_file(os.path.join(base_path, "server/node_modules"), "Node modules")
    
    # Documentation
    print("\n📚 Documentation:")
    all_good &= check_file(os.path.join(base_path, "README.md"), "Full README")
    all_good &= check_file(os.path.join(base_path, "STARTUP.md"), "Startup guide")
    all_good &= check_file(os.path.join(base_path, "PROJECT_SUMMARY.md"), "Project summary")
    
    # Config files
    print("\n⚙️ Configuration:")
    all_good &= check_file(os.path.join(base_path, "package.json"), "Root package.json")
    all_good &= check_file(os.path.join(base_path, "Makefile"), "Makefile")
    
    print("\n" + "="*60)
    
    if all_good:
        print("\n✨ ALL FILES READY! You can start the server now! ✨\n")
        print("To start:")
        print("  cd server")
        print("  npm start")
        print("\nThen open: http://localhost:3001")
        print("\n🎨 Have fun drawing and roasting! 🎨\n")
        return 0
    else:
        print("\n❌ Some files are missing! Run npm install in the server folder.\n")
        return 1

if __name__ == "__main__":
    sys.exit(main())
