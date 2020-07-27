CREATE TABLE ADR_key
(
    api_key TEXT PRIMARY KEY,
    user_id TEXT references users (id)
);
