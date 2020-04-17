CREATE TABLE [dbo].[Firm]
(
[FirmID] [int] NOT NULL IDENTITY(1, 1),
[ClientID] [int] NOT NULL,
[FirmName] [varchar] (200) NULL,
[Active] [tinyint] NULL
)
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmPK] PRIMARY KEY CLUSTERED  ([FirmID])
GO
ALTER TABLE [dbo].[Firm] ADD CONSTRAINT [FirmFK_Client] FOREIGN KEY ([ClientID]) REFERENCES [dbo].[Client] ([ClientID])
GO
