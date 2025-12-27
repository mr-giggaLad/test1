.PHONY: install start dev stop help

help:
	@echo "🎨 DRAW OFF - Available Commands 🎨"
	@echo ""
	@echo "  make install    - Install dependencies"
	@echo "  make start      - Start the server"
	@echo "  make dev        - Start with auto-reload (requires nodemon)"
	@echo "  make help       - Show this help message"
	@echo ""

install:
	@echo "📦 Installing dependencies..."
	cd server && npm install
	@echo "✅ Dependencies installed!"

start:
	@echo "🚀 Starting DRAW OFF server..."
	@echo ""
	cd server && npm start

dev:
	@echo "🚀 Starting DRAW OFF in development mode..."
	@echo ""
	cd server && npm install nodemon && npm run dev
