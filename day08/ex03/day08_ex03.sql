BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (4)

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Session #2 (3.6)
COMMIT; -- Session #2 (3.6)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
COMMIT; -- Session #1 (3.6)


SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (3.6)
