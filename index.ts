import express, { Request, Response } from "express";
import dotenv from "dotenv";
import tasksRouter from "./src/routes/api/tasks";

dotenv.config();

const app = express();
const PORT = process.env.PORT

app.get('/', async (req, res) => {
    res.send('Express + TypeScript server');
});

app.use('/api/tasks', tasksRouter);

app.listen(PORT, () => {
    console.log(`[server]: Server is running on port ${PORT}`)
})