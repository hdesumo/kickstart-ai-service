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

# Garder le conteneur en vie sans bloquer le shell avec wait -n
echo "⏳ Ollama prêt, en attente..."
tail -f /dev/null
