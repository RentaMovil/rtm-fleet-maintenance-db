-- The fleet itself. Never deleted: RETIRED is a logical, terminal retirement because past
-- reservations and rentals keep referencing the row.
CREATE TABLE fleet.vehicle (
    vehicle_id   INT IDENTITY(1,1) NOT NULL,
    plate        VARCHAR(10)       NOT NULL,
    model_id     INT               NOT NULL,
    capacity     INT               NULL,
    year         INT               NULL,
    image_url    VARCHAR(255)      NULL,
    status       VARCHAR(30)       NOT NULL,
    mileage      DECIMAL(10,2)     NOT NULL,
    daily_price  DECIMAL(10,2)     NOT NULL,
    branch_id    INT               NOT NULL,

    CONSTRAINT pk_vehicle PRIMARY KEY (vehicle_id),
    CONSTRAINT uq_vehicle_plate UNIQUE (plate),
    CONSTRAINT ck_vehicle_status CHECK (status IN ('AVAILABLE', 'RENTED', 'MAINTENANCE', 'RETIRED'))
);
