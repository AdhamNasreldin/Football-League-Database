CREATE VIEW LeagueTable AS
SELECT 
    T.Name AS TeamName,
    
    -- Matches played
    COALESCE(MP.Played, 0) AS Played,

    -- Wins
    COALESCE(W.Wins, 0) AS Wins,

    -- Draws
    COALESCE(D.Draws, 0) AS Draws,

    -- Losses = Played - Wins - Draws
    COALESCE(MP.Played, 0) - COALESCE(W.Wins, 0) - COALESCE(D.Draws, 0) AS Losses,

    -- Goals Scored
    COALESCE(GS.GoalsScored, 0) AS GoalsScored,

    -- Goals Conceded
    COALESCE(GC.GoalsConceded, 0) AS GoalsConceded,

    -- Goal Difference
    COALESCE(GS.GoalsScored, 0) - COALESCE(GC.GoalsConceded, 0) AS GoalDifference,

    -- Points
    COALESCE(W.Wins, 0) * 3 + COALESCE(D.Draws, 0) AS Points

FROM Team T

-- Matches Played (as Home or Away)
LEFT JOIN (
    SELECT 
        TeamID,
        COUNT(*) AS Played
    FROM (
        SELECT HomeTeam AS TeamID FROM Matches
        UNION ALL
        SELECT AwayTeam AS TeamID FROM Matches
    ) AS AllMatches
    GROUP BY TeamID
) AS MP ON T.TeamID = MP.TeamID

-- Wins
LEFT JOIN (
    SELECT Winner AS TeamID, COUNT(*) AS Wins
    FROM Matches
    WHERE Winner IS NOT NULL
    GROUP BY Winner
) AS W ON T.TeamID = W.TeamID

-- Draws (matches with no winner)
LEFT JOIN (
    SELECT HomeTeam AS TeamID, COUNT(*) AS Draws
    FROM Matches
    WHERE Winner IS NULL
    GROUP BY HomeTeam
) AS D ON T.TeamID = D.TeamID

-- Goals Scored
LEFT JOIN (
    SELECT P.TeamID, COUNT(*) AS GoalsScored
    FROM Score S
    JOIN Player P ON S.ScorerID = P.PlayerID
    GROUP BY P.TeamID
) AS GS ON T.TeamID = GS.TeamID

-- Goals Conceded
LEFT JOIN (
    SELECT Opponent.TeamID, COUNT(*) AS GoalsConceded
    FROM Score S
    JOIN Player P ON S.ScorerID = P.PlayerID
    JOIN Matches M ON S.MatchID = M.MatchID
    CROSS APPLY (
        SELECT M.HomeTeam AS TeamID WHERE P.TeamID = M.AwayTeam
        UNION ALL
        SELECT M.AwayTeam AS TeamID WHERE P.TeamID = M.HomeTeam
    ) AS Opponent
    GROUP BY Opponent.TeamID
) AS GC ON T.TeamID = GC.TeamID;

-- We'll use the below Query to view the table 

-- SELECT * 
-- from LeagueTable AS L
-- ORDER by L.points DESC