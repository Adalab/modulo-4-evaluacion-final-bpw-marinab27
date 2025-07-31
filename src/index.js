import express from 'express';
import cors from 'cors';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';  
dotenv.config();
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

const server = express();
const port = 4000; 

server.use(express.json()); 
server.use(cors()); 

server.listen(port, () => {
    console.log(`Servidor escuchando por http://localhost:${port}`);
})

const getConnection = async () => {
    const connection = await mysql.createConnection({
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: process.env.DB_PORT
    })
    return connection;
}


server.get("/frase", async (req, res) => {
const conn = await getConnection();
const [result] = await conn.query("SELECT * FROM frases ORDER BY RAND() LIMIT 1");

await conn.end();

res.json(result[0]);
});

 