const Router = require('express')
const router = new Router()
const BookController = require('../controllers/book-controller')
const UserController = require('../controllers/user-controller')

router.post('/register', UserController.addUser)
router.post('/autorization', UserController.autorizeUser)

router.get('/user/:id', UserController.getUserById);
router.put('/user/:id', UserController.updateUser);

router.get('/cart/:id_customer', BookController.getCart);
router.post('/cart/add', BookController.addToCart);
router.post('/cart/remove', BookController.removeFromCart);

router.get('/orders/:id', UserController.getUserOrders);

router.get('/books', BookController.getBooks)
router.get('/book/:id', BookController.getBook)

router.get('/favorites', BookController.getFavorites)
router.post('/favorite', BookController.addFavorite)
router.delete('/favorite/:id', BookController.deleteFavorite)

module.exports = router