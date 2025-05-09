const db = require('../db')

class BookController {

    async getBooks(req, res) {
        try {
            const section = req.query.section;
            const searchQuery = req.query.title;
            if (searchQuery) {
                // Если есть параметр title, выполняем поиск
                const books = await db.query('select code_book, book_name, surname_author, cover_art, price from public.books ' +
                    'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                    'where book_name ILIKE $1 OR surname_author ILIKE $1', [`%${searchQuery}%`]);
                return res.json(books.rows);
            }
            
            else if (section == 'title') {
                // все книжки
                const books = await db.query('select code_book, book_name, surname_author, ' +
                    'cover_art, price from public.books ' +
                    'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                    'order by code_book asc');
                return res.json(books.rows);
            }
            else if (section != 'title') {
                // Если есть параметр section, вызываем сортировку
                const books = await db.query('select code_book, book_name, surname_author, cover_art, price from public.books ' +
                    'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                    'where id_section = $1 order by code_book asc', [section]);
                return res.json(books.rows);
            }

            // Если нет ни одного из параметров
            res.status(400).json({ message: 'Please provide a section or title to search' });
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }
    }

    async getFavorites(req, res) {
        try {
            const idCustomer = req.query.userId;
            const favBooks = await db.query(
                `SELECT id_fav, public.favorites.code_book, book_name, surname_author, cover_art, price 
                 FROM public.favorites 
                 INNER JOIN public.books ON public.books.code_book = public.favorites.code_book 
                 INNER JOIN public.authors ON public.authors.id_author = public.books.id_author 
                 WHERE id_customer = $1 
                 ORDER BY id_fav ASC`,
                [idCustomer]
            );
            return res.json(favBooks.rows);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving favorites', error });
        }
    }

    async addFavorite(req, res) {
        try {
            const { codeBook, idCustomer } = req.body;
            const newFav = await db.query(
                'INSERT INTO public.favorites(code_book, id_customer) VALUES ($1, $2) RETURNING *',
                [codeBook, idCustomer]
            );
            return res.json(newFav.rows[0]);
        } catch (error) {
            res.status(500).json({ message: 'Error adding favorite', error });
        }
    }

    async deleteFavorite(req, res) {
        try {
            const id = req.params.id
            const favBook = await db.query('DELETE FROM public.favorites WHERE id_fav = $1', [id]);
            return res.json(favBook.rows[0]);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }
    }

    async getCart(req, res) {
      const { id_customer } = req.params;
  
      // Получаем id корзины
      const cartResult = await db.query('SELECT id_cart FROM carts WHERE id_customer = $1', [id_customer]);
      if (cartResult.rows.length === 0) {
        return res.json([]); // Корзины пока нет
      }
  
      const id_cart = cartResult.rows[0].id_cart;
  
      // Получаем содержимое корзины
      const items = await db.query(`
        SELECT ci.code_book, b.book_name, a.surname_author, b.cover_art, b.price, ci.quantity
        FROM cart_items ci
        JOIN books b ON ci.code_book = b.code_book
        JOIN authors a ON b.id_author = a.id_author
        WHERE ci.id_cart = $1
      `, [id_cart]);
  
      res.json(items.rows);
    }
  
    async addToCart(req, res) {
      const { id_customer, code_book, quantity = 1 } = req.body;
  
      // Проверка: есть ли уже корзина
      let cartResult = await db.query('SELECT id_cart FROM carts WHERE id_customer = $1', [id_customer]);
      let id_cart;
      if (cartResult.rows.length === 0) {
        const newCart = await db.query('INSERT INTO carts (id_customer) VALUES ($1) RETURNING id_cart', [id_customer]);
        id_cart = newCart.rows[0].id_cart;
      } else {
        id_cart = cartResult.rows[0].id_cart;
      }
  
      // Добавление или обновление записи
      await db.query(`
        INSERT INTO cart_items (id_cart, code_book, quantity)
        VALUES ($1, $2, $3)
        ON CONFLICT (id_cart, code_book)
        DO UPDATE SET quantity = cart_items.quantity + EXCLUDED.quantity
      `, [id_cart, code_book, quantity]);
  
      res.json({ success: true });
    }
  
    async removeFromCart(req, res) {
      const { id_customer, code_book } = req.body;
  
      const cartResult = await db.query('SELECT id_cart FROM carts WHERE id_customer = $1', [id_customer]);
      if (cartResult.rows.length === 0) return res.status(400).json({ error: 'Cart not found' });
  
      const id_cart = cartResult.rows[0].id_cart;
      await db.query('DELETE FROM cart_items WHERE id_cart = $1 AND code_book = $2', [id_cart, code_book]);
  
      res.json({ success: true });
    }    

    async getBook(req, res) {
        try {
            const id = req.params.id
            const book = await db.query('select code_book, book_name, surname_author, surname_translator, ' +
                'surname_illustrator, publishing_name, series_name, cover_name, paper_name, section_name, page_count, ' +
                'EXTRACT(YEAR FROM year_of_publication) AS year_of_publication, book_size, ' +
                'book_weight, "ISBN", cover_art, price, description from public.books ' +
                'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                'inner join public.translators on public.translators.id_translator = public.books.id_translator ' +
                'inner join public.illustrators on public.illustrators.id_illustrator = public.books.id_illustrator ' +
                'inner join public.publishing on public.publishing.id_publishing = public.books.id_publishing ' +
                'inner join public.series on public.series.id_series = public.books.id_series ' +
                'inner join public.covers on public.covers.id_cover = public.books.id_cover ' +
                'inner join public.type_of_paper on public.type_of_paper.id_paper = public.books.id_paper ' +
                'inner join public.sections on public.sections.id_section = public.books.id_section ' +
                'where code_book = $1 order by code_book asc', [id]);
            res.json(book.rows[0]);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }     
    }
}

module.exports = new BookController();