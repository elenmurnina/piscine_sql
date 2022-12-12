WITH user_volume AS
(SELECT user_id, type, currency_id, SUM(money) AS total_volume
FROM balance
GROUP BY user_id, type, currency_id),

currency_last AS
(SELECT id, MAX(updated) AS last_updated
FROM currency
GROUP BY id),

user_currency_volume AS
(SELECT user_id, type, currency_id, total_volume, last_updated  FROM user_volume uv
LEFT JOIN currency_last cl
	ON cl.id = uv.currency_id)

SELECT
COALESCE(pu.name, 'not defined') AS name,
COALESCE(pu.lastname, 'not defined') AS lastname,
usv.type,
usv.total_volume AS volume,
COALESCE(cur.name, 'not defined') AS currency_name,
COALESCE(cur.rate_to_usd, 1) AS last_rate_to_usd,
usv.total_volume * COALESCE(cur.rate_to_usd, 1) AS total_volume_in_usd
FROM
public.user AS pu
RIGHT JOIN user_currency_volume AS usv ON usv.user_id = pu.id
LEFT JOIN currency AS cur
	ON cur.id = usv.currency_id
	AND cur.updated = usv.last_updated
ORDER BY name DESC, lastname, type;
