
import { Request, Response } from 'express';
import db from '../../../database/database';

export const  updateTask = async (req : Request, res : Response) => {

    try{
        
        console.log("Updating - ->>>  ");

        const { task_id } = req.body;

        console.log("REsponse ->>>    " + task_id);

        const res = await db.query('SELECT * from Tasks WHERE task_id =$1', [task_id]);

        console.log("REsponse ->>>    " + res.data);

    } catch(error) {
        console.log("error ->>>    " + error);
    }

}