export function useCartSync(cart) {
  const loadCartFromLocalStorage = () => {
    const localCart = localStorage.getItem('cart');
    if (localCart) {
      cart.value = JSON.parse(localCart);
    }
  };

  return { loadCartFromLocalStorage };
}
