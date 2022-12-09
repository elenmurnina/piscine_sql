COMMENT ON TABLE person_discounts
IS 'Таблица персональных скидок';

COMMENT ON COLUMN person_discounts.id
IS 'ID скидки';

COMMENT ON COLUMN person_discounts.person_id
IS 'ID пользователя';

COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'ID пиццерии';

COMMENT ON COLUMN person_discounts.discount
IS 'Размер скидки в %';
