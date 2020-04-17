-- <Migration ID="54491bff-3ec4-4186-a387-80b7507c8711" />
GO

PRINT N'Creating [dbo].[Supplier_Client001]'
GO
CREATE TABLE [dbo].[Supplier_Client001]
(
[SupplierKey] [int] NOT NULL IDENTITY(1, 1),
[SupplierName] [varchar] (100) NULL
)
GO
