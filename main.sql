-- 1-mashq
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM insurance i
WHERE tiv_2015 IN (SELECT tiv_2015 FROM insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1)
  AND (lat, lon) IN (
      SELECT lat, lon FROM insurance 
      GROUP BY lat, lon 
      HAVING COUNT(*) = 1
  );
-- 2-mashq
WITH all_friends AS (
    SELECT requester_id AS id FROM request_accepted
    UNION ALL
    SELECT accepter_id AS id FROM request_accepted
)
SELECT id, COUNT(*) AS num
FROM all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
