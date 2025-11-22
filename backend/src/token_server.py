from dotenv import load_dotenv
load_dotenv(".env.local")

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from livekit import api
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/token")
def generate_token(identity: str = "user"):
    room_name = "default"

    token = api.AccessToken(
        api_key=os.getenv("LIVEKIT_API_KEY"),
        api_secret=os.getenv("LIVEKIT_API_SECRET"),
    )

    token.with_identity(identity)
    token.with_grants(
        api.VideoGrants(room_join=True, room=room_name)
    )

    return {"token": token.to_jwt(), "room": room_name}
