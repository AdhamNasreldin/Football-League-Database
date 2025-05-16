-- Drop the existing view if it exists
DROP VIEW IF EXISTS TopScorers;

-- Create the view to show the top scorers, including those with 0 goals
CREATE VIEW TopScorers AS
SELECT
    p.Name AS PlayerName,
    t.Name AS TeamName,
    COUNT(s.ScorerID) AS GoalsScored
FROM
    Person p
JOIN
    Player pl ON p.SSN = pl.PlayerID
LEFT JOIN
    Team t ON pl.TeamID = t.TeamID
LEFT JOIN
    Score s ON pl.PlayerID = s.ScorerID
GROUP BY
    p.SSN, p.Name, t.Name, pl.TeamID
ORDER BY
    GoalsScored DESC, PlayerName ASC;