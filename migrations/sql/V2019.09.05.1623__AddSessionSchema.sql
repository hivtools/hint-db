CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE file(
    hash TEXT primary key
);

CREATE TABLE session_file
(
    session   TEXT references user_session (session),
    hash      TEXT references file (hash),
    type      TEXT,
    fileName  TEXT,
    primary key (session, hash)
);
