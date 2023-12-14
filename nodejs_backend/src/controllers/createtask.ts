import { Request, Response } from 'express';
import Task from '../models/task';
import db from '../database/database';

export const createTask = async (req:Request, res:Response) => {
    try{ 
        const {task_id, task_name, task_desc, task_priority, task_dateTime} = req.body;
        const taskData: Task = {
            id :task_id,
            name: task_name, 
            desc :task_desc,
            priority: task_priority,
            datetime: task_dateTime
        };
        if(task_priority <1 || task_priority >5){
            res.status(200).json({error : "Priority must be between 1 and 5"});
        } else {
            const newTask = await db.one('INSERT INTO tasks(task_id, task_name, task_desc,task_priority, task_date) VALUES($1, $2, $3, $4, $5) RETURNING *', [
                taskData.id,
                taskData.name,
                taskData.desc,
                taskData.priority,
                taskData.datetime
              ]);
    
            res.status(201).json({
                'status' : true,
                'response':'Task created successfully',
                'data':newTask
            });
        }
    }catch (error) {
        res.status(500).json({ error: error });
    }
}

export default createTask;