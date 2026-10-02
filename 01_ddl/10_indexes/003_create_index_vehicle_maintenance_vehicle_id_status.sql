-- "The IN_PROGRESS maintenance of this vehicle" (complete maintenance, retire from maintenance)
CREATE INDEX ix_vehicle_maintenance_vehicle_id_status
    ON fleet.vehicle_maintenance (vehicle_id, status);
