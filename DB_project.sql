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
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Coach_Salary DECIMAL(10, 2),
    CID INT NoT NULL,
    FOREIGN KEY (CID) REFERENCES Person(SSN)
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
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID) on update cascade,
    ON DELETE
    SET NULL
);
-- Create Supporter table
CREATE TABLE Supporter (
    SupporterID INT PRIMARY KEY AUTO_INCREMENT,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);
-- Create Stadium table
CREATE TABLE Stadium (
    SID INT PRIMARY KEY AUTO_INCREMENT,
    Sname VARCHAR(100) NOT NULL,
    Location VARCHAR(200),
    Capacity INT NOT NULL
);
-- Create Match table
CREATE TABLE Match (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    MDate DATE,
    Sname VARCHAR(100),
    JudgeID INT,
    HomeTeam INT NOT NULL,
    AwayTeam Int NOT NULL,
    Winning INT,
    -- NULL m3naha el match 5ls ta3adol 
    FOREIGN Key (Home) REFERENCES (TeamID) FOREIGN Key (Away) REFERENCES (TeamID) FOREIGN KEY (Sname) REFERENCES Stadium(Sname),
    FOREIGN KEY (JudgeID) REFERENCES Judge(JudgeID)
);
-- Create Score Table
CREATE TABLE Score (
    MatchID INT,
    ScorerID INT,
    AsisterID INT,
    GoalTime TIME,
    PRIMARY KEY (MatchID, ScorerID, GoalTime),
    FOREIGN Key (MatchID) REFERENCES (MatchID),
    FOREIGN Key (PlayerID) REFERENCES (PlayerID)
);
-- Create Attends table (relationship between Supporter and Match)
CREATE TABLE Attends (
    TicketID INT NOT NULL,
    SupporterID INT,
    MatchID INT,
    PRIMARY KEY (SupporterID, MatchID),
    FOREIGN KEY (SupporterID) REFERENCES Supporter(SupporterID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);