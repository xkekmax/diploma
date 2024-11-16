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
                // Если есть параметр section, вызываем сортировку
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

    async getBook(req, res) {
        try {
            const id = req.params.id
            const book = await db.query('select code_book, book_name, surname_author, ' +
                'cover_art, price from public.books ' +
                'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                'where code_book = $1 order by code_book asc', [id]);
            res.json(book.rows[0]);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }
        
    }
}

module.exports = new BookController();