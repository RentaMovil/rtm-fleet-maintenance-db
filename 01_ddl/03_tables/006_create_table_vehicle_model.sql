-- category_id and engine_type_id describe the model, not each physical unit (models.md).
CREATE TABLE fleet.vehicle_model (
    model_id        INT IDENTITY(1,1) NOT NULL,
    brand_id        INT               NOT NULL,
    name            VARCHAR(50)       NOT NULL,
    category_id     INT               NOT NULL,
    engine_type_id  INT               NOT NULL,

    CONSTRAINT pk_vehicle_model PRIMARY KEY (model_id)
);
