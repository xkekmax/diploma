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
                    'where book_name ILIKE $1', [`%${searchQuery}%`]);
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
            //по идее потом здесь должен передаваться id авторизованного пользователя
            const favBooks = await db.query('SELECT id_fav, public.favorites.code_book, book_name, surname_author, cover_art, price ' +
                'FROM public.favorites ' +
                'inner join public.books on public.books.code_book = public.favorites.code_book ' +
                'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                'ORDER BY id_fav ASC ');
            return res.json(favBooks.rows);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }
    }

    async addFavorite(req, res) {
        try {
            const {codeBook} = req.body
            const newFav = await db.query('INSERT INTO public.favorites(code_book) ' +
                'VALUES ($1) RETURNING *', [codeBook]);
            return res.json(newFav.rows[0]);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
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

    async createDrawer(req, res) {
        try {
            const { items, totalPrice } = req.body;
    
            // Проверка на наличие данных
            if (!items || items.length === 0) {
                return res.status(400).json({ message: 'Корзина пуста.' });
            }
    
            // Пример сохранения заказа в БД
            const orderResult = await db.query(
                `INSERT INTO public.orders (total_price, order_date) 
                 VALUES ($1, NOW()) 
                 RETURNING id_order`,
                [totalPrice]
            );
            
            const orderId = orderResult.rows[0].id_order;
    
            // Сохранение товаров заказа
            const itemQueries = items.map(item =>
                db.query(
                    `INSERT INTO public.order_items (id_order, code_book) 
                     VALUES ($1, $2)`,
                    [orderId, item.code_book]
                )
            );
            await Promise.all(itemQueries);
    
            return res.json({ message: 'Заказ успешно создан.', orderId });
        } catch (error) {
            console.error('Ошибка при создании заказа:', error);
            res.status(500).json({ message: 'Ошибка при создании заказа', error });
        }
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