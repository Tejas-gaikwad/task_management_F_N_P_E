"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const pg = require('pg');
const tasks_router_1 = __importDefault(require("./routes/tasks_router"));
const body_parser_1 = __importDefault(require("body-parser"));
const app = (0, express_1.default)();
const port = process.env.PORT || 3000;
app.use(body_parser_1.default.json());
const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Task_manager',
    password: 'Madhav@6745',
    port: 5432,
});
// Mount the tasks route
app.use('/api', tasks_router_1.default);
// Test the connection
pool.query('SELECT NOW()', (err, res) => {
    console.log(err ? `Database connection error  -> ${err}` : 'Database connected');
});
app.get('/', (req, res) => {
    res.send('Hello, Express with typescript!');
});
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
