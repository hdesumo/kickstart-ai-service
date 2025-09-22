FROM ollama/ollama:latest

# Supprime l'ENTRYPOINT par défaut d'Ollama
ENTRYPOINT []

# Expose l'API Ollama
EXPOSE 11434

# Ajoute le script custom
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Lance le script custom
CMD ["/entrypoint.sh"]
