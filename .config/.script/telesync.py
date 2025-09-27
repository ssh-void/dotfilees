#!/usr/bin/env python3
import asyncio
from telethon import TelegramClient

# 📌 Remplace par tes identifiants API
API_ID = xxxxxxxxxxxxxx   # Ton API ID
API_HASH  = 'xxxxxxxxxxxxxxxxxxxx'  # Ton API Hash
SESSION = "session_name.session"       # fichier session (sera créé au premier run)
OUT_FILE = "groups.txt"

async def main():
    client = TelegramClient(SESSION, API_ID, API_HASH)
    await client.start()

    lines = []
    async for dialog in client.iter_dialogs():
        if dialog.is_group or dialog.is_channel:  # inclut supergroups et channels
            entity = dialog.entity
            name = dialog.name
            username = getattr(entity, "username", None)

            if username:
                url = f"https://t.me/{username}"
            else:
                url = "PRIVATE (no link)"

            lines.append(f"{name} -> {url}")

    with open(OUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print(f"Fini ! Résultat écrit dans {OUT_FILE}")
    await client.disconnect()

if __name__ == "__main__":
    asyncio.run(main())
