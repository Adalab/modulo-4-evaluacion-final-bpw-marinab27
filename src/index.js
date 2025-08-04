import express from "express";
import cors from "cors";
import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config();
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const server = express();
const port = 4000;

server.use(express.json());
server.use(cors());

server.listen(port, () => {
  console.log(`Servidor escuchando por http://localhost:${port}`);
});

const getConnection = async () => {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
  });
  return connection;
};

server.get("/frases", async (req, res) => {
  try {
    const connection = await getConnection();
    const [rows] = await connection.execute(
      "SELECT f.texto, p.nombre, c.titulo FROM frases AS f JOIN personajes AS p ON f.personaje_id = p.id JOIN capitulos AS c ON f.capitulo_id = c.id"
    );
    await connection.end();

    res.json({
      info: { count: rows.length },
      results: rows,
    });
  } catch (error) {
    res.status(500).json({ error: "Error al obtener las frases" });
  }
});

server.get("/frases/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const connection = await getConnection();
    const [rows] = await connection.execute(
      "SELECT * FROM frases WHERE id = ?",
      [id]
    );
    await connection.end();

    if (rows.length === 0) {
      return res.status(404).json({ error: "Frase no encontrada" });
    }

    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: "Error al obtener la frase" });
  }
});

server.post("/frases", async (req, res) => {
  const { texto, marca_tiempo, descripcion, personaje_id, capitulo_id } =
    req.body;

  if (
    !texto ||
    !marca_tiempo ||
    !descripcion ||
    !personaje_id ||
    !capitulo_id
  ) {
    return res.status(400).json({
      success: false,
      message:
        "Faltan campos obligatorios: texto, marca_tiempo, descripcion, personaje_id o capitulo_id",
    });
  }

  try {
    const connection = await getConnection();
    const [result] = await connection.execute(
      "INSERT INTO frases (texto, marca_tiempo, descripcion, personaje_id, capitulo_id) VALUES (?, ?, ?, ?, ?)",
      [texto, marca_tiempo, descripcion, personaje_id, capitulo_id]
    );
    await connection.end();

    res.status(201).json({
      success: true,
      id: result.insertId,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error al crear la frase",
    });
  }
});

server.put("/frases/:id", async (req, res) => {
  const { id } = req.params;
  console.log("BODY:", req.body);
  const { texto, marca_tiempo, descripcion, personaje_id, capitulo_id } =
    req.body;

  if (
    !texto ||
    !marca_tiempo ||
    !descripcion ||
    !personaje_id ||
    !capitulo_id
  ) {
    return res.status(400).json({
      success: false,
      message:
        "Faltan campos obligatorios: texto, marca_tiempo, descripcion, personaje_id o capitulo_id",
    });
  }

  try {
    const connection = await getConnection();
    const [result] = await connection.execute(
      "UPDATE frases SET texto = ?, marca_tiempo = ?, descripcion = ?, personaje_id = ?, capitulo_id = ? WHERE id = ?",
      [texto, marca_tiempo, descripcion, personaje_id, capitulo_id, id]
    );
    await connection.end();

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: "Frase no encontrada",
      });
    }

    res.json({ success: true });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error al actualizar la frase",
    });
  }
});

server.delete("/frases/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const connection = await getConnection();
    const [result] = await connection.execute(
      "DELETE FROM frases WHERE id = ?",
      [id]
    );
    await connection.end();

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: "Frase no encontrada",
      });
    }

    res.json({ success: true });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error al eliminar la frase",
    });
  }
});
