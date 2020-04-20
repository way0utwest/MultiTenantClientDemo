CREATE TABLE [dbo].[Client]
(
[ClientID] [int] NOT NULL IDENTITY(1, 1),
[ClientName] [varchar] (100) NULL,
[Active] [tinyint] NULL,
[DateCreated] [datetime2] (3) NULL CONSTRAINT [DF__Client__DateCrea__45F365D3] DEFAULT (sysutcdatetime())
)
GO
ALTER TABLE [dbo].[Client] ADD CONSTRAINT [ClientPK] PRIMARY KEY CLUSTERED  ([ClientID])
GO
