import express from "express";
import fetch from "node-fetch";
import dotenv from "dotenv";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;
const OLLAMA_URL = process.env.OLLAMA_URL || "http://localhost:11434";

app.use(express.json());

// Middleware simple d'authentification
app.use((req, res, next) => {
  const apiKey = req.headers["x-api-key"];
  if (!apiKey || apiKey !== process.env.AI_SECRET_KEY) {
    return res.status(403).json({ error: "Clé API invalide" });
  }
  next();
});

// Endpoint principal
app.post("/generate", async (req, res) => {
  try {
    const { prompt } = req.body;
    if (!prompt) {
      return res.status(400).json({ error: "Prompt requis" });
    }

    const response = await fetch(`${OLLAMA_URL}/api/generate`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ model: "mistral", prompt })
    });

    const data = await response.json();
    res.json(data);

  } catch (err) {
    console.error("Erreur IA:", err);
    res.status(500).json({ error: "Erreur interne du service IA" });
  }
});

app.listen(PORT, () => {
  console.log(`🚀 Microservice IA prêt sur http://localhost:${PORT}`);
});
