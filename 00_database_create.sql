/*
Structure assumptions
  ClientDemo_1_xxx - Development environments
  ClientDemo_3_xxx - QA environments
  ClientDemo_5_xxx - Production environments

  2 held for integration
  4 held for staging

*/
CREATE DATABASE ClientDemo_1_Shared
GO
CREATE DATABASE ClientDemo_5_Shared
GO
CREATE DATABASE ClientDemo_3_Shared
GO
CREATE DATABASE ClientDemo_1_Client1
GO
CREATE DATABASE ClientDemo_1_Client2
GO
CREATE DATABASE clientdemo_4_blank
GO
CREATE DATABASE clientdemo_4_Shared