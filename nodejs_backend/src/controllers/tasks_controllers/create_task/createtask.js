"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createTask = void 0;
const database_1 = __importDefault(require("../../../database/database"));
const createTask = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { task_id, task_name, task_desc, task_priority, task_dateTime } = req.body;
        const taskData = {
            id: task_id,
            name: task_name,
            desc: task_desc,
            priority: task_priority,
            datetime: task_dateTime
        };
        if (task_priority < 1 || task_priority > 5) {
            res.status(200).json({ error: "Priority must be between 1 and 5" });
        }
        else {
            const newTask = yield database_1.default.one('INSERT INTO tasks(task_id, task_name, task_desc,task_priority, task_date) VALUES($1, $2, $3, $4, $5) RETURNING *', [
                taskData.id,
                taskData.name,
                taskData.desc,
                taskData.priority,
                taskData.datetime
            ]);
            res.status(201).json({
                'status': true,
                'response': 'Task created successfully',
                'data': newTask
            });
        }
    }
    catch (error) {
        res.status(500).json({ error: error });
    }
});
exports.createTask = createTask;
exports.default = exports.createTask;
