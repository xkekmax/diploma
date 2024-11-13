const Router = require('express')
const router = new Router()
const BookController = require('../controllers/book-controller')


router.get('/books', BookController.getBooks)
router.get('/book/:id', BookController.getBook)



module.exports = router