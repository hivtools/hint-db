CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE file(
    hash TEXT primary key
);

CREATE TABLE session_files
(
    session   TEXT primary key,
    file      TEXT,
    type      TEXT
);

ALTER TABLE session_files ADD FOREIGN KEY (session) REFERENCES user_session (session);
ALTER TABLE session_files ADD FOREIGN KEY (file) REFERENCES file (hash);
