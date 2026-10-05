-- The fleet panel and the Home search filter by branch; deleting a branch checks it has no vehicles
CREATE INDEX ix_vehicle_branch_id
    ON fleet.vehicle (branch_id);
