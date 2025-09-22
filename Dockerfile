FROM ollama/ollama:latest

# Expose l'API Ollama
EXPOSE 11434

# Script d'entrée qui démarre Ollama + télécharge mistral si absent
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
