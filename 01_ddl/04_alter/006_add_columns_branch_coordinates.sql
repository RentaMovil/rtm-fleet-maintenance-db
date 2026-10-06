
-- Map location of the branch (Branch.INV-001): optional, but both or neither.
-- Added when the web front-end was connected: admin picks the branch on a map, and the
-- reservation and vehicle-location screens draw branches on a map.
ALTER TABLE fleet.branch ADD
    latitude   DECIMAL(9,6) NULL,
    longitude  DECIMAL(9,6) NULL;

ALTER TABLE fleet.branch ADD CONSTRAINT ck_branch_latitude
    CHECK (latitude IS NULL OR latitude BETWEEN -90 AND 90);

ALTER TABLE fleet.branch ADD CONSTRAINT ck_branch_longitude
    CHECK (longitude IS NULL OR longitude BETWEEN -180 AND 180);

ALTER TABLE fleet.branch ADD CONSTRAINT ck_branch_coordinates
    CHECK (
        (latitude IS NULL AND longitude IS NULL)
        OR (latitude IS NOT NULL AND longitude IS NOT NULL)
    );