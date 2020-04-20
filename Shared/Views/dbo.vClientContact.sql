SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
