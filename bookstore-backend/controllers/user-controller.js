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
}

module.exports = new UserController();
