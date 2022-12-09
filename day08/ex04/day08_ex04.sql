BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Session #2 (3.0)
COMMIT; -- Session #2 (3.0)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
COMMIT; -- Session #1 (3.0)


SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.0)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (3.0)
