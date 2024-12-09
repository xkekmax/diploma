const Router = require('express')
const router = new Router()
const BookController = require('../controllers/book-controller')


router.get('/books', BookController.getBooks)
router.get('/book/:id', BookController.getBook)

router.get('/favorites', BookController.getFavorites)
router.post('/favorite', BookController.addFavorite)
router.delete('/favorite/:id', BookController.deleteFavorite)

router.post('/drawer', BookController.createDrawer)

module.exports = router