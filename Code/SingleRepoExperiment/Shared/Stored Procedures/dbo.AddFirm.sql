SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddFirm]
  @clientid INT
  , @firmname VARCHAR(100) -- TODO fix length
  AS
  BEGIN
      INSERT dbo.Firm (ClientID, FirmName, Active) VALUES (@clientid, @firmname, 1)
  END
GO
