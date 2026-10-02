ALTER TABLE fleet.vehicle_maintenance
    ADD CONSTRAINT fk_vehicle_maintenance_vehicle
    FOREIGN KEY (vehicle_id) REFERENCES fleet.vehicle (vehicle_id);

ALTER TABLE fleet.vehicle_maintenance
    ADD CONSTRAINT fk_vehicle_maintenance_maintenance_type
    FOREIGN KEY (maintenance_type_id) REFERENCES fleet.maintenance_type (maintenance_type_id);
