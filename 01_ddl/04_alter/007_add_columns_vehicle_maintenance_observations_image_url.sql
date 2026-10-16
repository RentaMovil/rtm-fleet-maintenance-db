-- Administrator's notes and a photo of the work or the invoice (HU-FLEET-008). Both optional.
ALTER TABLE fleet.vehicle_maintenance ADD
    observations  VARCHAR(500) NULL,
    image_url     VARCHAR(255) NULL;
