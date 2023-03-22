/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Name]
      ,[IsCash]
      ,[Force_CNP]
      ,[Force_NrChit]
      ,[Force_SerieBil]
      ,[Force_DataBil]
      ,[Force_CodDiag]
      ,[Force_InsuranceType]
      ,[CoPaymentContractID]
      ,[Inserted]
      ,[Active]
      ,[Deleted]
      ,[Force_DisableAddSenderMedic]
      ,[Force_SenderMedicContract]
      ,[AllowSubcontracts]
      ,[InsurerID]
      ,[displayPrelevationPoint]
      ,[Force_ObservationFileNo]
      ,[SyncronizeContractID]
      ,[SalesAgentID]
      ,[NHP]
      ,[EmploymentMedicalExam]
      ,[ContractTypeID]
      ,[Discount]
      ,[CfgSiuiID]
      ,[customerID]
      ,[ContractEmail]
      ,[TvaID]
      ,[allowDocBook]
      ,[IsInternal]
      ,[Force_AuthorisationNo]
      ,[CONTRACTCODE]
      ,[IsCash_202004]
      ,[MarketSegment1ID]
      ,[MarketSegment2ID]
      ,[isRestrictedContract]
  FROM [clonedb].[dbo].[N_CONTRACTS]

  Create View [DimContract]
  as
  select
  A.ID,
  ContractName = A. [Name],
  ContractType = B. [Name],
   MarketSegment = 
  Case
when B.[Name] LIKE '%DIRECT RETAIL%' THEN 'SELF REFERRED'
when B.[Name] LIKE '%UNCLASSIFIED%' THEN 'SELF REFERRED'
when B.[Name] LIKE '%INSURANCE (HMO)%' THEN 'INSURANCE'
when B.[Name] LIKE '%LIFE INSURACE%' THEN 'INSURANCE'
when B.[Name] LIKE '%PRIVATE COMPANIES%' THEN 'CORPORATE'
when B.[Name] LIKE '%CORPORATE%' THEN 'CORPORATE'
when B.[Name] LIKE '%NGO%' THEN 'CORPORATE'
when B.[Name] LIKE '%RERUN SAMPLES%' THEN 'NOT REQUIRED'
when B.[Name] LIKE '%INTERNAL TRANSFER%' THEN 'NOT REQUIRED'
when B.[Name] LIKE '%SCREENING%' THEN 'NOT REQUIRED'
when B.[Name] LIKE '%CLINIC/HOSPITALS%' THEN 'CLINICS/HOSPITALS'
when B.[Name] LIKE '%PHARMA%' THEN 'CLINICS/HOSPITALS'
when B.[Name] LIKE '%CLINIC%' THEN 'CLINIC/HOSPITALS'
when B.[Name] LIKE '%RESEARCH%' THEN 'RESEARCH'
when B.[Name] LIKE '%PRIVATE PRACTICE%' THEN 'DOCTOR REFERRED'
when B.[Name] LIKE '%LABORATORY%' THEN 'PATHOLOGY LABS'
when B.[Name] LIKE '%PATHOLOGY LABORATORY%' THEN 'PATHOLOGY LABS'
when B.[Name] LIKE '%GOVERNMENT%' THEN 'PUBLIC PRIVATE PARTNERSHIP'
when B.[Name] LIKE '%PUBLIC PRIVATE PARTNERSHIP%' THEN 'PUBLIC PRIVATE PARTNERSHIP'
END
  from [clonedb].[dbo].[N_CONTRACTS]A
  JOIN
  [clonedb].[dbo].[N_CONTRACT_TYPES]B
  ON A.ContractTypeID =B.ID


  