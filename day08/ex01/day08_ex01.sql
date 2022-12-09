-- SHOW TRANSACTION ISOLATION LEVEL; -- (read committed)

BEGIN; -- Session #1
BEGIN; -- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (5)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (5)

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Session #1 (4)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Session #2 (waiting)

COMMIT; -- Session #1 (4)
COMMIT; -- Session #2 (3.6)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (3.6)
