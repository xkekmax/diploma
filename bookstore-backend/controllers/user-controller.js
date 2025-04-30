const db = require('../db'); // Подключение к базе данных

class UserController {

    async autorizeUser(req, res) {
      try {
        const { login, password } = req.body;
    
        const query = `
          SELECT * FROM public.customers 
          WHERE login = $1 AND password = $2
        `;
        const values = [login, password];
    
        const result = await db.query(query, values);
    
        if (result.rows.length === 0) {
          return res.status(404).json({ message: 'Неверный логин или пароль' });
        }
    
        const user = result.rows[0];
        return res.status(200).json({
          message: 'Авторизация успешна',
          user: {
            id_customer: user.id_customer,
            name: user.firstname_customer // или любое другое поле для имени
          }
        });
      } catch (error) {
        console.error('Ошибка при авторизации пользователя:', error);
        res.status(500).json({ message: 'Ошибка при авторизации', error });
      }
    }

    async addUser(req, res) {
        try {
            const {
                surname_customer,
                firstname_customer,
                patronymic_customer,
                date_of_birthday,
                login,
                password,
                email,
                phone,
                id_role
            } = req.body;
    
            // SQL-запрос на добавление нового пользователя
            const query = `
                INSERT INTO public.customers 
                (surname_customer, firstname_customer, patronymic_customer, date_of_birthday, login, password, email, phone, id_role) 
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) 
                RETURNING *;
            `;
    
            // Выполнение запроса
            const values = [
                surname_customer,
                firstname_customer,
                patronymic_customer || null,
                date_of_birthday || null,
                login,
                password, // В реальном приложении пароль нужно хешировать перед сохранением
                email,
                phone || null,
                id_role
            ];
    
            const newUser = await db.query(query, values);
    
            res.status(201).json(newUser.rows[0]); // Возвращаем созданного пользователя
        } catch (error) {
            console.error('Ошибка при добавлении пользователя:', error);
            res.status(500).json({ message: 'Ошибка при создании пользователя', error });
        }
    }

    async getUserById(req, res) {
      try {
        const userId = req.params.id;
    
        const query = `
          SELECT id_customer, surname_customer, firstname_customer, patronymic_customer, 
          TO_CHAR(date_of_birthday, 'YYYY-MM-DD') as date_of_birthday, login, email, phone 
          FROM public.customers 
          WHERE id_customer = $1
        `;
        const result = await db.query(query, [userId]);
    
        if (result.rows.length === 0) {
          return res.status(404).json({ message: 'Пользователь не найден' });
        }
    
        const user = result.rows[0];
        res.status(200).json(user);
      } catch (error) {
        console.error('Ошибка при получении данных пользователя:', error);
        res.status(500).json({ message: 'Ошибка при получении данных пользователя', error });
      }
    }    

    async updateUser(req, res) {
      try {
        const userId = req.params.id;
        const {
          surname_customer,
          firstname_customer,
          patronymic_customer,
          date_of_birthday,
          email,
          phone
        } = req.body;
    
        const query = `
          UPDATE public.customers 
          SET surname_customer = $1,
              firstname_customer = $2,
              patronymic_customer = $3,
              date_of_birthday = $4,
              email = $5,
              phone = $6
          WHERE id_customer = $7
          RETURNING *;
        `;
    
        const values = [
          surname_customer,
          firstname_customer,
          patronymic_customer || null,
          date_of_birthday || null,
          email,
          phone || null,
          userId
        ];
    
        const result = await db.query(query, values);
        res.status(200).json(result.rows[0]);
      } catch (error) {
        console.error('Ошибка при обновлении пользователя:', error);
        res.status(500).json({ message: 'Ошибка при обновлении пользователя', error });
      }
    }    

    async getUserOrders(req, res) {
      const userId = req.params.id;
    
      try {
        const query = `
          SELECT o.id_order, o.total_price, o.order_date, 
                 b.code_book, b.book_name, b.cover_art, b.price, 
                 a.surname_author
          FROM orders o
          LEFT JOIN order_items oi ON o.id_order = oi.id_order
          LEFT JOIN books b ON oi.code_book = b.code_book
          LEFT JOIN authors a ON b.id_author = a.id_author
          WHERE o.id_customer = $1
          ORDER BY o.order_date DESC
        `;
        const result = await db.query(query, [userId]);
    
        // Группируем книги по заказам
        const orders = result.rows.reduce((acc, row) => {
          let order = acc.find(o => o.id_order === row.id_order);
          if (!order) {
            order = {
              id_order: row.id_order,
              total_price: row.total_price,
              order_date: row.order_date,
              books: []
            };
            acc.push(order);
          }
          order.books.push({
            code_book: row.code_book,
            book_name: row.book_name,
            cover_art: row.cover_art,
            price: row.price,
            surname_author: row.surname_author
          });
          return acc;
        }, []);
    
        res.status(200).json(orders);
      } catch (err) {
        console.error('Ошибка при получении заказов:', err);
        res.status(500).json({ message: 'Ошибка при получении заказов' });
      }
    }    
    
}

module.exports = new UserController();
