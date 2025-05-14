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
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DoB DATE,
    Gender VARCHAR(10)
);

-- Create Team table
CREATE TABLE Team (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Coach_Salary DECIMAL(10,2),
    CID INT NoT NULL,
    FOREIGN KEY (CID) REFERENCES Person(PersonID)
);

-- Create Judge table (subtype of Person)
CREATE TABLE Judge (
    JudgeID INT PRIMARY KEY,
    Salary DECIMAL(10,2),
    FOREIGN KEY (JudgeID) REFERENCES Person(PersonID)
);

-- Create Player table (subtype of Person)
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    Height DECIMAL(5,2),
    Weight DECIMAL(5,2),
    TeamID INT,
    FOREIGN KEY (PlayerID) REFERENCES Person(PersonID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- Create Supporter table
CREATE TABLE Supporter (
    SupporterID INT PRIMARY KEY AUTO_INCREMENT,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- Create Stadium table
CREATE TABLE Stadium (
    Sname VARCHAR(100) PRIMARY KEY AUTO_INCREMENT,
    Location VARCHAR(200),
    Capacity INT
);

-- Create Match table
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    Sname VARCHAR(100),
    JudgeID INT,
    FOREIGN KEY (Sname) REFERENCES Stadium(Sname),
    FOREIGN KEY (JudgeID) REFERENCES Judge(JudgeID)
);

-- Create Play table (relationship between Team and Match)
CREATE TABLE Play (
    TeamID INT,
    MatchID INT,
    PRIMARY KEY (TeamID, MatchID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
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
