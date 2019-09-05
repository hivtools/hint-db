CREATE TABLE user_session
(
    session TEXT primary key,
    user_id TEXT references users (id)
);

CREATE TABLE session_files
(
    session   TEXT references user_session (session),
    pjnz      TEXT,
    programme TEXT,
    survey    TEXT,
    anc       TEXT,
    shape     TEXT
)
