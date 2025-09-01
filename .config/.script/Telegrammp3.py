from telethon.sync import TelegramClient
import os

# 📌 Remplace par tes identifiants API
api_id =  xxxx   # Ton API ID
api_hash = 'xxxxx'  # Ton API Hash
channel_username = 'xxxxx'  # Ex: 't.me/nom_du_canal' → mettre 'nom_du_canal'

# 📁 Créer des dossiers pour stocker les fichiers
os.makedirs("music", exist_ok=True)
os.makedirs("voice", exist_ok=True)

with TelegramClient('session_name', api_id, api_hash) as client:
    print("✅ Connecté à Telegram !")

    # 🔄 Récupérer tous les messages (triés du plus ancien au plus récent)
    messages = client.get_messages(channel_username, limit=None)
    messages = sorted(messages, key=lambda msg: msg.date)  # Tri par date croissante

    music_counter = 0  # Compteur pour les fichiers "Music"
    voice_counter = 0  # Compteur pour les fichiers "Voice"

    for message in messages:
        if message.audio:  # 🎵 Musique
            # 🔍 Vérifier si `title` existe et gérer le cas `None`
            if message.audio.attributes:
                title = message.audio.attributes[0].title or "Unknown"
            else:
                title = "Unknown"

            title = "".join(c if c.isalnum() or c in " _-" else "_" for c in title)  # Nettoyage du nom
            filename = f"{music_counter:03d}-{title}.mp3"  # Format "000-NomDuFichier.mp3"
            path = os.path.join("music", filename)

            print(f"📥 Téléchargement musique : {path}")
            message.download_media(file=path)

            music_counter += 1  # Incrémenter le compteur des musiques

        elif message.voice:  # 🎙️ Messages vocaux
            filename = f"{voice_counter:03d}-VoiceMessage.ogg"  # Format "000-VoiceMessage.ogg"
            path = os.path.join("voice", filename)

            print(f"📥 Téléchargement vocal : {path}")
            message.download_media(file=path)

            voice_counter += 1  # Incrémenter le compteur des voix

print("✅ Tous les fichiers audio ont été téléchargés avec numérotation !")
