-- The previous CHECK has no CANCELLED: refuse to roll back while cancelled maintenances exist,
-- instead of losing them or adding the constraint WITH NOCHECK (migration-strategy.md forbids it).
IF EXISTS (SELECT 1 FROM fleet.vehicle_maintenance WHERE status = 'CANCELLED')
    THROW 50000, 'Cannot roll back: fleet.vehicle_maintenance has CANCELLED rows', 1;

ALTER TABLE fleet.vehicle_maintenance DROP CONSTRAINT ck_vehicle_maintenance_status;

ALTER TABLE fleet.vehicle_maintenance ADD CONSTRAINT ck_vehicle_maintenance_status
    CHECK (status IN ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED'));
