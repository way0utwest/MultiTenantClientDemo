CREATE TABLE [dbo].[FirmContact]
(
[FirmContactID] [int] NOT NULL IDENTITY(1, 1),
[FirmID] [int] NOT NULL,
[ContactName] [varchar] (300) NULL,
[Active] [tinyint] NULL
)
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactPK] PRIMARY KEY CLUSTERED  ([FirmContactID])
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactFK_Firm] FOREIGN KEY ([FirmID]) REFERENCES [dbo].[Firm] ([FirmID])
GO
