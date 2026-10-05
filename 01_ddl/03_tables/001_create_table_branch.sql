-- Pickup/return locations. Weekly hours live in branch_operating_hour (one row per open day).
CREATE TABLE fleet.branch (
    branch_id  INT IDENTITY(1,1) NOT NULL,
    name       VARCHAR(100)      NOT NULL,
    address    VARCHAR(200)      NOT NULL,
    city       VARCHAR(100)      NOT NULL,
    phone      VARCHAR(20)       NULL,

    CONSTRAINT pk_branch PRIMARY KEY (branch_id)
);
