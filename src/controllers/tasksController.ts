import { Request, Response } from "express";

const getTasks = async (req: Request, res: Response) => {
    const tasks = [
        { id: 1, description: 'lol kak tak' },
        { id: 2, description: 'tak i tak' },
        { id: 3, description: 'Mirlan did not wake up and is late to the service' }
    ]

    return res.status(200).json(tasks)
}

export {
    getTasks
}