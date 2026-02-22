# Release Notes

## Version 2.0.0

**Release Date:** February 22, 2026  
**Branch:** develop → main

---

## Overview

This release introduces significant database schema improvements, enhanced SQL script organisation, and
documentation template updates for the HPSC Database. The changes focus on better data tracking capabilities,
improved referential integrity, and streamlined schema management.

---

## What's New

### Database Schema Enhancements

#### New Columns Added

- **`date_refreshed`**: Added to `ipsc_match`, `match_competitor`, and `match_stage_competitor` tables to
  track when records were last refreshed from external sources (2026-02-14, 2026-02-15)

#### Schema Refinements

- **Removed redundant `club_name` columns**: Eliminated from `ipsc_match` and `match_competitor` tables to
  reduce data duplication and enforce proper use of foreign key relationships to the `club` table (2026-02-21)

### SQL Script Organization

#### Improved Script Structure

- **`table_alter.sql`**: Consolidated schema modification scripts with clear date markers for change tracking
- **`table_create.sql`**: Maintained comprehensive table creation scripts with proper foreign key constraints
- **`table_data.sql`**: Updated seed data with corrected club names
- **`schema.sql`**: Enhanced with proper user and schema creation for both development and production
  environments

### Documentation Improvements

#### New Documentation Templates

- **CHANGELOG.md**: Introduced a structured changelog format following Keep a Changelog standards for version
  tracking and documentation
- **RELEASE_NOTES.md**: Established standardised release notes format aligned with modern documentation
  practices
- **HISTORY.md**: Added comprehensive release history with narrative descriptions for each version
- **Versioned Release Notes**: Created historical release notes (v2.0.0, v1.1.0, v1.0.0) in
  `documentation/history/` directory

#### Updated Documentation

- **LICENCE.md**: Changed from proprietary "All Rights Reserved" to MIT Licence for open source distribution
- **README.md**: Maintained comprehensive project overview with table of contents and quick start guides
- **ARCHITECTURE.md**: Preserved detailed architectural documentation with MySQL-specific considerations
- **SUGGESTIONS.md**: Enhanced improvement suggestions with additional guidance on change management

---

## Breaking Changes

### Schema Changes

⚠️ **Removed Columns**

- `ipsc_match.club_name` - Use `club_id` foreign key relationship instead
- `match_competitor.club_name` - Use `match_id` → `club_id` relationship instead

**Migration Path:**
Applications should now retrieve club information via proper JOIN operations:

```sql
-- Old approach (no longer supported):
SELECT club_name
FROM ipsc_match;

-- New approach:
SELECT c.name, c.abbreviation
FROM ipsc_match m
         JOIN club c ON m.club_id = c.id;
```

---

## Bug Fixes

- Fixed data consistency issues by removing denormalised `club_name` columns
- Corrected SQL script formatting and dialect consistency

---

## Improvements

### Data Integrity

- Enhanced referential integrity by enforcing club relationships through foreign keys only
- Added temporal tracking capabilities with `date_refreshed` columns
- Improved audit trail for data synchronisation operations

### Code Quality

- Organised schema change scripts with chronological date markers
- Improved SQL script readability and maintainability
- Added proper documentation for schema evolution

### Developer Experience

- Clearer separation between development and production schemas
- Better structured SQL migration files
- Enhanced documentation templates for future releases
- **MIT Licence adoption**: Transitioned to open source licensing for wider community adoption
- **Organised documentation structure**: Established `documentation/history/` directory for versioned release
  notes
- **Comprehensive version history**: Created CHANGELOG.md and HISTORY.md for better version tracking

---

## Technical Details

### Database Changes

#### Tables Modified

- `ipsc_match`: Added `date_refreshed`, removed `club_name`
- `match_competitor`: Added `date_refreshed`, removed `club_name`
- `match_stage_competitor`: Added `date_refreshed`

#### Schema Scripts Updated

- `scripts/schema.sql`: Database and user creation with proper permissions
- `scripts/table_create.sql`: Core table definitions with foreign key constraints
- `scripts/table_alter.sql`: Chronological schema modifications
- `scripts/table_data.sql`: Updated seed data for clubs

### Dependencies

**Database Requirements:**

- MySQL 8.x
- InnoDB storage engine
- utf8mb4 character set
- utf8mb4_0900_ai_ci collation

---

## Upgrade Guide

### For New Installations

1. Run `scripts/schema.sql` to create databases and users
2. Run `scripts/table_create.sql` to create all tables
3. Run `scripts/table_data.sql` to insert initial seed data

### For Existing Installations

1. **Backup your database** before applying changes
2. Update application code to remove references to `club_name` columns
3. Run the following migration scripts in order:
   ```sql
   -- Add date_refreshed columns (2026-02-14, 2026-02-15)
   ALTER TABLE ipsc_match ADD COLUMN date_refreshed DATETIME NULL;
   ALTER TABLE match_competitor ADD COLUMN date_refreshed DATETIME NULL;
   ALTER TABLE match_stage_competitor ADD COLUMN date_refreshed DATETIME NULL;
   
   -- Remove redundant club_name columns (2026-02-21)
   ALTER TABLE ipsc_match DROP COLUMN club_name;
   ALTER TABLE match_competitor DROP COLUMN club_name;
   ```
4. Update application queries to use JOIN operations for club information
5. Test all functionality thoroughly

---

## Known Issues

None at this time.

---

## Deprecations

- Direct storage of `club_name` in `ipsc_match` and `match_competitor` tables (removed)

---

## Contributors

**Leoni Lubbinge** - Database architecture and implementation

---

## Additional Resources

- [Architecture Documentation](../../ARCHITECTURE.md) - Detailed database architecture, design principles, and
  technical requirements
- [Project Overview & Quick Start Guide](../../README.md) – Introduction to the HPSC Database with schema
  entities, conventions, and typical workflows
- [Improvement Suggestions](../roadmap/SUGGESTIONS.md) - Future enhancements, indexing strategies, and change
  management best practices

---

## Feedback

For questions, issues, or suggestions, please contact:

- **Email**: leonil@tahoni.info
- **GitHub**: [@tahoni](https://github.com/tahoni)

---

**Full Changelog**: v1.1.0 vs v2.0.0 `git log v1.1.0..v2.0.0`

