ALTER TABLE project
  ADD COLUMN shared_by TEXT references users (id);

