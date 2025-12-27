const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const path = require('path');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb' }));

// Connect to MongoDB
mongoose.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017/drawoff', {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => {
    console.log('✨ Connected to MongoDB - Time to draw some dumb stuff! ✨');
}).catch(err => {
    console.log('❌ MongoDB connection failed (no worries, use in-memory storage):');
    console.log(err.message);
});

// Drawing Schema
const drawingSchema = new mongoose.Schema({
    name: { type: String, required: true },
    imageData: { type: String, required: true },
    votes: { type: Number, default: 0 },
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now }
});

const Drawing = mongoose.model('Drawing', drawingSchema);

// Fallback in-memory storage if MongoDB isn't available
let drawingsMemory = [];
let nextId = 1;

// API Routes

// Get all drawings
app.get('/api/drawings', async (req, res) => {
    try {
        const drawings = await Drawing.find().sort({ votes: -1, createdAt: -1 });
        res.json(drawings);
    } catch (error) {
        // Fallback to memory storage
        res.json(drawingsMemory.sort((a, b) => b.votes - a.votes));
    }
});

// Submit a drawing
app.post('/api/drawings', async (req, res) => {
    try {
        const { name, imageData } = req.body;

        if (!name || !imageData) {
            return res.status(400).json({ error: 'You forgot your name or forgot to draw, you doof!' });
        }

        let drawing;
        
        try {
            drawing = new Drawing({
                name,
                imageData,
                votes: 0
            });

            await drawing.save();
        } catch (dbError) {
            // Fallback to memory storage
            drawing = {
                _id: nextId++,
                name,
                imageData,
                votes: 0,
                createdAt: new Date()
            };
            drawingsMemory.push(drawing);
        }

        res.status(201).json({
            message: '🎉 POSTED! Everyone can now judge your artwork 🎉',
            drawing
        });
    } catch (error) {
        console.error('Error submitting drawing:', error);
        res.status(500).json({ error: 'Something went hilariously wrong' });
    }
});

// Vote for a drawing
app.post('/api/drawings/:id/vote', async (req, res) => {
    try {
        const { id } = req.params;

        let updatedDrawing;

        try {
            updatedDrawing = await Drawing.findByIdAndUpdate(
                id,
                { $inc: { votes: 1 }, updatedAt: new Date() },
                { new: true }
            );

            if (!updatedDrawing) {
                return res.status(404).json({ error: 'Drawing not found' });
            }
        } catch (dbError) {
            // Fallback to memory storage
            const drawing = drawingsMemory.find(d => d._id == id);
            if (!drawing) {
                return res.status(404).json({ error: 'Drawing not found' });
            }
            drawing.votes++;
            updatedDrawing = drawing;
        }

        res.json({
            message: `🔥 ROASTED! ${updatedDrawing.name}'s drawing now has ${updatedDrawing.votes} votes of shame! 🔥`,
            drawing: updatedDrawing
        });
    } catch (error) {
        console.error('Error voting:', error);
        res.status(500).json({ error: 'Vote failed, dummy!' });
    }
});

// Delete a drawing (admin only - for removing truly horrific stuff)
app.delete('/api/drawings/:id', async (req, res) => {
    try {
        const { id } = req.params;

        try {
            const deletedDrawing = await Drawing.findByIdAndDelete(id);
            
            if (!deletedDrawing) {
                return res.status(404).json({ error: 'Drawing not found' });
            }

            res.json({ message: '🗑️ DELETED! That embarrassment is gone forever 🗑️' });
        } catch (dbError) {
            // Fallback to memory storage
            drawingsMemory = drawingsMemory.filter(d => d._id != id);
            res.json({ message: '🗑️ DELETED! That embarrassment is gone forever 🗑️' });
        }
    } catch (error) {
        console.error('Error deleting drawing:', error);
        res.status(500).json({ error: 'Deletion failed' });
    }
});

// Get stats
app.get('/api/stats', async (req, res) => {
    try {
        const drawings = await Drawing.find();
        const stats = {
            totalDrawings: drawings.length,
            totalVotes: drawings.reduce((sum, d) => sum + d.votes, 0),
            topVotes: drawings.length > 0 ? Math.max(...drawings.map(d => d.votes)) : 0
        };
        res.json(stats);
    } catch (error) {
        // Fallback
        const stats = {
            totalDrawings: drawingsMemory.length,
            totalVotes: drawingsMemory.reduce((sum, d) => sum + d.votes, 0),
            topVotes: drawingsMemory.length > 0 ? Math.max(...drawingsMemory.map(d => d.votes)) : 0
        };
        res.json(stats);
    }
});

// Serve the frontend
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../client/index.html'));
});

// Start server
app.listen(PORT, () => {
    console.log(`\n🎨🎨🎨🎨🎨🎨🎨🎨🎨🎨`);
    console.log(`\n  DRAW OFF is LIVE at http://localhost:${PORT}`);
    console.log(`  Time to draw something hilariously bad! 🖌️`);
    console.log(`\n🎨🎨🎨🎨🎨🎨🎨🎨🎨🎨\n`);
});

// Graceful shutdown
process.on('SIGINT', () => {
    console.log('\n👋 Server shutting down... thanks for the laughs!');
    process.exit(0);
});
