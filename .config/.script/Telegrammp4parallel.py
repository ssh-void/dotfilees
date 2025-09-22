#!/usr/bin/env python3
import os
import asyncio
from telethon import TelegramClient
from telethon.tl.types import DocumentAttributeFilename


# 📌 Remplace par tes identifiants API
api_id = xxxxxxx   # Ton API ID
api_hash = 'xxxxxxxxxxxxxxxxx'  # Ton API Hash
channel_username = "xxxxxxxxxx"  # Ex: 't.me/nom_du_canal' → mettre 'nom_du_canal' pas @
download_folder = "NamofFoldr"  # Dossier de téléchargement

# 📁 Créer le dossier si inexistant
os.makedirs(download_folder, exist_ok=True)

# 🔒 Limiter les téléchargements simultanés
sema = asyncio.Semaphore(3)  # Maximum 3 téléchargements à la fois

# Fonction pour télécharger une vidéo
async def download_video(message, filename):
    path = os.path.join(download_folder, filename)
    async with sema:
        print(f"📥 Téléchargement vidéo : {path}")
        try:
            await message.download_media(file=path)
        except Exception as e:
            print(f"❌ Erreur lors du téléchargement : {e}")

# Fonction principale asynchrone
async def main():
    async with TelegramClient('session_name', api_id, api_hash) as client:
        print("✅ Connecté à Telegram !")

        # Récupérer tous les messages
        messages = await client.get_messages(channel_username, limit=None)
        messages = sorted(messages, key=lambda msg: msg.date)

        tasks = []
        video_counter = 0

        for message in messages:
            if message.video:
                filename = message.file.name or f"video_{video_counter}.mp4"
                # Nettoyage du nom
                filename = "".join(c if c.isalnum() or c in " _-." else "_" for c in filename)
                filename = f"{video_counter:03d}-{filename}"
                tasks.append(download_video(message, filename))
                video_counter += 1

        # Lancer tous les téléchargements avec limitation du sémaphore
        await asyncio.gather(*tasks)

    print("✅ Toutes les vidéos ont été téléchargées avec numérotation !")

# Lancer le script
if __name__ == "__main__":
    asyncio.run(main())
