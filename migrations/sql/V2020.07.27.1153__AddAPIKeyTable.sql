CREATE TABLE ADR_key
(
    key TEXT PRIMARY KEY,
    user_id TEXT references users (id)
);
