ALTER TABLE fleet.branch DROP CONSTRAINT IF EXISTS ck_branch_coordinates;
ALTER TABLE fleet.branch DROP CONSTRAINT IF EXISTS ck_branch_longitude;
ALTER TABLE fleet.branch DROP CONSTRAINT IF EXISTS ck_branch_latitude;
ALTER TABLE fleet.branch DROP COLUMN IF EXISTS longitude, latitude;
