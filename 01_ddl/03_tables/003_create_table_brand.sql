CREATE TABLE fleet.brand (
    brand_id  INT IDENTITY(1,1) NOT NULL,
    name      VARCHAR(50)       NOT NULL,

    CONSTRAINT pk_brand PRIMARY KEY (brand_id),
    CONSTRAINT uq_brand_name UNIQUE (name)
);
