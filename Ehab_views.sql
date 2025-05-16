-- View for highest paid coach
GO
CREATE VIEW HighestPaidCoach AS
SELECT 
    'Highest Paid Coach' AS Category,
    p.Name AS Name,
    t.Name AS Team,
    t.Coach_Salary AS Salary
FROM 
    Team t
JOIN 
    Person p ON t.CID = p.SSN
WHERE 
    t.Coach_Salary = (SELECT MAX(Coach_Salary) FROM Team);
GO

CREATE VIEW HighestPaidPlayer AS
SELECT 
    'Highest Paid Player' AS Category,
    p.Name AS Name,
    t.Name AS Team,
    pl.Salary AS Salary
FROM 
    Player pl
JOIN 
    Person p ON pl.PlayerID = p.SSN
JOIN 
    Team t ON pl.TeamID = t.TeamID
WHERE 
    pl.Salary = (SELECT MAX(Salary) FROM Player);
GO

CREATE VIEW HighestPaidJudge AS
SELECT 
    'Highest Paid Judge' AS Category,
    p.Name AS Name,
    j.Salary AS Salary
FROM 
    Judge j
JOIN 
    Person p ON j.JudgeID = p.SSN
WHERE 
    j.Salary = (SELECT MAX(Salary) FROM Judge);
GO

CREATE VIEW TeamWithHighestAvgSalary AS
WITH TeamSalaries AS (
    SELECT 
        t.TeamID,
        t.Name AS TeamName,
        t.Coach_Salary AS CoachSalary,
        AVG(pl.Salary) AS AvgPlayerSalary,
        (t.Coach_Salary + AVG(pl.Salary)) / 2 AS CombinedAvgSalary
    FROM 
        Team t
    JOIN 
        Player pl ON t.TeamID = pl.TeamID
    GROUP BY 
        t.TeamID, t.Name, t.Coach_Salary
)
SELECT 
    'Team with Highest Average Salaries' AS Category,
    TeamName AS Team,
    CoachSalary,
    AvgPlayerSalary,
    CombinedAvgSalary
FROM 
    TeamSalaries
WHERE 
    CombinedAvgSalary = (SELECT MAX(CombinedAvgSalary) FROM TeamSalaries);
GO
-- Get highest paid coach
SELECT * FROM HighestPaidCoach;

-- Get highest paid player
SELECT * FROM HighestPaidPlayer;

-- Get highest paid judge
SELECT * FROM HighestPaidJudge;

-- Get team with highest average salaries
SELECT * FROM TeamWithHighestAvgSalary;
