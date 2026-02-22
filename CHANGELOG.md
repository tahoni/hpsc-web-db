# Changelog

All notable changes to the HPSC Database project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## Table of Contents

- [Unreleased](#unreleased)
- [2.0.0](#200---2026-02-23)
- [1.1.0](#110---2026-01-28)
- [1.0.0](#100---2025-12-28)

---

## [Unreleased]

### Planned

- Views for leaderboards (per match, per division/category, per competitor history)
- Stored procedures for computing match totals and populating log tables
- Seed/demo data scripts for local development
- Additional indexing optimisations for common query patterns

---

## [2.0.0] - 2026-02-23

### Added

- **Database Schema**: New `date_refreshed` column to `ipsc_match` table for tracking data synchronisation
  (2026-02-14)
- **Database Schema**: New `date_refreshed` column to `match_competitor` table for tracking record updates
  (2026-02-15)
- **Database Schema**: New `date_refreshed` column to `match_stage_competitor` table for tracking score
  refreshes (2026-02-15)
- **Documentation**: CHANGELOG.md for structured version tracking following Keep a Changelog format
- **Documentation**: RELEASE_NOTES.md template aligned with modern documentation practices
- **Documentation**: HISTORY.md with comprehensive release history and narrative descriptions for each version
- **Documentation**: Versioned release notes (v2.0.0, v1.1.0, v1.0.0) in `documentation/history/` directory

### Changed

- **SQL Scripts**: Consolidated schema modification scripts in `table_alter.sql` with chronological date
  markers
- **SQL Scripts**: Enhanced `schema.sql` with proper user and schema creation for development and production
- **SQL Scripts**: Updated `table_data.sql` with corrected club names for seed data
- **Licence**: Changed LICENCE.md from proprietary "All Rights Reserved" to MIT Licence for open source
  distribution
- **Documentation**: Enhanced SUGGESTIONS.md with additional guidance on change management
- **Documentation**: Improved README.md structure and content organisation

### Removed

- **Database Schema**: `club_name` column from `ipsc_match` table to enforce referential integrity
  (2026-02-21)
- **Database Schema**: `club_name` column from `match_competitor` table to reduce data duplication
  (2026-02-21)

### Fixed

- Data consistency issues by removing denormalized `club_name` columns
- SQL script formatting and dialect consistency across all scripts

### Breaking Changes

- ⚠️ **Removed `ipsc_match.club_name` column** - Applications must now use `club_id` foreign key relationship
- ⚠️ **Removed `match_competitor.club_name` column** - Applications must retrieve club information via JOIN
  operations
- **Migration Required**: Update all queries to use JOIN operations for club information retrieval

### Migration Notes

```sql
-- Migration for version 2.0.0

-- Step 1: Add date_refreshed columns (2026-02-14, 2026-02-15)
ALTER TABLE ipsc_match
    ADD COLUMN date_refreshed DATETIME NULL;
ALTER TABLE match_competitor
    ADD COLUMN date_refreshed DATETIME NULL;
ALTER TABLE match_stage_competitor
    ADD COLUMN date_refreshed DATETIME NULL;

-- Step 2: Remove redundant club_name columns (2026-02-21)
ALTER TABLE ipsc_match
    DROP COLUMN club_name;
ALTER TABLE match_competitor
    DROP COLUMN club_name;
```

### Deprecated

- Direct storage of `club_name` in result tables (removed in this version)

---

## [1.1.0] - 2026-01-28

### Added

- **Database Schema**: Initial schema creation with core domain tables
- **Database Schema**: Participation and scoring tables for match results
- **Database Schema**: Foreign key constraints for referential integrity
- **Documentation**: Comprehensive `ARCHITECTURE.md` with design principles
- **Documentation**: Enhanced `README.md` with project overview and quick start guide
- **SQL Scripts**: `table_create.sql` with complete table definitions
- **SQL Scripts**: `schema.sql` for database and user setup
- **SQL Scripts**: `table_data.sql` with initial seed data for clubs

### Changed

- Improved table naming conventions for clarity
- Enhanced foreign key relationships for better data integrity

---

## [1.0.0] - 2025-12-28

### Added

- **Initial Release**: HPSC Database project initialization
- **Database Schema**: Core tables for clubs, competitors, matches, and stages
- **Database Schema**: Result tracking tables for match and stage performance
- **Database Schema**: Logging tables for derived standings
- **Documentation**: Initial `README.md` with project description
- **Documentation**: `LICENCE.md` with copyright information
- **Documentation**: `suggestions.md` with improvement roadmap
- **SQL Scripts**: Basic schema creation scripts
- **Repository**: Git repository initialisation with `.gitignore` configuration

### Technical Details

- **Database**: MySQL 8.x with InnoDB storage engine
- **Character Set**: utf8mb4 with `utf8mb4_0900_ai_ci` collation
- **Architecture**: Database-first design with normalised relational schema

---

## Version Comparison Links

- 2.0.0 vs 1.1.0: `git log v1.1.0...v2.0.0`
- 1.1.0 vs 1.0.0: `git log v1.0.0...v1.1.0`

---

## Contributing

When adding new versions to this changelog:

1. Add a new section under [Unreleased](#unreleased) with the format: `## [X.Y.Z] - YYYY-MM-DD`
2. Move relevant items from the Unreleased section to the new version
3. Organize changes under appropriate categories:
    - **Added** – New features or functionality
    - **Changed** – Changes to existing functionality
    - **Deprecated** – Features marked for removal in future versions
    - **Removed** – Features removed in this version
    - **Fixed** - Bug fixes
    - **Security** – Security vulnerability fixes
    - **Breaking Changes** – Changes that break backward compatibility
    - **Migration Notes** – SQL or code changes required for upgrading
4. Update the Table of Contents with the new version
5. Add version comparison links at the bottom

---

## Semantic Versioning Guide

- **Major version (X.0.0)**: Breaking changes, incompatible API/schema changes
- **Minor version (0.X.0)**: New features, backward-compatible additions
- **Patch version (0.0.X)**: Bug fixes, backward-compatible fixes

---

## Additional Resources

- [Release Notes](RELEASE_NOTES.md) – Detailed release information for version 2.0.0
- [Architecture Documentation](ARCHITECTURE.md) – Database architecture and design principles
- [Project Overview](README.md) – Getting started and project introduction
- [Improvement Suggestions](documentation/roadmap/SUGGESTIONS.md) - Future enhancements and roadmap

---

**Maintainer**: Leoni Lubbinge (leonil@tahoni.info)

