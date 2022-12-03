UPDATE menu
SET price = (menu.price - (menu.price / 100 * 10))
WHERE menu.pizza_name = 'greek pizza';
