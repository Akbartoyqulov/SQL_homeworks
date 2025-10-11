Puzzle 1

select distinct
case when col1 < col2 then col1 else col2 end as col1,
    case when col1 < col2 then col2 else col1 end as col2
	from InputTbl
Puzzle 2 

SELECT *
FROM TestMultipleZero
WHERE NOT (COALESCE(A,0) = 0 
       AND COALESCE(B,0) = 0 
       AND COALESCE(C,0) = 0 
       AND COALESCE(D,0) = 0)

Puzzle 3 

	   select * 
	   from  section1
	   where id  %2 <> 0

Puzzle 4


	SELECT *
FROM section1
WHERE id = (SELECt min (id) FROM section1);

Puzzle 5

	SELECT *
FROM section1
WHERE id = (SELECt max (id) FROM section1);

Puzzle 6

SELECT *
FROM section1
WHERE name LIKE 'B%';

Puzzle 7

SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

