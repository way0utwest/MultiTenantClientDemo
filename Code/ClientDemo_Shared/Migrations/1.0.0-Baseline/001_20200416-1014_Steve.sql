-- <Migration ID="ccbf5b13-1462-4849-892f-137f0692a611" />
GO

PRINT N'Creating [dbo].[Firm]'
GO
CREATE TABLE [dbo].[Firm]
(
[FirmID] [int] NOT NULL IDENTITY(1, 1),
[ClientID] [int] NOT NULL,
[FirmName] [varchar] (200) NULL,
[Active] [tinyint] NULL
)
GO
PRINT N'Creating primary key [FirmPK] on [dbo].[Firm]'
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmPK] PRIMARY KEY CLUSTERED  ([FirmID])
GO
PRINT N'Creating [dbo].[FirmContact]'
GO
CREATE TABLE [dbo].[FirmContact]
(
[FirmContactID] [int] NOT NULL IDENTITY(1, 1),
[FirmID] [int] NOT NULL,
[ContactName] [varchar] (300) NULL,
[Active] [tinyint] NULL
)
GO
PRINT N'Creating primary key [FirmContactPK] on [dbo].[FirmContact]'
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactPK] PRIMARY KEY CLUSTERED  ([FirmContactID])
GO
PRINT N'Creating [dbo].[Client]'
GO
CREATE TABLE [dbo].[Client]
(
[ClientID] [int] NOT NULL IDENTITY(1, 1),
[ClientName] [varchar] (100) NULL,
[Active] [tinyint] NULL
)
GO
PRINT N'Creating primary key [ClientPK] on [dbo].[Client]'
GO
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [ClientPK] PRIMARY KEY CLUSTERED  ([ClientID])
GO
PRINT N'Creating [dbo].[vClientContact]'
GO
CREATE VIEW [dbo].[vClientContact]
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
PRINT N'Creating [dbo].[GetFirmsForClient]'
GO
CREATE PROCEDURE [dbo].[GetFirmsForClient]
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
PRINT N'Creating [dbo].[AddFirm]'
GO
CREATE PROCEDURE [dbo].[AddFirm]
  @clientid INT
  , @firmname VARCHAR(100) -- TODO fix length
  AS
  BEGIN
      INSERT dbo.Firm (ClientID, FirmName, Active) VALUES (@clientid, @firmname, 1)
  END
GO
PRINT N'Creating [dbo].[DeactivateClient]'
GO
CREATE PROCEDURE [dbo].[DeactivateClient]
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
PRINT N'Adding foreign keys to [dbo].[Firm]'
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmFK_Client] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID])
GO
PRINT N'Adding foreign keys to [dbo].[FirmContact]'
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactFK_Firm] FOREIGN KEY ([FirmID]) REFERENCES [dbo].[Firm] ([FirmID])
GO
