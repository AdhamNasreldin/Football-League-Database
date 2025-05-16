-- Drop existing tables if they exist (for clean recreation)
DROP TABLE IF EXISTS Attends;
DROP TABLE IF EXISTS Score;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Supporter;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS Judge;
DROP TABLE IF EXISTS Stadium;
DROP TABLE IF EXISTS Person;

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
    TeamID INT AUTO_INCREMENT,
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
        ON DELETE SET NULL
);
-- Create Supporter table
CREATE TABLE Supporter (
    SupporterID INT PRIMARY KEY,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (SupporterID) REFERENCES Person(SSN)
);
-- Create Stadium table
CREATE TABLE Stadium (
    SID INT PRIMARY KEY AUTO_INCREMENT,
    Sname VARCHAR(100) NOT NULL,
    Location VARCHAR(200),
    Capacity INT NOT NULL
);
-- Create Match table
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    MDate DATE,
	SID INT,
    JudgeID INT,
    HomeTeam INT NOT NULL,
    AwayTeam INT NOT NULL,
    Winner INT,
    -- NULL Means Draw
    FOREIGN Key (HomeTeam) REFERENCES Team(TeamID), 
	FOREIGN Key (AwayTeam) REFERENCES Team(TeamID), 
	FOREIGN KEY (SID) REFERENCES Stadium(SID),
    FOREIGN KEY (JudgeID) REFERENCES Judge(JudgeID),
    FOREIGN KEY (Winner) REFERENCES Team(TeamID),
    CHECK (
        HomeTeam != AwayTeam
    )
);
-- Create Score Table
CREATE TABLE Score (
    MatchID INT NOT NULL,
    ScorerID INT NOT NULL,
    AsisterID INT,
    GoalMin INT NOT NULL CHECK (
        GoalMin >= 0
        AND GoalMin <= 150
    ),
    GoalSec INT NOT NULL CHECK (
        GoalSec >= 0
        AND GoalSec <= 60
    ),
    PRIMARY KEY (MatchID, ScorerID, GoalMin, GoalSec),
    FOREIGN Key (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (ScorerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (AsisterID) REFERENCES Player(PlayerID)
);
-- Create Attends table (relationship between Supporter and Match)
CREATE TABLE Attends (
    SupporterID INT,
    MatchID INT,
    PRIMARY KEY (SupporterID, MatchID),
    FOREIGN KEY (SupporterID) REFERENCES Supporter(SupporterID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);