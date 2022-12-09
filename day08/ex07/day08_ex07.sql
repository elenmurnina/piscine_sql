-- SHOW TRANSACTION ISOLATION LEVEL; -- (read committed)

BEGIN; -- Session #1
BEGIN; -- Session #2

UPDATE pizzeria SET rating = 1 WHERE id = 1; -- Session #1 (1)
UPDATE pizzeria SET rating = 2 WHERE id = 2; -- Session #2 (2)

UPDATE pizzeria SET rating = 3 WHERE id = 2; -- Session #1 (waiting)
UPDATE pizzeria SET rating = 4 WHERE id = 1; -- Session #2 (ERROR: deadlock detected)

-- SELECT id, rating FROM pizzeria WHERE id = 1 OR id = 2; 

COMMIT; -- Session #1 
COMMIT; -- Session #2
