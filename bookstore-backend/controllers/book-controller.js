const db = require('../db')

class BookController {

    async getBooks(req, res) {
        try {
            const section = req.query.section;
            const searchQuery = req.query.title;
            if (searchQuery) {
                // Если есть параметр title, выполняем поиск
                const books = await db.query('select code_book, book_name, name_author, cover_art, price from public.books ' +
                    'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                    'where book_name ILIKE $1 OR name_author ILIKE $1', [`%${searchQuery}%`]);
                return res.json(books.rows);
            }
            
            else if (section == 'title') {
                // все книжки
                const books = await db.query('select code_book, book_name, name_author, ' +
                    'cover_art, price from public.books ' +
                    'inner join public.authors on public.authors.id_author = public.books.id_author ' +
                    'order by code_book asc');
                return res.json(books.rows);
            }
            else if (section != 'title') {
                // Если есть параметр section, вызываем сортировку
                const books = await db.query('select code_book, book_name, name_author, cover_art, price from public.books ' +
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
                `SELECT id_fav, public.favorites.code_book, book_name, name_author, cover_art, price 
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

    async createDrawer(req, res) {
        try {
          const { items, totalPrice, id_customer } = req.body;
      
          if (!items || items.length === 0) {
            return res.status(400).json({ message: 'Корзина пуста.' });
          }
      
          if (!id_customer) {
            return res.status(400).json({ message: 'Не передан идентификатор пользователя.' });
          }
      
          // Сохраняем заказ в таблицу orders с привязкой к пользователю
          const orderResult = await db.query(
            `INSERT INTO public.orders (total_price, order_date, id_customer)
             VALUES ($1, NOW(), $2)
             RETURNING id_order`,
            [totalPrice, id_customer]
          );
      
          const orderId = orderResult.rows[0].id_order;
      
          // Добавляем книги в order_items
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
            const book = await db.query('select code_book, book_name, name_author, surname_translator, ' +
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

    async addBook(req, res) {
        try {
            const {
                book_name,
                surname_author,
                price,
                publishing_name,
                series_name,
                surname_translator,
                surname_illustrator,
                cover_name,
                page_count,
                year_of_publication,
                ISBN,
                section_name,
                book_size,
                book_weight,
                description
            } = req.body;

            // Получаем имя файла
            let cover_art = req.body.cover_art || '';
            if (cover_art) {
                cover_art = `..\\..\\books\\${cover_art}`;
            }

            const getOrCreateId = async (table, column, value, idColumn) => {
                if (typeof value !== 'string' || !value.trim()) return 1;

                const trimmed = value.trim();
                const existing = await db.query(
                    `SELECT ${idColumn} FROM ${table} WHERE ${column} = $1`,
                    [trimmed]
                );

                if (existing.rows.length > 0) {
                    return existing.rows[0][idColumn];
                }

                const inserted = await db.query(
                    `INSERT INTO ${table} (${column}) VALUES ($1) RETURNING ${idColumn}`,
                    [trimmed]
                );

                return inserted.rows[0][idColumn];
            };

            const id_author = await getOrCreateId('authors', 'name_author', surname_author, 'id_author');
            const id_series = await getOrCreateId('series', 'series_name', series_name, 'id_series');
            const id_translator = await getOrCreateId('translators', 'surname_translator', surname_translator, 'id_translator');
            const id_illustrator = await getOrCreateId('illustrators', 'surname_illustrator', surname_illustrator, 'id_illustrator');

            const id_publishing = publishing_name;
            const id_cover = cover_name;
            const id_section = section_name;

            console.log('Данные для вставки:', {
                book_name: book_name.trim(),
                id_author,
                price,
                cover_art,
                id_publishing,
                id_series,
                id_translator,
                id_illustrator,
                id_cover,
                page_count,
                year_of_publication,
                ISBN,
                id_section,
                book_size,
                book_weight,
                description
            });

            const values = [
                book_name?.trim(), id_author, price, cover_art, id_publishing,
                id_series, id_translator, id_illustrator, id_cover, page_count,
                year_of_publication, ISBN, id_section, book_size, book_weight, description
            ];

            if (values.some(v => typeof v === 'undefined')) {
                console.error('ОШИБКА: Один или несколько параметров undefined', values);
                return res.status(400).json({ message: 'Ошибка: Недопустимое значение для INSERT', values });
            }

            const result = await db.query(
                `INSERT INTO books (
                    book_name, id_author, price, cover_art, id_publishing, id_series,
                    id_translator, id_illustrator, id_cover, page_count, year_of_publication,
                    "ISBN", id_section, book_size, book_weight, id_paper, description
                ) VALUES (
                    $1, $2, $3, $4, $5, $6,
                    $7, $8, $9, $10, $11,
                    $12, $13, $14, $15, $16, $17
                ) RETURNING *`,
                [
                    book_name.trim(), id_author, price, cover_art, id_publishing, id_series,
                    id_translator, id_illustrator, id_cover, page_count, year_of_publication,
                    ISBN, id_section, book_size, book_weight, 1, description
                ]
            );

            res.status(201).json({ message: 'Книга добавлена', book: result.rows[0] });
       } catch (error) {
            console.error('Ошибка при SQL-запросе:', error);
            res.status(500).json({ message: 'Ошибка в SQL', details: error.message });
        }
    }
}

module.exports = new BookController();