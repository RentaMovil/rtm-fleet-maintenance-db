CREATE TABLE fleet.engine_type (
    engine_type_id  INT IDENTITY(1,1) NOT NULL,
    name            VARCHAR(50)       NOT NULL,

    CONSTRAINT pk_engine_type PRIMARY KEY (engine_type_id)
);
