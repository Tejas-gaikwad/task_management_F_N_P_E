import { Router } from 'express';
import getAllTasks from '../controllers/tasks_controllers/get_all_tasks/getAllTask';
import createTask from '../controllers/tasks_controllers/create_task/createtask';
import { updateTask } from '../controllers/tasks_controllers/update_task/update_task';

const router = Router();

router.post('/createTask', createTask);
router.get('/getAllTasks', getAllTasks);
router.put('/updateTask', updateTask);

export default router;