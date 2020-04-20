SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
