-- One row per open weekday of a branch. A closed day simply has no row.
CREATE TABLE fleet.branch_operating_hour (
    branch_operating_hour_id  INT IDENTITY(1,1) NOT NULL,
    branch_id                 INT               NOT NULL,
    day_of_week               SMALLINT          NOT NULL,  -- 1 = Monday ... 7 = Sunday
    opens_at                  TIME              NOT NULL,
    closes_at                 TIME              NOT NULL,

    CONSTRAINT pk_branch_operating_hour PRIMARY KEY (branch_operating_hour_id),
    CONSTRAINT ck_branch_operating_hour_day_of_week CHECK (day_of_week BETWEEN 1 AND 7)
);
