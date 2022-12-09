-- SHOW TRANSACTION ISOLATION LEVEL; -- (read committed)

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (4.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (4.6)

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Session #1 (4)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Session #2 (waiting)

COMMIT; -- Session #1 (4)
COMMIT; -- Session #2 (ERROR, ROLLBACK)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (4)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (4)
