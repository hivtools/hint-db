CREATE TABLE project
(
    id SERIAL PRIMARY KEY,
    user_id TEXT references users (id),
    name TEXT NOT NULL,
    note TEXT
);

CREATE TABLE project_version
(
    id TEXT PRIMARY KEY,
    project_id INTEGER references version (id),
    state TEXT,
    note TEXT,
    created TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
    updated TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
    deleted BOOLEAN DEFAULT FALSE
);


CREATE TABLE version_file
(
    version  TEXT references project_version (id),
    hash      TEXT references file (hash),
    type      TEXT,
    fileName  TEXT,
    PRIMARY KEY (version, hash, type)
);
