import pgPromise from 'pg-promise';

const pgp = pgPromise();
const db = pgp({
  connectionString: 'postgresql://postgres:Madhav@6745@localhost:5432/Task_manager',
});

export default db;