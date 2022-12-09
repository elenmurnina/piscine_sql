BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- Session #2 (5)
COMMIT; -- Session #2 (5)

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)
COMMIT; -- Session #1 (19.9)

SELECT SUM(rating) FROM pizzeria; -- Session #1 (23.9)
SELECT SUM(rating) FROM pizzeria; -- Session #2 (23.9)
