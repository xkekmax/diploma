import axios from 'axios';

export function useCartSync(cart) {
  const loadCartFromLocalStorage = () => {
    const localCart = localStorage.getItem('cart');
    if (localCart) {
      cart.value = JSON.parse(localCart);
    }
  };

  const syncCartFromServer = async () => {
    const idCustomer = localStorage.getItem('user_id');
    if (!idCustomer) return;

    try {
      const { data } = await axios.get(`http://localhost:8080/witch/cart/${idCustomer}`);
      cart.value = data.map(item => ({
        ...item,
        isAdded: true
      }));
    } catch (err) {
      console.error('Ошибка загрузки корзины с сервера:', err);
    }
  };

  return { loadCartFromLocalStorage, syncCartFromServer };
}
