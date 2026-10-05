-- Map position of each branch (frontend map on the reservation and branches screens).
-- Nullable: the branches that already exist have no coordinates until an admin edits them.
ALTER TABLE fleet.branch
    ADD latitude  DECIMAL(10,8) NULL,
        longitude DECIMAL(11,8) NULL;
