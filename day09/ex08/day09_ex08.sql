CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER = 10)
RETURNS TABLE (a INTEGER) AS $$
	WITH RECURSIVE Q(Num, Prev) AS (
   		SELECT 0, 1
  	UNION ALL
   		SELECT Q.Num + Q.Prev, Q.Num
    FROM Q
    WHERE Q.Num + Q.Prev < pstop
	)
	SELECT Num FROM Q
$$
LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
