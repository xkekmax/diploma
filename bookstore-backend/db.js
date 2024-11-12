const Pool = require('pg').Pool
const pool = new Pool({
    user: "postgres",
    password: 'thoeB4ki',
    host: 'localhost',
    port: 5432,
    database: "diploma"
})

module.exports = pool