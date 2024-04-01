Create database BotTournament

CREATE TABLE [Tournament] (
  [Id] nvarchar (255) PRIMARY KEY,
  [TournamentName] nvarchar (255),
  [StartDate] datetime,
  [EndDate] datetime,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime, 
  [KeyId] nvarchar (255) UNIQUE
)
GO

CREATE TABLE [Referee] (
  [Id] nvarchar (255) PRIMARY KEY,
  [Username] nvarchar (255),
  [Password] nvarchar (255) ,
  [DisplayName] nvarchar (255),
  [role] integer,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime, 
)
GO

CREATE TABLE [Team] (
  [Id] nvarchar (255) PRIMARY KEY,
  [Name] nvarchar (255),
  [HighSchool_Id] nvarchar (255),
  [KeyId] nvarchar(255) UNIQUE,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime, 
)
GO

CREATE TABLE [HighSchool] (
  [Id] nvarchar (255) PRIMARY KEY,
  [Name] nvarchar (255),
  [KeyId] nvarchar(255) UNIQUE,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime, 
)
GO

CREATE TABLE [Player] (
  [Id] nvarchar (255) PRIMARY KEY,
  [Name] nvarchar (255),
  [Date_Of_Birth] datetime,
  [TeamId] nvarchar (255),
  [KeyId] nvarchar(255) UNIQUE,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime, 
)
GO

CREATE TABLE [Round] (
  [Id] nvarchar (255) PRIMARY KEY,
  [Roundname] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

CREATE TABLE [Map] (
  [Id] nvarchar (255) PRIMARY KEY,
  [MapName] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

CREATE TABLE [Match] (
  [Id] nvarchar (255) PRIMARY KEY,
  [MapId] nvarchar (255),
  [MatchDate] datetime,
  [RoundId] nvarchar (255),
  [TournamentId] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime 
)
GO

CREATE TABLE [RefereeInMatch] (
  [RefereeId] nvarchar (255),
  [MatchId] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime 
)
GO

CREATE TABLE [TeamInMatch] (
  [TeamId] nvarchar (255),
  [MatchId] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

CREATE TABLE [TeamActivity] (
  [Id] nvarchar (255) PRIMARY KEY,
  [ActivityDescription] nvarchar (255),
  [StartTime] time,
  [EndTime] time,
  [MatchId] nvarchar (255),
  [TeamId] nvarchar (255),
  [Duration] time,
  [Score] integer,
  [Violation] integer,
  [ActivityTypeId] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

CREATE TABLE [ActivityType] (
  [Id] nvarchar (255) PRIMARY KEY,
  [TypeName] nvarchar (255),
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

CREATE TABLE [TeamResult] (
  [Id] nvarchar (255) PRIMARY KEY,
  [MatchId] nvarchar (255),
  [TeamId] nvarchar (255),
  [Score] integer ,
  [Duration] time,
  [isWinner] bit,
  [CreatedTime] datetime,
  [LastUpdatedTime] datetime,
  [DeletedTime] datetime
)
GO

ALTER TABLE [Team] ADD FOREIGN KEY ([HighSchool_Id]) REFERENCES [HighSchool] ([Id])
GO

ALTER TABLE [Player] ADD FOREIGN KEY ([TeamId]) REFERENCES [Team] ([Id])
GO

ALTER TABLE [Match] ADD FOREIGN KEY ([MapId]) REFERENCES [Map] ([Id])
GO

ALTER TABLE [Match] ADD FOREIGN KEY ([RoundId]) REFERENCES [Round] ([Id])
GO

ALTER TABLE [Match] ADD FOREIGN KEY ([TournamentId]) REFERENCES [Tournament] ([Id])
GO

ALTER TABLE [RefereeInMatch] ADD FOREIGN KEY ([RefereeId]) REFERENCES [Referee] ([Id])
GO

ALTER TABLE [RefereeInMatch] ADD FOREIGN KEY ([MatchId]) REFERENCES [Match] ([Id])
GO

ALTER TABLE [TeamInMatch] ADD FOREIGN KEY ([TeamId]) REFERENCES [Team] ([Id])
GO

ALTER TABLE [TeamInMatch] ADD FOREIGN KEY ([MatchId]) REFERENCES [Match] ([Id])
GO

ALTER TABLE [TeamActivity] ADD FOREIGN KEY ([MatchId]) REFERENCES [Match] ([Id])
GO

ALTER TABLE [TeamActivity] ADD FOREIGN KEY ([TeamId]) REFERENCES [Team] ([Id])
GO

ALTER TABLE [TeamActivity] ADD FOREIGN KEY ([ActivityTypeId]) REFERENCES [ActivityType] ([Id])
GO

ALTER TABLE [TeamResult] ADD FOREIGN KEY ([MatchId]) REFERENCES [Match] ([Id])
GO

ALTER TABLE [TeamResult] ADD FOREIGN KEY ([TeamId]) REFERENCES [Team] ([Id])
GO

-- Sample data for Tournament table
INSERT INTO Tournament (Id, TournamentName, StartDate, EndDate, CreatedTime, LastUpdatedTime, DeletedTime, KeyId)
VALUES
('1', 'Sample Tournament', '2024-01-01', '2024-01-10', GETDATE(), GETDATE(), NULL, 'T1');

-- Sample data for Referee table
INSERT INTO Referee (Id, Username, Password, DisplayName, role, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'referee1', 'password123', 'Referee One', 1, GETDATE(), GETDATE(), NULL),
('2', 'referee2', 'securepass', 'Referee Two', 2, GETDATE(), GETDATE(), NULL);

-- Sample data for HighSchool table
INSERT INTO HighSchool (Id, Name, KeyId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'High School A', 'HS1', GETDATE(), GETDATE(), NULL),
('2', 'High School B', 'HS2', GETDATE(), GETDATE(), NULL);

-- Sample data for Team table
INSERT INTO Team (Id, Name, HighSchool_Id, KeyId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Team A', '1', 'TEAM1', GETDATE(), GETDATE(), NULL),
('2', 'Team B', '2', 'TEAM2', GETDATE(), GETDATE(), NULL);

-- Sample data for Player table
INSERT INTO Player (Id, Name, Date_Of_Birth, TeamId, KeyId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Player 1', '2000-01-01', '1', 'P1', GETDATE(), GETDATE(), NULL),
('2', 'Player 2', '1999-05-15', '2', 'P2', GETDATE(), GETDATE(), NULL);

-- Sample data for Round table
INSERT INTO Round (Id, Roundname, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Round 1', GETDATE(), GETDATE(), NULL),
('2', 'Round 2', GETDATE(), GETDATE(), NULL);

-- Sample data for Map table
INSERT INTO Map (Id, MapName, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Map A', GETDATE(), GETDATE(), NULL),
('2', 'Map B', GETDATE(), GETDATE(), NULL);

-- Sample data for Match table
INSERT INTO Match (Id, MapId, MatchDate, RoundId, TournamentId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', '1', '2024-01-02', '1', '1', GETDATE(), GETDATE(), NULL),
('2', '2', '2024-01-05', '2', '1', GETDATE(), GETDATE(), NULL);

-- Sample data for RefereeInMatch table
INSERT INTO RefereeInMatch (RefereeId, MatchId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', '1', GETDATE(), GETDATE(), NULL),
('2', '2', GETDATE(), GETDATE(), NULL);

-- Sample data for TeamInMatch table
INSERT INTO TeamInMatch (TeamId, MatchId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', '1', GETDATE(), GETDATE(), NULL),
('2', '2', GETDATE(), GETDATE(), NULL);

INSERT INTO ActivityType (Id, TypeName, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Goal', GETDATE(), GETDATE(), NULL),
('2', 'Penalty', GETDATE(), GETDATE(), NULL);

-- Sample data for TeamActivity table
INSERT INTO TeamActivity (Id, ActivityDescription, StartTime, EndTime, MatchId, TeamId, Duration, Score, Violation, ActivityTypeId, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', 'Scored a goal', '12:00', '12:30', '1', '1', '00:30', 1, 0, '1', GETDATE(), GETDATE(), NULL),
('2', 'Received a penalty', '14:00', '14:15', '2', '2', '00:15', 0, 1, '2', GETDATE(), GETDATE(), NULL);

-- Sample data for ActivityType table

-- Sample data for TeamResult table
INSERT INTO TeamResult (Id, MatchId, TeamId, Score, Duration, isWinner, CreatedTime, LastUpdatedTime, DeletedTime)
VALUES
('1', '1', '1', 2, '01:00', 1, GETDATE(), GETDATE(), NULL),
('2', '2', '2', 1, '00:45', 0, GETDATE(), GETDATE(), NULL);

SELECT * FROM ActivityType
SELECT * FROM HighSchool
SELECT * FROM Map
SELECT * FROM [Match]
SELECT * FROM Player
SELECT * FROM Referee
SELECT * FROM RefereeInMatch
SELECT * FROM [Round]
SELECT * FROM Team
SELECT * FROM TeamActivity
SELECT * FROM TeamResult
SELECT * FROM Tournament