import { Request, Response } from 'express';
import db from '../../../database/database';


export const getAllTasks = async (req:Request, res:Response) => {
    try{

       const response = await db.query('SELECT * FROM tasks');
       res.status(200).json({data : response});

    }catch(error){

        console.log('error ->>>>   '+ error);
        res.status(500).json({error : error});
    }
}

export default getAllTasks;