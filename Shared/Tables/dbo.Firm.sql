CREATE TABLE [dbo].[Firm]
(
[FirmID] [int] NOT NULL IDENTITY(1, 1),
[ClientID] [int] NOT NULL,
[FirmName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmPK] PRIMARY KEY CLUSTERED  ([FirmID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmFK_Client] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID])
GO
