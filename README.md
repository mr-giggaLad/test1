# 🎨 DRAW OFF - The Ultimate Dumb Drawing Battle Arena 🎨

A hilarious web app where you and your brothers can draw terrible pictures, post them online, and vote on whose is the worst. It's like Instagram meets kindergarten art class.

## 🚀 Quick Start

### Prerequisites
- Node.js installed
- (Optional) MongoDB for persistent storage

### Setup

1. **Install server dependencies:**
```bash
cd server
npm install
```

2. **Start the server:**
```bash
npm start
```

The server will start on `http://localhost:3001`

3. **Open in browser:**
Visit `http://localhost:3001` in your web browser

## 🎮 How to Play

1. **Enter your name** (real or fake - no judgment here)
2. **Draw something hilariously bad** - use the color palette and brush size controls
3. **Click "POST MY MASTERPIECE"** to upload your artwork
4. **Watch your brothers vote** - each vote is a roast 🔥
5. **See who wins** - highest voted drawing is the "champion"

## 🎨 Features

- **Drawing Canvas** - Full drawing capability with color picker and adjustable brush size
- **Voting System** - Vote to "roast" drawings you think are the funniest/worst
- **Live Gallery** - Real-time updates of all drawings (refreshes every 2 seconds)
- **Leaderboard** - Drawings sorted by votes
- **Stats Dashboard** - Total drawings, votes, and current champion tracked
- **Funny UI** - Comic Sans font and hilarious copy throughout
- **Mobile Responsive** - Works on phones, tablets, and desktops
- **Undo & Clear** - Mess up? Clear or undo your strokes
- **In-Memory Fallback** - Works without MongoDB (uses local storage)

## 📁 Project Structure

```
test1/
├── client/
│   └── index.html          # Frontend app (HTML, CSS, JavaScript)
├── server/
│   ├── server.js           # Express backend
│   ├── package.json        # Node dependencies
│   └── .env.example        # Environment variables example
└── README.md              # This file
```

## 🛠️ Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript (Canvas API)
- **Backend:** Node.js, Express.js
- **Database:** MongoDB (optional - has in-memory fallback)
- **Styling:** Custom CSS with Comic Sans energy

## 🚀 Advanced Setup (With MongoDB)

1. Install MongoDB or use MongoDB Atlas
2. Update the `MONGODB_URI` in `server/.env`:
```
MONGODB_URI=mongodb://localhost:27017/drawoff
```
3. Restart the server

## 📝 API Endpoints

- `GET /api/drawings` - Get all drawings (sorted by votes)
- `POST /api/drawings` - Submit a new drawing
- `POST /api/drawings/:id/vote` - Vote for a drawing
- `DELETE /api/drawings/:id` - Delete a drawing
- `GET /api/stats` - Get game statistics

## 🎯 Deployment

To deploy this app:

1. **Frontend:** Can be hosted on any static hosting (Vercel, Netlify, GitHub Pages)
2. **Backend:** Can be hosted on Heroku, Railway, or any Node.js hosting
3. **Database:** Use MongoDB Atlas for cloud database

## 🤣 Tips for Maximum Hilarity

- Draw with your mouse (it's harder than you think)
- Use different colors for maximum chaos
- Vote ironically - the worst drawings are the funniest
- Come up with funny artist names
- Screenshot the leaderboard for bragging rights

## 🐛 Troubleshooting

**"Server is sleeping" error?**
- Make sure the backend server is running on port 3001

**Drawings not saving?**
- Check your MongoDB connection or don't worry - it saves in memory anyway!

**Refresh and everything disappears?**
- Without MongoDB, drawings are stored in memory only. Set up MongoDB for persistent storage.

## 📜 License

MIT - Do whatever you want with it. Draw bad pictures freely!

---

**Made with ❤️ and zero artistic skill** 🎨

Enjoy roasting your brothers' drawings! May the worst artist win! 🏆
