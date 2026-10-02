DROP USER IF EXISTS fleet_app;

IF EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'fleet_app')
    DROP LOGIN fleet_app;
