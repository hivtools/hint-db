CREATE TABLE version
(
    id SERIAL PRIMARY KEY,
    user_id TEXT references users (id),
    name TEXT NOT NULL,
    note TEXT
);

CREATE TABLE version_snapshot
(
    id TEXT PRIMARY KEY,
    version_id INTEGER references version (id),
    state TEXT,
    note TEXT,
    created TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
    updated TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
    deleted BOOLEAN DEFAULT FALSE
);


CREATE TABLE snapshot_file
(
    snapshot  TEXT references version_snapshot (id),
    hash      TEXT references file (hash),
    type      TEXT,
    fileName  TEXT,
    PRIMARY KEY (snapshot, hash, type)
);
