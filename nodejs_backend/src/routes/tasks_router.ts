import { Router } from 'express';
import createTask from '../controllers/createtask';
import getAllTasks from '../controllers/getAllTask';

const router = Router();

router.post('/createTask', createTask);
router.get('/getAllTasks', getAllTasks)

export default router;