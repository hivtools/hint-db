CREATE TABLE version
(
    id SERIAL PRIMARY KEY,
    user_id TEXT references users (id),
    name TEXT NOT NULL,
    note TEXT
);

ALTER TABLE user_session
ADD COLUMN version_id INTEGER references version (id),
ADD COLUMN state TEXT,
ADD COLUMN note TEXT,
ADD COLUMN created TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
ADD COLUMN updated TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc'),
ADD COLUMN deleted BOOLEAN DEFAULT FALSE;
