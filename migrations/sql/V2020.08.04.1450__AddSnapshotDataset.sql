CREATE TABLE snapshot_dataset
(
    snapshot TEXT PRIMARY KEY references version_snapshot (id),
    id TEXT,
    name TEXT,
    last_modified TEXT
);
