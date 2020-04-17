# Client Demo Project
This project is a demo project to handle showcase a setup for a database project that contains a commmon database project along with custom projects for different clients.

## Setup
Run the 00_create_database script first to create databases. This creates multiple databases on an instance, but you can create these on separate instances. The convention is 
  * ClientDemo_1_xxxx  - These are development environments
  * ClientDemo_3_xxxx - These are QA environments
  * ClientDemo_5_xxxx - These are Production environments

Run the 01_db_populate.sql script to add objects and data.

## Code Folder
This is a subfolder designed to hold code. This can hold both application and database code. Teh app code is templated, but not used here. The datbase code is structured as a main solution with multiple sub projects.
