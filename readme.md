# Client Demo Project
This project is a demo project to handle showcase a setup for a database project that contains a commmon database project along with custom projects for different clients.

## Setup
Run the 00_create_database script first to create databases. This creates multiple databases on an instance, but you can create these on separate instances. The convention is 
  * ClientDemo_1_xxxx  - These are development environments
  * ClientDemo_3_xxxx - These are QA environments
  * ClientDemo_4_xxxx - These are staging environments
  * ClientDemo_5_xxxx - These are Production environments

Run the 01_db_populate.sql script to add objects and data.

## Code Folder
This is a subfolder designed to hold code. This can hold both application and database code. Teh app code is templated, but not used here. The datbase code is structured as a main solution with multiple sub projects.

The database projects are kept here. The main project and solution are in the "shared" folder.

## Release Flow
The idea here is that Azure DevOps will handle the build and release creation facilities. This means QA is likely going to be updated with ADO.

For producing production packages, ADO has a release step with the "create package" task. The release, however, needs to be handled with the ReleaseDBArtifact.ps1 script in the root of this repo. This powershell script takes these parameters:
  1. Server instance name
  2. database name
  3. name/path of the release artifact (.zip file)

 Sample call in PowerShell:
 ```
 .\ReleaseDBArtifact.ps1 Plato\SQL2017 ClientDemo_4_Client001 "E:\platoagent\releases\Release-5.Produce Upgrade Package.zip"
```