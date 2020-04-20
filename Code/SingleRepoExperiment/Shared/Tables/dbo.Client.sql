CREATE TABLE [dbo].[Client]
(
[ClientID] [int] NOT NULL IDENTITY(1, 1),
[ClientName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [ClientPK] PRIMARY KEY CLUSTERED  ([ClientID]) ON [PRIMARY]
GO
