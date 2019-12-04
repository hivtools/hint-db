ALTER TABLE session_file
  DROP PRIMARY KEY;

ALTER TABLE session_file
  ADD CONSTRAINT session_file_pk
    PRIMARY KEY (session, hash, type);