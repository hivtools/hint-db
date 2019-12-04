ALTER TABLE session_file
  DROP CONSTRAINT session_file_pkey;

ALTER TABLE session_file
  ADD CONSTRAINT session_file_pkey
    PRIMARY KEY (session, hash, type);