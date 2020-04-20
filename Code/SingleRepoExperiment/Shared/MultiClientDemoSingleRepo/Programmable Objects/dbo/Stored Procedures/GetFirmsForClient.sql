IF OBJECT_ID('[dbo].[GetFirmsForClient]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetFirmsForClient];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
