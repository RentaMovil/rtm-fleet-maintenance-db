ALTER TABLE fleet.vehicle_model
    ADD CONSTRAINT fk_vehicle_model_brand
    FOREIGN KEY (brand_id) REFERENCES fleet.brand (brand_id);

ALTER TABLE fleet.vehicle_model
    ADD CONSTRAINT fk_vehicle_model_category
    FOREIGN KEY (category_id) REFERENCES fleet.category (category_id);

ALTER TABLE fleet.vehicle_model
    ADD CONSTRAINT fk_vehicle_model_engine_type
    FOREIGN KEY (engine_type_id) REFERENCES fleet.engine_type (engine_type_id);
