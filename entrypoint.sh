#!/bin/sh
set -e

echo "🚀 Démarrage du serveur Ollama..."
ollama serve &

# Attendre que le serveur démarre
sleep 3

if ! ollama list | grep -q "mistral"; then
  echo "⬇️ Téléchargement du modèle mistral..."
  ollama pull mistral
else
  echo "✅ Modèle mistral déjà présent"
fi

# Rester actif
wait -n
