CREATE TABLE fleet.maintenance_type (
    maintenance_type_id  INT IDENTITY(1,1) NOT NULL,
    name                 VARCHAR(50)       NOT NULL,
    description          VARCHAR(255)      NULL,

    CONSTRAINT pk_maintenance_type PRIMARY KEY (maintenance_type_id)
);
