-- Data access only, and only on the fleet schema: no DDL (that's Liquibase's job with its own
-- account), no access to other services' schemas or to dbo (Liquibase history tables).
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::fleet TO fleet_app;
