-- An index on the bare short name of a path-derived symbol.
--
-- `Identifier` and `IdentifierPrefix` requests carry only a short name (and
-- sometimes a file), never a full exact/normalized name. `path_arm_lean_units`
-- otherwise has no way to answer those from `workspace_path_symbol_exact_names`
-- with a seek: `idx_workspace_file_path_symbol_rows_exact` and `_normalized`
-- are keyed on the full name, not a bare identifier.

CREATE INDEX idx_workspace_file_path_symbol_rows_short_name
  ON workspace_file_path_symbol_rows(short_name, file_version_id);
