-- Drop existing tables if they exist (for clean recreation)
DROP TABLE IF EXISTS Attends;
DROP TABLE IF EXISTS Play;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Supporter;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Judge;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Score;

-- Create Person table (parent entity)
CREATE TABLE Person (
    SSN INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    DoB DATE,
    Gender BIT,
    -- 0 for male 1 for female 
    PRIMARY key(SSN)
);
-- Create Team table
CREATE TABLE Team (
    TeamID INT IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Coach_Salary DECIMAL(10, 2),
    CID INT NoT NULL,
    FOREIGN KEY (CID) REFERENCES Person(SSN),
	PRIMARY KEY(TeamID)
);
-- Create Judge table (subtype of Person)
CREATE TABLE Judge (
    JudgeID INT PRIMARY KEY,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (JudgeID) REFERENCES Person(SSN)
);
-- Create Player table (subtype of Person)
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Height DECIMAL(5, 2),
    Weight DECIMAL(5, 2),
    TeamID INT,
    FOREIGN KEY (PlayerID) REFERENCES Person(SSN),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID) 
	ON UPDATE CASCADE
    ON DELETE
    SET NULL
);
-- Create Supporter table
CREATE TABLE Supporter (
    SupporterID INT PRIMARY KEY IDENTITY(1,1),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);
-- Create Stadium table
CREATE TABLE Stadium (
    SID INT PRIMARY KEY IDENTITY(1,1),
    Sname VARCHAR(100) NOT NULL,
    Location VARCHAR(200),
    Capacity INT NOT NULL
);
-- Create Match table
CREATE TABLE Match (
    MatchID INT PRIMARY KEY IDENTITY(1,1),
	Home INT,
	Away INT,
    MDate DATE,
    Sname VARCHAR(100),
	SID INT,
    JudgeID INT,
    HomeTeam INT NOT NULL,
    AwayTeam Int NOT NULL,
    Winning INT,
    -- NULL Means Draw
    FOREIGN Key (Home) REFERENCES Team(TeamID), 
	FOREIGN Key (Away) REFERENCES Team(TeamID), 
	FOREIGN KEY (SID) REFERENCES Stadium(SID),
    FOREIGN KEY (JudgeID) REFERENCES Judge(JudgeID)
);
-- Create Score Table
CREATE TABLE Score (
    MatchID INT,
    ScorerID INT,
    AsisterID INT,
    GoalMin INT CHECK (
        GoalMin >= 0
        AND GoalMin <= 150
    ),
    GoalSec INT CHECK (
        GoalSec >= 0
        AND GoalSec <= 60
    ),
    PRIMARY KEY (MatchID, ScorerID, GoalMin, GoalSec),
    FOREIGN Key (MatchID) REFERENCES Match(MatchID),
    FOREIGN KEY (ScorerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (AsisterID) REFERENCES Player(PlayerID)
);
-- Create Attends table (relationship between Supporter and Match)
CREATE TABLE Attends (
    TicketID INT NOT NULL,
    SupporterID INT,
    MatchID INT,
    PRIMARY KEY (SupporterID, MatchID),
    FOREIGN KEY (SupporterID) REFERENCES Supporter(SupporterID),
    FOREIGN KEY (MatchID) REFERENCES Match(MatchID)
);