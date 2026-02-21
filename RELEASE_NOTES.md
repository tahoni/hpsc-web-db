# HPSC Database

## Release Notes

### Version 2.0.0 - _2026-02-21_

Major database schema enhancements focusing on improved data synchronisation tracking and normalisation.

#### Breaking Changes

- `club_name` column removed from `ipsc_match` table
- `club_name` column removed from `match_competitor` table

#### New Features

Introduced `date_refreshed` timestamp tracking across core match tables for enhanced data synchronization
monitoring:

- `ipsc_match` table
- `match_competitor` table
- `match_stage_competitor` table

#### Improvements

Removed `club_name` denormalization from `ipsc_match` and `match_competitor` tables to reduce data redundancy
and improve maintainability.

#### Schema Changes

- Added `date_refreshed` DATETIME column to `ipsc_match`, `match_competitor`, and `match_stage_competitor`
  tables
- Removed `club_name` column from `ipsc_match` and `match_competitor` tables

#### Migration Notes

- **2026-02-14**: Initial refresh date tracking implementation for match data
- **2026-02-15**: Extended refresh tracking to competitor relationship tables
- **2026-02-21**: Completed database normalization by removing redundant club name fields

#### Tests and Quality Assurance

Schema changes validated across all dependent queries and stored procedures.

#### Contributors

@tahoni
