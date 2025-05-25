const Router = require('express');
const router = new Router();
const path = require('path');
const multer = require('multer');
const BookController = require('../controllers/book-controller');
const UserController = require('../controllers/user-controller');

// Настройка multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '..', 'vue-bookstore', 'public', 'books'));
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    cb(null, `book-${uniqueSuffix}${path.extname(file.originalname)}`);
  }
});
const upload = multer({ storage });

router.post('/register', UserController.addUser);
router.post('/autorization', UserController.autorizeUser);

router.get('/admin/:id', UserController.getAdminById);
router.put('/admin/:id', UserController.updateAdmin);

router.get('/user/:id', UserController.getUserById);
router.put('/user/:id', UserController.updateUser);
router.get('/orders/:id', UserController.getUserOrders);

router.get('/books', BookController.getBooks);
router.get('/book/:id', BookController.getBook);

// Передаём upload.single для загрузки файла обложки
router.post('/book', BookController.addBook);
router.post('/book/upload', upload.single('image'), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ message: 'Файл не загружен' });
  }

  // Сформировать путь в нужном формате
  const filePath = `..\\..\\books\\${req.file.filename}`;
  res.json({ filePath });
});
router.put('/book/:id', BookController.updateBook);
router.delete('/book/:id', BookController.deleteBook);

router.get('/favorites', BookController.getFavorites);
router.post('/favorite', BookController.addFavorite);
router.delete('/favorite/:id', BookController.deleteFavorite);

router.post('/drawer', BookController.createDrawer);

module.exports = router;