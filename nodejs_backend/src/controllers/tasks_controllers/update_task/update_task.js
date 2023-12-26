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
exports.updateTask = void 0;
const database_1 = __importDefault(require("../../../database/database"));
const updateTask = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { task_name, task_desc, task_priority, task_date, task_status, task_id } = req.body;
        const result = yield database_1.default.query('UPDATE tasks SET task_name = $1, task_desc = $2, task_priority = $3, task_date = $4 WHERE task_id = $6', [task_name, task_desc, task_priority, task_date, task_status, task_id]);
        if (result == null) {
            return res.status(404).json({ error: 'Task not updated' });
        }
        else {
            return res.status(200).json({ data: result, message: 'Update success.' });
        }
    }
    catch (error) {
        console.log("error ->>>    " + error);
    }
});
exports.updateTask = updateTask;
