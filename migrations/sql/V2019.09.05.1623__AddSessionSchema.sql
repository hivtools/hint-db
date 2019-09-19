CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE file(
    hash TEXT primary key,
    fileName TEXT
);

CREATE TABLE session_files
(
    session   TEXT primary key references user_session (session),
    file      TEXT references file (hash),
    type      TEXT
);
