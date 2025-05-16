-- Query to find the stadium that hosted the most matches
SELECT 
    s.SID,
    s.Sname AS StadiumName,
    s.Location,
    s.Capacity,
    COUNT(m.MatchID) AS MatchesHosted
FROM 
    Stadium s
LEFT JOIN 
    Matches m ON s.SID = m.SID
GROUP BY 
    s.SID, s.Sname, s.Location, s.Capacity
ORDER BY 
    MatchesHosted DESC
LIMIT 1;