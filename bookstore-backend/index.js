const express = require('express')
const cors = require('cors');
const bookRouter = require('./routes/book-routes')

const PORT = process.env.PORT || 8080

const app = express()

app.use(cors());

app.use(express.json())
app.use('/witch', bookRouter)

app.listen(PORT, () => console.log(`server started on post ${PORT}`))
