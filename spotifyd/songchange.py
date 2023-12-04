#!/usr/bin/env python3

import os
import sys
import json
import requests

user = os.environ.get("USER") if os.environ.get("USER") else os.environ.get("USERNAME")

if user == "root":
    print("Do not run this as root! It's not needed!")
    sys.exit(1)
elif user in ("", None):
    print("User is not defined. Please define USER or USERNAME env vars.")
    sys.exit(1)

if os.environ.get("PLAYER_EVENT") not in ("change", "start"):
    print("Not song change nor starting")
    sys.exit(0)

token_file = "/tmp/token.json"
cover_file = "/tmp/cover.png"

if "client.json" not in os.listdir(f"/home/{user}/dotfiles/spotifyd/"):
    print("Config file does not exist!")
    sys.exit(1)

client_credentials = json.load(open(f"/home/{user}/dotfiles/spotifyd/client.json", "rt")) 

def get_headers() -> dict[str, str]:
    try:
        with open(token_file, "rt") as f:
            return {
                "Authorization": f"Bearer {json.load(f)['token']}"
            }
    except FileNotFoundError:
        auth()
        with open(token_file, "rt") as f:
            return {
                "Authorization": f"Bearer {json.load(f)['token']}"
            }

def auth() -> None:
    params = {
        "grant_type": "client_credentials",
        **client_credentials
    }
    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }
    res = requests.post("https://accounts.spotify.com/api/token", headers=headers, data=params)
    token = res.json()["access_token"]
    try:
        with open(token_file, "wt") as f:
            json.dump({ "token": token }, f)
    except FileNotFoundError:
        open(token_file, "x").close()
        with open(token_file, "wt") as f:
            json.dump({ "token": token }, f)

track_id = os.environ.get("TRACK_ID")

def notify(res: requests.Response) -> None:
    track = res.json()

    title = track["name"]
    album = track["album"]["name"]
    artist = ", ".join(list(map(lambda x: x["name"], track["artists"])))

    cover = requests.get(track["album"]["images"][0]["url"])
    assert cover.status_code == 200
    try:
        with open(cover_file, "wb") as f:
            f.write(cover.text.encode('utf-8'))
    except FileNotFoundError:
        open(cover_file, "x").close()
        with open(cover_file, "wb") as f:
            f.write(cover.text.encode('utf-8'))

    base_cmd = "notify-send -i {cover} {title} {info}"

    os.system(base_cmd.format(cover=cover_file, title=f'\"Now playing: {title}\"', info=f'\"By {artist} (From {album})\"'))

res = requests.get(f"https://api.spotify.com/v1/tracks/{track_id}", headers=get_headers())

if res.status_code == 200:
    notify(res)
elif res.status_code == 401:
    auth()
    notify(requests.get(f"https://api.spotify.com/v1/tracks/{track_id}"))
else:
    print(res.json())
