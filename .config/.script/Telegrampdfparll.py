#!/usr/bin/env python3
# tested in 31-08-2025
import os
import asyncio
from telethon import TelegramClient
from telethon.tl.types import DocumentAttributeFilename

# ---- CONFIG ----
api_id = xxxxxxxx   # Ton API ID
api_hash = 'xxxxxxxxxxxxxxxx'  # Ton API Hash
channel_username = "xxxxxxxxx"   # Sans @
download_folder = "xxxxxx"
MAX_PARALLEL = 15      # nb téléchargements en parallèle <20
# -----------------

os.makedirs(download_folder, exist_ok=True)

async def download_pdf(client, message, semaphore):
    """
    Télécharge un PDF si non existant.
    """
    attributes = [a for a in message.document.attributes
                  if isinstance(a, DocumentAttributeFilename)]
    if not attributes:
        return

    file_name = attributes[0].file_name
    if not file_name.lower().endswith(".pdf"):
        return

    dest = os.path.join(download_folder, file_name)

    if os.path.exists(dest):
        print(f" Ignoré (existe déjà): {file_name}")
        return

    async with semaphore:  # limite le nb de tâches parallèles
        try:
            print(f" ⬇️ Début du téléchargement: {file_name}")
            await client.download_media(message, dest)
            print(f" ✅ Succès: {file_name} ({message.document.size/1024/1024:.1f} MB)")
        except Exception as e:
            print(f" ❌ Erreur avec {file_name}: {e}")

async def main():
    async with TelegramClient("session_name", api_id, api_hash) as client:
        print(" Connexion établie avec Telegram...")

        semaphore = asyncio.Semaphore(MAX_PARALLEL)
        tasks = []

        async for message in client.iter_messages(channel_username):
            if message.document:
                tasks.append(download_pdf(client, message, semaphore))

        # Lancer tous les téléchargements
        await asyncio.gather(*tasks)

        print("\n 🚀 Téléchargement terminé !")
        print(f" Dossier: {os.path.abspath(download_folder)}")

if __name__ == "__main__":
    asyncio.run(main())


