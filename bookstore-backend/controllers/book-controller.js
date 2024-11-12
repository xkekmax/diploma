const db = require('../db')

class BookController {

    async getBooks(req, res) {
         try {
            const books = await db.query('select code_book, book_name, surname_author, ' +
                 'cover_art, price from public.books ' +
                 'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                 'order by code_book asc');
            res.json(books.rows);
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

    async sortBooks(req, res) {
        try {
            const section = req.query.name
            const books = await db.query('select code_book, book_name, surname_author, cover_art, price from public.books ' +
                'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                'inner join public.sections on public.sections.id_section = public.books.id_section ' +
                'where section_name = $1 order by code_book asc', [section]);
            res.json(books.rows);
        } catch (error) {
            res.status(500).json({ message: 'Error retrieving books', error });
        }
        
    }
}

module.exports = new BookController();