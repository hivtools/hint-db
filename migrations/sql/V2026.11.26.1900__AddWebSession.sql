-- The logins and guest visits of the Python API (hint-py). It replaces the Kotlin app's sessions, which were kept in
-- the memory of the server.
--
-- The cookie holds a random session id. This table holds only the SHA-256 of it, so a copy of the table cannot be used
-- to log in. The Python API checks `expires_at` and the absolute limit (from `created_at`) in each query that reads a
-- row, so an old row that is still here does not let anyone in.
CREATE TABLE web_session
(
    id_hash                 BYTEA PRIMARY KEY,
    -- NULL for a guest
    user_id                 TEXT REFERENCES users (id) ON DELETE CASCADE,
    -- The Auth0 access token of a single sign-on user, with which the API calls ADR as them. It is encrypted by the API
    -- (Fernet, with a key that is not in the database), so a copy of the table does not give anyone the token. Never
    -- sent to the browser
    encrypted_access_token  TEXT,
    -- When Auth0 says the token stops working. NULL if Auth0 did not say
    access_token_expires_at TIMESTAMPTZ,
    created_at              TIMESTAMPTZ NOT NULL,
    expires_at              TIMESTAMPTZ NOT NULL
)
    -- Requests move expires_at on (at most every few minutes). Space on the page lets Postgres do that without moving
    -- the row (a HOT update), as no index has expires_at in it
    WITH (fillfactor = 80);

-- "Log out everywhere", and a deleted user, remove all the rows of a user
CREATE INDEX web_session_user_id ON web_session (user_id);

-- The project versions that the server gave to a guest (POST /guest/version). A guest has no projects, so this is the
-- only record of which versions are theirs. One row for each, so that two requests at the same time cannot lose one.
CREATE TABLE web_session_guest_version
(
    session_id_hash BYTEA REFERENCES web_session (id_hash) ON DELETE CASCADE,
    version_id      TEXT REFERENCES project_version (id) ON DELETE CASCADE,
    PRIMARY KEY (session_id_hash, version_id)
);

-- The version is deleted with its guest's row, so the foreign key from the version needs an index
CREATE INDEX web_session_guest_version_version_id ON web_session_guest_version (version_id);
