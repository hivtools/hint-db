ALTER TABLE session_file
  DROP CONSTRAINT session_file_pk;

ALTER TABLE session_file
  ADD CONSTRAINT session_file_pk
    PRIMARY KEY (session, hash, type);