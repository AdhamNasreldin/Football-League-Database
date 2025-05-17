-- Query to find the stadium that hosted the most matches
SELECT
    Stadium.SID,
    Stadium.Sname AS StadiumName,
    Stadium.Location,
    Stadium.Capacity,
    COUNT(Matches.MatchID) AS MatchesHosted
FROM
    Stadium
LEFT OUTER JOIN
    Matches ON Stadium.SID = Matches.SID
GROUP BY
    Stadium.SID, Stadium.Sname, Stadium.Location, Stadium.Capacity
ORDER BY
    MatchesHosted DESC
LIMIT 1;
