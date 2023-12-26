"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const getAllTask_1 = __importDefault(require("../controllers/tasks_controllers/get_all_tasks/getAllTask"));
const createtask_1 = __importDefault(require("../controllers/tasks_controllers/create_task/createtask"));
const update_task_1 = require("../controllers/tasks_controllers/update_task/update_task");
const router = (0, express_1.Router)();
router.post('/createTask', createtask_1.default);
router.get('/getAllTasks', getAllTask_1.default);
router.put('/updateTask', update_task_1.updateTask);
exports.default = router;
