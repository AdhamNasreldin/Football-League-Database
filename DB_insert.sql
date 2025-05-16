-- Person records (including future players, judges, supporters, and coaches)
-- Judges (all male)
INSERT INTO Person VALUES (1001, 'John Smith', '1980-05-15', 0);
INSERT INTO Person VALUES (1005, 'David Wilson', '1982-07-30', 0);
INSERT INTO Person VALUES (1011, 'William Clark', '1983-02-28', 0);

-- Coaches (all male)
INSERT INTO Person VALUES (1003, 'Michael Brown', '1975-03-10', 0);
INSERT INTO Person VALUES (1007, 'James Anderson', '1979-06-22', 0);
INSERT INTO Person VALUES (1009, 'Robert Thomas', '1977-08-05', 0);
INSERT INTO Person VALUES (1013, 'Daniel Lewis', '1976-07-17', 0);

-- Players (all male)
-- Red Dragons (Team 1) Players
INSERT INTO Person VALUES (1002, 'Kevin Johnson', '1985-09-20', 0);
INSERT INTO Person VALUES (1004, 'Mark Davis', '1988-11-25', 0);
INSERT INTO Person VALUES (1021, 'Eric Moore', '1991-03-12', 0);
INSERT INTO Person VALUES (1022, 'Steven Wright', '1989-07-28', 0);
INSERT INTO Person VALUES (1023, 'Andrew Cooper', '1990-05-15', 0);
INSERT INTO Person VALUES (1024, 'Miguel Sanchez', '1993-02-19', 0);
INSERT INTO Person VALUES (1025, 'Jake Thompson', '1987-11-03', 0);
INSERT INTO Person VALUES (1026, 'Richard Martin', '1988-08-31', 0);
INSERT INTO Person VALUES (1027, 'George Hill', '1992-06-14', 0);
INSERT INTO Person VALUES (1028, 'Samuel Baker', '1990-01-22', 0);
INSERT INTO Person VALUES (1029, 'Luke Evans', '1991-10-17', 0);

-- Blue Eagles (Team 2) Players
INSERT INTO Person VALUES (1006, 'Paul Taylor', '1990-01-18', 0);
INSERT INTO Person VALUES (1008, 'Thomas Martinez', '1984-04-12', 0);
INSERT INTO Person VALUES (1030, 'Anthony White', '1989-09-05', 0);
INSERT INTO Person VALUES (1031, 'Edward Nelson', '1992-12-13', 0);
INSERT INTO Person VALUES (1032, 'Oliver Scott', '1988-05-27', 0);
INSERT INTO Person VALUES (1033, 'Benjamin Adams', '1991-08-08', 0);
INSERT INTO Person VALUES (1034, 'Matthew Lee', '1993-04-30', 0);
INSERT INTO Person VALUES (1035, 'Patrick Campbell', '1987-01-15', 0);
INSERT INTO Person VALUES (1036, 'Ryan Collins', '1989-11-21', 0);
INSERT INTO Person VALUES (1037, 'Gary Stewart', '1990-07-09', 0);
INSERT INTO Person VALUES (1038, 'Sean Morris', '1992-02-28', 0);

-- Green Lions (Team 3) Players
INSERT INTO Person VALUES (1010, 'Ryan Harris', '1986-12-15', 0);
INSERT INTO Person VALUES (1012, 'Jason Rodriguez', '1992-10-08', 0);
INSERT INTO Person VALUES (1039, 'Ian Parker', '1990-06-18', 0);
INSERT INTO Person VALUES (1040, 'Nathan Turner', '1987-09-24', 0);
INSERT INTO Person VALUES (1041, 'Derek Phillips', '1991-03-11', 0);
INSERT INTO Person VALUES (1042, 'Vincent Carter', '1989-12-05', 0);
INSERT INTO Person VALUES (1043, 'Jeremy Mitchell', '1988-07-17', 0);
INSERT INTO Person VALUES (1044, 'Adam Ross', '1992-01-29', 0);
INSERT INTO Person VALUES (1045, 'Zachary Powell', '1990-10-15', 0);
INSERT INTO Person VALUES (1046, 'Kyle Jenkins', '1993-05-08', 0);
INSERT INTO Person VALUES (1047, 'Tyler Reed', '1991-08-22', 0);

-- Yellow Tigers (Team 4) Players
INSERT INTO Person VALUES (1014, 'Chris Walker', '1989-03-23', 0);
INSERT INTO Person VALUES (1016, 'Brian Young', '1987-05-31', 0);
INSERT INTO Person VALUES (1048, 'Marcus Gray', '1991-09-19', 0);
INSERT INTO Person VALUES (1049, 'Calvin Hughes', '1988-02-25', 0);
INSERT INTO Person VALUES (1050, 'Warren Price', '1990-11-13', 0);
INSERT INTO Person VALUES (1051, 'Spencer Watson', '1992-04-07', 0);
INSERT INTO Person VALUES (1052, 'Oscar Brooks', '1989-07-30', 0);
INSERT INTO Person VALUES (1053, 'Damian Kelly', '1987-12-16', 0);
INSERT INTO Person VALUES (1054, 'Russell Perry', '1993-01-24', 0);
INSERT INTO Person VALUES (1055, 'Elliot Ward', '1991-06-09', 0);
INSERT INTO Person VALUES (1056, 'Diego Morgan', '1988-10-28', 0);

-- Supporters (mixed gender)
INSERT INTO Person VALUES (1015, 'Joseph Allen', '1981-11-09', 0);
INSERT INTO Person VALUES (1017, 'Alexander Hall', '1978-09-14', 0);
INSERT INTO Person VALUES (1018, 'Mia King', '1993-01-27', 1);
INSERT INTO Person VALUES (1019, 'Christopher Wright', '1974-04-06', 0);
INSERT INTO Person VALUES (1020, 'Abigail Scott', '1991-08-19', 1);

-- Team records (with coaches from Person table)
INSERT INTO Team (Name, Coach_Salary, CID) VALUES ('Red Dragons', 120000.00, 1003);
INSERT INTO Team (Name, Coach_Salary, CID) VALUES ('Blue Eagles', 110000.00, 1007);
INSERT INTO Team (Name, Coach_Salary, CID) VALUES ('Green Lions', 125000.00, 1009);
INSERT INTO Team (Name, Coach_Salary, CID) VALUES ('Yellow Tigers', 105000.00, 1013);

-- Judge records
INSERT INTO Judge VALUES (1001, 85000.00);
INSERT INTO Judge VALUES (1005, 90000.00);
INSERT INTO Judge VALUES (1011, 88000.00);

-- Player records
-- Red Dragons players
INSERT INTO Player VALUES (1002, 175.5, 68.2, 1);
INSERT INTO Player VALUES (1004, 168.3, 62.7, 1);
INSERT INTO Player VALUES (1021, 188.5, 82.4, 1);
INSERT INTO Player VALUES (1022, 182.3, 79.8, 1);
INSERT INTO Player VALUES (1023, 175.0, 72.5, 1);
INSERT INTO Player VALUES (1024, 179.8, 75.2, 1);
INSERT INTO Player VALUES (1025, 184.2, 80.1, 1);
INSERT INTO Player VALUES (1026, 176.7, 74.3, 1);
INSERT INTO Player VALUES (1027, 181.5, 76.8, 1);
INSERT INTO Player VALUES (1028, 177.2, 73.5, 1);
INSERT INTO Player VALUES (1029, 183.8, 81.3, 1);

-- Blue Eagles players
INSERT INTO Player VALUES (1006, 182.1, 75.5, 2);
INSERT INTO Player VALUES (1008, 170.8, 65.3, 2);
INSERT INTO Player VALUES (1030, 185.4, 78.9, 2);
INSERT INTO Player VALUES (1031, 178.2, 73.0, 2);
INSERT INTO Player VALUES (1032, 180.7, 76.2, 2);
INSERT INTO Player VALUES (1033, 183.5, 79.4, 2);
INSERT INTO Player VALUES (1034, 176.3, 71.8, 2);
INSERT INTO Player VALUES (1035, 189.8, 84.6, 2);
INSERT INTO Player VALUES (1036, 181.2, 77.5, 2);
INSERT INTO Player VALUES (1037, 177.9, 74.1, 2);
INSERT INTO Player VALUES (1038, 186.7, 82.3, 2);

-- Green Lions players
INSERT INTO Player VALUES (1010, 178.6, 72.9, 3);
INSERT INTO Player VALUES (1012, 165.4, 60.1, 3);
INSERT INTO Player VALUES (1039, 179.2, 75.0, 3);
INSERT INTO Player VALUES (1040, 184.5, 80.7, 3);
INSERT INTO Player VALUES (1041, 177.6, 73.8, 3);
INSERT INTO Player VALUES (1042, 182.8, 78.2, 3);
INSERT INTO Player VALUES (1043, 180.1, 76.4, 3);
INSERT INTO Player VALUES (1044, 175.9, 71.3, 3);
INSERT INTO Player VALUES (1045, 187.3, 83.5, 3);
INSERT INTO Player VALUES (1046, 183.0, 79.9, 3);
INSERT INTO Player VALUES (1047, 176.2, 72.1, 3);

-- Yellow Tigers players
INSERT INTO Player VALUES (1014, 180.2, 74.8, 4);
INSERT INTO Player VALUES (1016, 172.7, 67.5, 4);
INSERT INTO Player VALUES (1048, 184.7, 80.3, 4);
INSERT INTO Player VALUES (1049, 178.9, 73.7, 4);
INSERT INTO Player VALUES (1050, 182.5, 78.6, 4);
INSERT INTO Player VALUES (1051, 175.3, 70.9, 4);
INSERT INTO Player VALUES (1052, 186.2, 82.8, 4);
INSERT INTO Player VALUES (1053, 179.4, 75.5, 4);
INSERT INTO Player VALUES (1054, 181.8, 77.2, 4);
INSERT INTO Player VALUES (1055, 177.0, 72.4, 4);
INSERT INTO Player VALUES (1056, 183.6, 79.1, 4);

-- Supporter records
INSERT INTO Supporter VALUES (1015, 1);
INSERT INTO Supporter VALUES (1017, 2);
INSERT INTO Supporter VALUES (1018, 3);
INSERT INTO Supporter VALUES (1019, 4);
INSERT INTO Supporter VALUES (1020, 1);

-- Stadium records
INSERT INTO Stadium (Sname, Location, Capacity) VALUES ('Victory Arena', 'New York', 75000);
INSERT INTO Stadium (Sname, Location, Capacity) VALUES ('Champions Field', 'Los Angeles', 68000);
INSERT INTO Stadium (Sname, Location, Capacity) VALUES ('Golden Stadium', 'Chicago', 62000);
INSERT INTO Stadium (Sname, Location, Capacity) VALUES ('Silver Dome', 'Houston', 70000);

-- Matches records
INSERT INTO Matches (MDate, SID, JudgeID, HomeTeam, AwayTeam, Winner) 
VALUES ('2024-09-10', 1, 1001, 1, 2, 1);

INSERT INTO Matches (MDate, SID, JudgeID, HomeTeam, AwayTeam, Winner) 
VALUES ('2024-09-15', 2, 1005, 3, 4, 4);

INSERT INTO Matches (MDate, SID, JudgeID, HomeTeam, AwayTeam, Winner) 
VALUES ('2024-09-22', 3, 1011, 1, 3, NULL);

INSERT INTO Matches (MDate, SID, JudgeID, HomeTeam, AwayTeam, Winner) 
VALUES ('2024-09-29', 4, 1001, 2, 4, 2);

-- Score records
INSERT INTO Score VALUES (1, 1002, 1004, 23, 15);
INSERT INTO Score VALUES (1, 1002, NULL, 67, 42);
INSERT INTO Score VALUES (2, 1014, 1016, 35, 28);
INSERT INTO Score VALUES (2, 1014, NULL, 78, 10);
INSERT INTO Score VALUES (3, 1002, 1004, 12, 35);
INSERT INTO Score VALUES (3, 1010, 1012, 45, 22);
INSERT INTO Score VALUES (4, 1006, 1008, 56, 48);
INSERT INTO Score VALUES (4, 1006, NULL, 89, 33);

-- Attends records
INSERT INTO Attends VALUES (1015, 1);
INSERT INTO Attends VALUES (1017, 1);
INSERT INTO Attends VALUES (1018, 2);
INSERT INTO Attends VALUES (1019, 2);
INSERT INTO Attends VALUES (1020, 3);
INSERT INTO Attends VALUES (1015, 3);
INSERT INTO Attends VALUES (1017, 4);
INSERT INTO Attends VALUES (1019, 4);