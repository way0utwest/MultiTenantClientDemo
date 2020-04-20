CREATE TABLE [dbo].[Client]
(
[ClientID] [int] NOT NULL IDENTITY(1, 1),
[ClientName] [varchar] (100) NULL,
[Active] [tinyint] NULL
)
GO
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [ClientPK] PRIMARY KEY CLUSTERED  ([ClientID])
GO
