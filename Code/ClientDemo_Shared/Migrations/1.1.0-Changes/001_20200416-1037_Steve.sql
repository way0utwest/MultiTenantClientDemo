-- <Migration ID="fd5982f7-92f4-42ab-8714-ba0683eaca6f" />
GO

PRINT N'Altering [dbo].[Client]'
GO
ALTER TABLE [dbo].[Client] ADD
[DateCreated] [datetime2] (3) NULL CONSTRAINT [DF__Client__DateCrea__4D94879B] DEFAULT (sysutcdatetime())
GO
