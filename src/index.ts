import express, { Request, Response } from "express";
import dotenv from "dotenv";
import tasksRouter from './routes/api/tasks'

dotenv.config();

const app = express();
const PORT = process.env.PORT as string

app.get('/', async (req: Request, res: Response) => {
    res.send('Express + TypeScript server');
});

app.use('/api/tasks', tasksRouter);

app.listen(PORT, () => {
    console.log(`[server]: Server is running on port ${PORT}`)
})