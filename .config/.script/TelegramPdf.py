#!/usr/bin/env python3
# tested in 31-08-2025
import os
from telethon.sync import TelegramClient
from telethon.tl.types import DocumentAttributeFilename

# Remplace par tes identifiants API https://my.telegram.org/apps
api_id =  xxxxxxxx   # Ton API ID
api_hash = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'  # Ton API Hash
channel_username = 'xxxxxxxxx'  # Ex: 't.me/nom_du_canal' → mettre 'nom_du_canal' sans @
download_folder = "xxxxxx"  # Dossier de téléchargement

# Créer le dossier de téléchargement
os.makedirs(download_folder, exist_ok=True)

async def main():
    async with TelegramClient('session_name', api_id, api_hash) as client:
        print(" Connexion établie avec Telegram...")
        # Récupérer tous les messages du canal
        async for message in client.iter_messages(channel_username):
            if message.document:
                try:
                    # Vérifier si c'est un PDF
                    attributes = [a for a in message.document.attributes 
                                if isinstance(a, DocumentAttributeFilename)]
                    if not attributes:
                        continue
                    file_name = attributes[0].file_name
                    if not file_name.lower().endswith('.pdf'):
                        continue

                    # Chemin de destination
                    dest = os.path.join(download_folder, file_name)

                    # Vérifier si le fichier existe déjà
                    if not os.path.exists(dest):
                        print(f" Début du téléchargement: {file_name}")
                        await client.download_media(message, dest)
                        print(f" Succès: {file_name} ({message.document.size/1024/1024:.1f} MB)")
                    else:
                        print(f" Ignoré (existe déjà): {file_name}")

                except Exception as e:
                    print(f" Erreur avec {file_name}: {str(e)}")
                    continue

        print("\n Téléchargement terminé !")
        print(f" Dossier: {os.path.abspath(download_folder)}")

if __name__ == '__main__':
    import asyncio
    asyncio.run(main())
