USE [clonedb]
GO

/****** Object:  View [dbo].[Fact_Sales]    Script Date: 22/03/2023 19:45:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[Fact_Sales]
as
SELECT
B.ID,
A.ContractID,
A.[RequestDate],
A.ExternalBarCodeID,
A.[LocationID],
A.[distributionChannelID],
A.[dispatchUserID],
B.ItemID,
B.AcceptedPrice,
B.Qty,
[TotalValue] =B.AcceptedPrice * B.Qty,
B.RegistrationPointId
  FROM [clonedb].[dbo].[R_RECEPTION_NOTES] A
  JOIN [clonedb].[dbo].[R_RECEPTION_NOTE_DETAILS] B
  ON A.ID = B.ReceptionNoteID
GO

