#!/bin/sh
set -e

echo "🚀 Démarrage du serveur Ollama..."
ollama serve &

# Petite pause pour laisser le serveur démarrer
sleep 3

# Vérifie si le modèle mistral existe déjà, sinon le télécharge
if ! ollama list | grep -q "mistral"; then
  echo "⬇️ Téléchargement du modèle mistral..."
  ollama pull mistral
else
  echo "✅ Modèle mistral déjà présent"
fi

# Garde le container actif
wait -n
