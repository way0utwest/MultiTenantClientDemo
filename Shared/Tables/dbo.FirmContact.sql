CREATE TABLE [dbo].[FirmContact]
(
[FirmContactID] [int] NOT NULL IDENTITY(1, 1),
[FirmID] [int] NOT NULL,
[ContactName] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactPK] PRIMARY KEY CLUSTERED  ([FirmContactID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FirmContact] ADD CONSTRAINT [FirmContactFK_Firm] FOREIGN KEY ([FirmID]) REFERENCES [dbo].[Firm] ([FirmID])
GO
