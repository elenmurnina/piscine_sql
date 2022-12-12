insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT DISTINCT
COALESCE(us.name, 'not defined') AS name,
COALESCE(us.lastname, 'not defined') AS lastname,
cur.name AS currency_name,
(COALESCE((SELECT rate_to_usd
FROM currency
WHERE
	currency.updated <= b.updated
	AND currency.id = b.currency_id
ORDER BY updated DESC
LIMIT 1),
(SELECT rate_to_usd
FROM currency
WHERE
	currency.updated > b.updated
	AND currency.id = b.currency_id
ORDER BY updated ASC
LIMIT 1), 1) * b.money) AS currency_in_usd
FROM
balance AS b
JOIN currency AS cur ON cur.id = b.currency_id 
LEFT JOIN public.user AS us ON us.id = b.user_id
ORDER BY name DESC, lastname, currency_name ASC;
