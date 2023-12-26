
import { Request, Response } from 'express';
import db from '../../../database/database';

export const updateTask = async (req : Request, res : Response) => {
    try{
        const { task_name, task_desc, task_priority, task_date, task_status, task_id } = req.body;
        const result = await db.query('UPDATE tasks SET task_name = $1, task_desc = $2, task_priority = $3, task_date = $4 WHERE task_id = $6', [task_name, task_desc, task_priority, task_date, task_status, task_id]);
        if (result == null) {
            return res.status(404).json({ error: 'Task not updated' });
        } else {
            return res.status(200).json({data : result, message : 'Update success.'});
        }
    } catch(error) {
        console.log("error ->>>    " + error);
    }
}