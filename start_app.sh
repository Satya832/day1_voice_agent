#!/bin/bash

echo "🚀 Starting Day 1 Voice Agent..."

###############################################
# 1. Start Backend
###############################################
echo "📡 Starting backend agent..."
cd backend || exit
uv run python src/agent.py dev &
BACKEND_PID=$!
cd ..

###############################################
# 2. Start Frontend
###############################################
echo "🖥️ Starting frontend..."
cd frontend || exit
pnpm dev &
FRONTEND_PID=$!
cd ..

###############################################
# 3. Wait and open browser automatically
###############################################
echo "⏳ Waiting for frontend to start..."
sleep 5

URL="http://localhost:3000"

echo "🌐 Opening browser at: $URL"

# Try multiple browser open methods (Kali-compatible)
if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL"
elif command -v sensible-browser >/dev/null 2>&1; then
    sensible-browser "$URL"
elif command -v firefox >/dev/null 2>&1; then
    firefox "$URL"
else
    echo "⚠️ Could not auto-open browser. Please open: $URL manually."
fi


echo ""
echo "✨ Voice agent is running!"
echo "--------------------------------------"
echo "Press CTRL + C to stop everything."
echo "--------------------------------------"
echo ""

###############################################
# 4. Handle shutdown
###############################################
cleanup() {
  echo ""
  echo "🛑 Stopping backend & frontend..."
  kill $BACKEND_PID 2>/dev/null
  kill $FRONTEND_PID 2>/dev/null
  echo "✔ All services stopped."
  exit 0
}

trap cleanup INT

# Keep script alive
while true; do sleep 1; done

