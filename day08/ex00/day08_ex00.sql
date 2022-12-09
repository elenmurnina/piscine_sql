-- Session #1
BEGIN; -- начало сессии 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 5 WHERE name  = 'Pizza Hut'; -- внесли изменения рейтинга 

-- Session #2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- проверка рейтинга, изменений из сессии 1 не видно

-- Session #1
COMMIT; -- публикация изменений для всех транзакций

-- Session #2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- проверка рейтинга, теперь изменения из сессии 1 видно
