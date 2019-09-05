CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE session_files
(
    session   TEXT primary key,
    pjnz      TEXT null,
    programme TEXT null,
    survey    TEXT null,
    anc       TEXT null,
    shape     TEXT null
);

ALTER TABLE session_files ADD FOREIGN KEY (session) REFERENCES user_session (session);
