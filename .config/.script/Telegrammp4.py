#!/usr/bin/env python3
import os
from telethon.sync import TelegramClient
from telethon.tl.types import DocumentAttributeFilename

# 📌 Remplace par tes identifiants API
api_id = xxxxxx   # Ton API ID
api_hash = 'xxxxx'  # Ton API Hash
channel_username = "xxx"  # Ex: 't.me/nom_du_canal' → mettre 'nom_du_canal'
download_folder = "xxxx"  # Dossier de téléchargement

# 📁 Créer un dossier pour stocker les vidéos
os.makedirs("videos", exist_ok=True)

with TelegramClient('session_name', api_id, api_hash) as client:
    print("✅ Connecté à Telegram !")

    # 🔄 Récupérer tous les messages (triés du plus ancien au plus récent)
    messages = client.get_messages(channel_username, limit=None)
    messages = sorted(messages, key=lambda msg: msg.date)  # Tri par date croissante

    video_counter = 0  # Compteur pour les vidéos

    for message in messages:
        if message.video:  # 🎥 Vérifier si le message contient une vidéo
            filename = message.file.name or f"video_{video_counter}.mp4"
            filename = "".join(c if c.isalnum() or c in " _-." else "_" for c in filename)  # Nettoyage du nom
            filename = f"{video_counter:03d}-{filename}"  # Format "000-NomDuFichier.mp4"
            path = os.path.join("videos", filename)

            print(f"📥 Téléchargement vidéo : {path}")
            message.download_media(file=path)

            video_counter += 1  # Incrémenter le compteur

print("✅ Toutes les vidéos ont été téléchargées avec numérotation !")
