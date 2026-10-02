-- Schema that holds every table owned by the fleet-maintenance service inside the shared
-- rentamovil database. CREATE SCHEMA must be the only statement in its batch, hence the EXEC wrapper.
IF SCHEMA_ID('fleet') IS NULL
    EXEC('CREATE SCHEMA fleet');
