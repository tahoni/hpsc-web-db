# HPSC Database

## Release Notes

### Version 1.1.0 - 2026-02-21

This release updates the database schema scripts and documentation templates as part of the IPSC workstream.
Key improvements include refreshed match table data handling, restored join tables, and removal of unnecessary
tables.

#### Database Schema Changes

**Added / Restored**

- Restored required join tables to support domain relationships

**Updated**

- Refreshed data updates for the `match` table
- Updated schema generation and migration scripts:
    - `scripts/table_create.sql`
    - `scripts/table_alter.sql`

**Removed**

- Removed unnecessary tables from the schema

#### Schema Enhancements

**Competitor**

- Made `sapsa_number` optional (nullable, `varchar(255)`)
- Added `place` (nullable) to store competitor placing

**Match Competitor**

- Added `is_disqualified` (nullable boolean) for match-level DQ tracking
- Added `place` (nullable) for match-level placing

**Match Stage Competitor**

- Added per-stage score buckets: `score_a`, `score_b`, `score_c`, `score_d` (nullable integers)
- Added penalty detail fields: `misses`, `procedurals` (nullable integers)
- Added `is_disqualified` (nullable boolean) for stage-level DQ tracking

#### Documentation & Configuration

- Created `README.md` and `ARCHITECTURE.md`
- Added documentation templates: `CHANGELOG.md` and `RELEASE_NOTES.md`
- Added `suggestions.md` for future enhancements
- Updated `.gitignore` and IDE configuration (`.idea/`)
- Removed `db-forest-config.xml`

#### Migration Guide

**For new environments:** Use `scripts/table_create.sql`

**For existing environments:** Apply `scripts/table_alter.sql` against databases based on the `main` branch
schema

**Post-migration validation:**

- Verify expected join tables exist
- Confirm removed tables are not referenced by downstream queries/jobs
- Validate `match` table data is refreshed as intended

#### Known Considerations

- `.idea/` changes are environment-specific; confirm whether your workflow expects these files to be tracked

#### Changes by

@tahoni
