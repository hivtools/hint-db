CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE session_files
(
    session   TEXT primary key,
    anc       TEXT null,
    pjnz      TEXT null,
    population TEXT null,
    programme TEXT null,
    shape       TEXT null,
    survey    TEXT null
);

ALTER TABLE session_files ADD FOREIGN KEY (session) REFERENCES user_session (session);
