CREATE TABLE dbo.Client
(
     ClientID INT NOT NULL IDENTITY(1,1) CONSTRAINT ClientPK PRIMARY KEY
	 , ClientName VARCHAR(100)
	 , Active TINYINT
	 -- TODO add DateAdded
	 -- TODO add ClientContactID
)
GO
CREATE TABLE Firm
(
   FirmID  INT NOT NULL IDENTITY(1,1) CONSTRAINT FirmPK PRIMARY KEY,
   ClientID INT NOT NULL CONSTRAINT FirmFK_Client FOREIGN KEY REFERENCES dbo.Client(ClientID)
   , FirmName VARCHAR(200)
   , Active TINYINT
   -- TODO add DateCreated
   -- TODO add DateClosed
   )
   GO
CREATE TABLE dbo.FirmContact (
 FirmContactID INT IDENTITY(1,1) NOT NULL CONSTRAINT FirmContactPK PRIMARY KEY
 ,  FirmID INT NOT NULL CONSTRAINT FirmContactFK_Firm FOREIGN KEY REFERENCES dbo.Firm(FirmID)
 , ContactName VARCHAR(300)
 , Active TINYINT
 -- TODO add DateCreated
)
GO
CREATE VIEW dbo.vClientContact
AS
SELECT fc.FirmContactID
     , fc.FirmID
     , fc.ContactName
     , f.FirmName
     , c.ClientName
 FROM dbo.FirmContact AS fc
 INNER JOIN dbo.Firm AS f
 ON f.FirmID = fc.FirmID
 INNER JOIN dbo.Client AS c
 ON c.ClientID = f.ClientID
 WHERE c.Active = 1 
GO
CREATE PROCEDURE dbo.GetFirmsForClient
  @clientid INT 
AS
BEGIN
    SELECT f.FirmID, f.ClientID, f.FirmName, f.Active, c.ClientName
	 FROM dbo.Firm AS f
	 INNER JOIN dbo.Client AS c
	 ON c.ClientID = f.ClientID
	 WHERE f.ClientID = @clientid
END
GO
CREATE PROCEDURE dbo.AddFirm
  @clientid INT
  , @firmname VARCHAR(100) -- TODO fix length
  AS
  BEGIN
      INSERT dbo.Firm (ClientID, FirmName, Active) VALUES (@clientid, @firmname, 1)
  END
GO
CREATE PROCEDURE dbo.DeactivateClient
   @clientid int
AS
BEGIN
   -- TODO add check for valid ID
   -- TODO add transaction
    UPDATE dbo.Firm
	 SET Active = 0
	 WHERE ClientID = @clientid

	 UPDATE dbo.Client
	  SET Active = 0
	  WHERE ClientID = @clientid
END
GO
INSERT dbo.Client (ClientName, Active) 
   VALUES ('Marvel', 1)
   , ('DC', 1)
GO
INSERT dbo.Firm (ClientID, FirmName, Active)
  VALUES 
    (1, 'Original Avengers', 1)
  , (1, 'Bucky and Crew', 1)
  , (1, 'Extra Iron Men', 1)
  , (1, 'The Monks', 1)
  , (2, 'Gotham City', 1)
  , (2, 'Krypton', 1)
  , (2, 'The Oceans', 1)
  , (2, 'Amazon', 1)
GO
INSERT dbo.FirmContact (FirmID, ContactName, Active) 
VALUES 
  (1, 'Iron Man', 1)
, (1, 'Black Widow', 1)
, (1, 'Hulk', 1)
, (1, 'Thor', 1)
, (1, 'Captain America', 1)
, (2, 'Winter Soldier', 1)
, (2, 'Falcon', 1)
, (3, 'War Machine', 1)
, (4, 'Doctor Strange', 1)
, (4, 'Wong', 1)
, (5, 'Batman', 1)
, (5, 'Robin', 1)
, (6, 'Aguaman', 1)
, (7, 'Wonder Woman', 1)
GO
