-- <Migration ID="facd0d74-0149-4b59-beb3-e97385afcbbc" />
GO

PRINT N'Altering [dbo].[Client]'
GO
ALTER TABLE [dbo].[Client] ADD
[DateCreated] [datetime2] (3) NULL CONSTRAINT [DF__Client__DateCrea__45F365D3] DEFAULT (sysutcdatetime())
GO
