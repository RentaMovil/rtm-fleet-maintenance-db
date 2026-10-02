CREATE TABLE fleet.category (
    category_id  INT IDENTITY(1,1) NOT NULL,
    name         VARCHAR(50)       NOT NULL,
    description  VARCHAR(255)      NULL,

    CONSTRAINT pk_category PRIMARY KEY (category_id)
);
