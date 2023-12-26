import express from 'express';
const pg =  require('pg');
import taskAPIRouter from './routes/tasks_router';
import bodyParsers from 'body-parser';

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParsers.json());

const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Task_manager',
    password: 'Madhav@6745',
    port: 5432,
})

// Mount the tasks route
app.use('/api', taskAPIRouter);


// Test the connection
pool.query('SELECT NOW()', (err:any, res:any) => {
    console.log(err ? `Database connection error  -> ${err}` : 'Database connected');
});

app.get('/', (req, res) => {
    res.send('Hello, Express with typescript!');
})

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})