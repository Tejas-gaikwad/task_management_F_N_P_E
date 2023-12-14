import { Router } from 'express';
import createTask from '../controllers/createtask';

const router = Router();

router.post('/createTask', createTask)

export default router;