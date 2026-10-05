-- Database identity the rtm-fleet-maintenance service connects with (never sa).
-- LOGIN = credentials to enter the SQL Server instance; USER = its identity inside rentamovil.
-- The password comes from liquibase.properties (parameter.fleetAppPassword), never from this repo.

-- Fail fast if the parameter wasn't provided: Liquibase would otherwise leave the literal text.
IF '${fleetAppPassword}' = '$' + '{fleetAppPassword}'
    THROW 50000, 'Missing parameter.fleetAppPassword in liquibase.properties', 1;

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'fleet_app')
    CREATE LOGIN fleet_app WITH PASSWORD = '${fleetAppPassword}', CHECK_POLICY = ON;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'fleet_app')
    CREATE USER fleet_app FOR LOGIN fleet_app WITH DEFAULT_SCHEMA = fleet;
