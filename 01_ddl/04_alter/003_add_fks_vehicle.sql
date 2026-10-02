ALTER TABLE fleet.vehicle
    ADD CONSTRAINT fk_vehicle_vehicle_model
    FOREIGN KEY (model_id) REFERENCES fleet.vehicle_model (model_id);

ALTER TABLE fleet.vehicle
    ADD CONSTRAINT fk_vehicle_branch
    FOREIGN KEY (branch_id) REFERENCES fleet.branch (branch_id);
