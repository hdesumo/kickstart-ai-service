# Utilise l'image officielle Ollama
FROM ollama/ollama:latest

# Télécharge le modèle Mistral au moment de la build
RUN ollama pull mistral

# Expose l'API Ollama par défaut
EXPOSE 11434

# Démarre le service Ollama
CMD ["ollama", "serve"]
