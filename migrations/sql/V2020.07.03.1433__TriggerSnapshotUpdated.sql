CREATE OR REPLACE FUNCTION set_updated_to_utc_now()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated = (now() at time zone 'utc');
  RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER version_snapshot_updated BEFORE UPDATE
    ON version_snapshot FOR EACH ROW EXECUTE PROCEDURE
    set_updated_to_utc_now();
