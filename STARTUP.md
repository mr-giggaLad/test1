# 🚀 DRAW OFF - Startup Guide

Welcome to the funniest drawing voting app ever made! Follow these steps to get up and running.

## ⚡ Quick Start (2 minutes)

### Option 1: Using npm (Recommended)

```bash
# 1. Navigate to the server directory
cd server

# 2. Start the server
npm start
```

The app will be available at: **http://localhost:3001**

That's it! Open that URL in your browser and start drawing!

### Option 2: Using Make (If you have Make installed)

```bash
# Install dependencies
make install

# Start the server
make start
```

### Option 3: Using Shell Script

```bash
# Make the script executable (first time only)
chmod +x start.sh

# Run the script
./start.sh
```

---

## 🎮 Once You're Running

1. **Open your browser** and go to `http://localhost:3001`
2. **Enter your name** (or a funny fake name)
3. **Draw something hilariously bad** using:
   - Color palette (8 colors to choose from)
   - Adjustable brush size (1-30px)
   - Undo button for when you mess up
   - Clear button to start over
4. **Click "POST MY MASTERPIECE"** to upload
5. **Vote on your brothers' drawings** by clicking "ROAST IT"
6. **Watch the leaderboard** update in real-time

---

## 🛠️ Troubleshooting

### "Cannot find module 'express'" or similar errors
**Solution:** Install dependencies first
```bash
cd server
npm install
```

### "Port 3001 is already in use"
**Solution:** Either close the other app using port 3001, or change the PORT in server/.env:
```bash
PORT=3002  # Use a different port
```

### "Server is sleeping" error in browser
**Solution:** Make sure the server is running in the terminal. You should see:
```
✨ Connected to MongoDB - Time to draw some dumb stuff! ✨
🎨🎨🎨🎨🎨🎨🎨🎨🎨🎨
  DRAW OFF is LIVE at http://localhost:3001
  Time to draw something hilariously bad! 🖌️
```

### Drawings disappear when I refresh
**Solution:** You need MongoDB for persistent storage. For now, it's just using in-memory storage (which is fine for local testing). To set up MongoDB:

1. Install MongoDB locally, OR
2. Get a free MongoDB Atlas account at https://www.mongodb.com/cloud/atlas
3. Update `server/.env` with your MongoDB connection string
4. Restart the server

---

## 💻 System Requirements

- **Node.js** v14 or higher (download from https://nodejs.org)
- **Modern browser** (Chrome, Firefox, Safari, Edge)
- **MongoDB** (optional - app works without it using in-memory storage)

---

## 🎨 How the App Works

```
┌─────────────────────────────────────────┐
│  Your Browser (Frontend)                │
│  - Canvas drawing app                   │
│  - Gallery view                         │
│  - Voting interface                     │
└──────────────┬──────────────────────────┘
               │ HTTP Requests
               ↓
┌─────────────────────────────────────────┐
│  Node.js Server (Backend)               │
│  - API endpoints                        │
│  - Drawing storage                      │
│  - Vote counting                        │
└──────────────┬──────────────────────────┘
               │ Stores data
               ↓
┌─────────────────────────────────────────┐
│  MongoDB (Optional Database)            │
│  - Persistent drawing storage           │
│  - Vote data                            │
└─────────────────────────────────────────┘
```

---

## 📝 What Gets Stored

Each drawing includes:
- **Artist name** - Who drew it
- **Image data** - The actual drawing
- **Vote count** - How many times it was "roasted"
- **Created at** - When it was posted

---

## 🎯 Tips for Best Experience

1. **Get everyone on the same WiFi** or network to play together
2. **Use funny artist names** for maximum hilarity
3. **Share your local IP** so others can access it (example: `http://192.168.1.5:3001`)
4. **Screenshot the leaderboard** for bragging rights
5. **Come back later to see new drawings** (it updates every 2 seconds)

---

## 🔒 For Multiplayer (On Your Network)

To let your brothers access the app from their devices:

1. Find your computer's local IP address:
   - **Mac/Linux:** Run `ifconfig` in terminal, look for `inet` address
   - **Windows:** Run `ipconfig` in command prompt, look for "IPv4 Address"

2. Share the URL with your brothers: `http://YOUR.IP.ADDRESS:3001`

3. They can now draw and vote on the same app!

---

## 🚀 Advanced: Development Mode

For auto-reload when you edit files:

```bash
cd server
npm install --save-dev nodemon
npm run dev
```

---

## 🐛 Getting Help

If something breaks:

1. Check the terminal where the server is running - there might be error messages
2. Try restarting the server (Ctrl+C to stop, then `npm start` to restart)
3. Clear your browser cache (Ctrl+Shift+Delete)
4. Make sure you're using the latest version of Node.js

---

## 📜 That's It!

You're ready to draw, vote, and roast! May the worst artist win! 🏆

**Enjoy the chaos!** 🎨✨
