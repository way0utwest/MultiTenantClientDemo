IF OBJECT_ID('[dbo].[GetSomething_Client001]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetSomething_Client001];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSomething_Client001]
AS
SELECT 1
GO