IF OBJECT_ID('[dbo].[DeactivateClient]') IS NOT NULL
	DROP PROCEDURE [dbo].[DeactivateClient];

GO
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
   BEGIN TRAN
    UPDATE dbo.Firm
	 SET Active = 0
	 WHERE ClientID = @clientid

	 UPDATE dbo.Client
	  SET Active = 0
	  WHERE ClientID = @clientid
	IF @@ERROR = 0
	 COMMIT
	 ELSE ROLLBACK
END
GO
