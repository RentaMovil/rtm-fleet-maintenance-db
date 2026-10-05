-- At most one row per day per branch (BranchOperatingHour.INV-002). The service checks it too, but
-- only the database can stop two concurrent requests from both inserting the same day.
ALTER TABLE fleet.branch_operating_hour
    ADD CONSTRAINT uq_branch_operating_hour_branch_id_day_of_week UNIQUE (branch_id, day_of_week);
