CREATE TABLE fleet.vehicle_maintenance (
    maintenance_id       INT IDENTITY(1,1) NOT NULL,
    vehicle_id           INT               NOT NULL,
    maintenance_type_id  INT               NOT NULL,
    start_date           DATE              NOT NULL,
    end_date             DATE              NULL,      -- NULL while in progress
    cost                 DECIMAL(10,2)     NULL,
    status               VARCHAR(30)       NOT NULL,

    CONSTRAINT pk_vehicle_maintenance PRIMARY KEY (maintenance_id),
    CONSTRAINT ck_vehicle_maintenance_status CHECK (status IN ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED'))
);
