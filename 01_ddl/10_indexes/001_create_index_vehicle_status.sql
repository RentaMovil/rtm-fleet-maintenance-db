-- Every catalog search filters status = 'AVAILABLE' first (HU-FLEET-001)
CREATE INDEX ix_vehicle_status
    ON fleet.vehicle (status);
