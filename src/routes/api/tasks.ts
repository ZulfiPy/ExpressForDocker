import express from "express";
import { getTasks } from "../../controllers/tasksController";

const router = express.Router();

router.get('/', getTasks)

export default router;