ALTER TABLE fleet.branch_operating_hour
    ADD CONSTRAINT fk_branch_operating_hour_branch
    FOREIGN KEY (branch_id) REFERENCES fleet.branch (branch_id);
