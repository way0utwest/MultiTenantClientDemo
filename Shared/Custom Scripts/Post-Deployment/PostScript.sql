/*
* Use this Post-Deployment script to perform tasks after the deployment of the project.
* Read more at https://www.red-gate.com/SOC7/post-deployment-script-help
*/
-- Synonym Correction
IF RIGHT(DB_NAME(), 9) = 'Client001'
BEGIN
    DROP SYNONYM IF EXISTS dbo.AddFirm
	CREATE SYNONYM dbo.AddFirm FOR dbo.AddFirm_Client001
END

IF RIGHT(DB_NAME(), 9) = 'Client002'
BEGIN
    DROP SYNONYM IF EXISTS dbo.AddFirm
	CREATE SYNONYM dbo.AddFirm FOR dbo.AddFirm_Client002

	DROP SYNONYM IF EXISTS dbo.GetFirmsForClient
	CREATE SYNONYM dbo.GetFirmsForClient FOR dbo.GetFirmsForClient_Client002
END