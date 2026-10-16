-- CANCELLED replaces deleting a maintenance (VehicleMaintenance.INV-005): a maintenance is never
-- physically deleted. A CHECK can't be altered in SQL Server, so it's dropped and recreated with
-- the same name. Existing rows only use the three previous values, so the new CHECK validates them.
ALTER TABLE fleet.vehicle_maintenance DROP CONSTRAINT ck_vehicle_maintenance_status;

ALTER TABLE fleet.vehicle_maintenance ADD CONSTRAINT ck_vehicle_maintenance_status
    CHECK (status IN ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'));
