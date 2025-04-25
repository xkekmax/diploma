const Router = require('express')
const router = new Router()
const BookController = require('../controllers/book-controller')
const UserController = require('../controllers/user-controller')

router.get('/orders/:id', UserController.getUserOrders);
router.post('/register', UserController.addUser)
router.post('/autorization', UserController.autorizeUser)

router.get('/books', BookController.getBooks)
router.get('/book/:id', BookController.getBook)

router.get('/favorites', BookController.getFavorites)
router.post('/favorite', BookController.addFavorite)
router.delete('/favorite/:id', BookController.deleteFavorite)

router.post('/drawer', BookController.createDrawer)

module.exports = router