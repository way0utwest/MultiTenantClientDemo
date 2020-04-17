IF OBJECT_ID('[dbo].[DeactivateClient]') IS NOT NULL
	DROP PROCEDURE [dbo].[DeactivateClient];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   PROCEDURE [dbo].[DeactivateClient]
   @clientid INT
AS
BEGIN
     -- client001 mod
    IF @clientid IS NULL
	  PRINT 'test'

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
