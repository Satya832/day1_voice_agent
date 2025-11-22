# Day 1 – AI Voice Agent (Murf Falcon + LiveKit + Deepgram + Gemini)

This repository contains my Day 1 project for the Murf AI Voice Agent Challenge.
It includes a Python backend and a React frontend for building a real-time AI voice agent using Murf Falcon TTS, LiveKit Cloud, Deepgram STT, and Google Gemini LLM.

## Features

1. Real-time voice interaction using LiveKit
2. AI-generated responses powered by Google Gemini
3. Ultra-fast TTS using Murf Falcon
4. Accurate speech recognition using Deepgram
5. Clean React + Next.js calling interface
6. Production-ready LiveKit Agent backend

## Project Structure
```
day1_voice_agent/
├── backend/        # Python LiveKit Agent + Murf Falcon TTS
├── frontend/       # React (Next.js) UI for voice calling
├── start_app.sh    # Convenience script to run backend + frontend
└── README.md
```

## Tech Stack

| Component | Technology |
|-----------|------------|
| Real-time infra | LiveKit Cloud |
| TTS | Murf Falcon |
| STT | Deepgram |
| LLM | Google Gemini |
| Backend | Python (uv) |
| Frontend | React, Next.js |
| Voice I/O | LiveKit Voice Agents SDK |

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/Satya832/day1_voice_agent.git
cd day1_voice_agent
```

### 2. Backend Setup
```bash
cd backend
uv sync
cp .env.example .env.local
```

Fill in your API keys inside `.env.local`:
```bash
LIVEKIT_URL=
LIVEKIT_API_KEY=
LIVEKIT_API_SECRET=
MURF_API_KEY=
GOOGLE_API_KEY=
DEEPGRAM_API_KEY=
```

Download LiveKit model files:
```bash
uv run python src/agent.py download-files
```

### 3. Frontend Setup
```bash
cd ../frontend
pnpm install
cp .env.example .env.local
```

Set:
```bash
NEXT_PUBLIC_LIVEKIT_URL=<your LiveKit Cloud URL>
```

### 4. Running the Application

#### Option A: Run Everything Automatically

From the project root:
```bash
chmod +x start_app.sh
./start_app.sh
```

This script:
* Starts backend agent
* Starts frontend
* Opens the browser
* Allows shutdown with Ctrl + C

#### Option B: Run Manually

Backend:
```bash
cd backend
uv run python src/agent.py dev
```

Frontend:
```bash
cd frontend
pnpm dev
```

Open the app at:
```
http://localhost:3000
```

## Troubleshooting

### Agent joined but did not initialize
Do not use folder names containing special characters. Use simple ASCII folder names like `day1_voice_agent`.

### "mediaDevices is undefined"
Only works on:
```
http://localhost:3000
```

Do not open HTML directly.

### Backend errors
Check all environment variables are correctly set.

## Challenge Notes

This is Day 1 of the Murf AI Voice Agent Challenge. Requirements completed:
* Backend + frontend connected
* Murf Falcon integrated
* LiveKit Cloud connected
* Agent responds in real-time

## License

For challenge use. You may modify and extend as needed.
