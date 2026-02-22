# Release Notes

## Version 1.0.0

**Release Date:** December 28, 2025  
**Branch:** Initial Release

---

## Overview

The inaugural release of the HPSC Database project, establishing the foundational schema for managing
practical shooting club data. This release provides the core data model for tracking clubs, competitors,
matches, stages, and results for the Hartbeespoortdam Practical Shooting Club and associated organizations.

---

## What's New

### Database Schema - Initial Release

#### Core Domain Tables

- **`club`**: Organization entity for managing shooting clubs
    - Club name and abbreviation
    - Timestamp tracking for record management

- **`competitor`**: Person/athlete entity for tracking competitors
    - Identity fields (first name, last name, middle names, date of birth)
    - Competitor number and optional SAPSA number
    - Default competitor category

- **`ipsc_match`**: Match event entity for scheduled competitions
    - Match name and scheduled date
    - Club association
    - Optional match firearm type and category
    - Edit tracking timestamps

- **`ipsc_match_stage`**: Stage definition within matches
    - Stage number and optional name
    - Range number for physical location tracking
    - Target counts (paper, popper, plates, disappear, penalty)
    - Scoring parameters (min rounds, max points)

#### Results and Performance Tables

- **`match_competitor`**: Competitor participation tracking
    - Links competitors to matches
    - Division, discipline, and power factor
    - Match-level results (points, ranking, percentage)
    - Competitor category for the match

- **`match_stage_competitor`**: Detailed stage-level scoring
    - Individual stage performance for each competitor
    - Scoring breakdown (A, C, D scores)
    - Penalties and procedurals
    - Time and hit factor calculation
    - Stage points and percentage
    - Disqualification tracking

#### Logging Tables

- **`log_match`**: Single match performance snapshots
- **`log_matches`**: Multi-match window performance tracking

### Project Infrastructure

#### Repository Setup

- Git repository initialization
- `.gitignore` configuration for JetBrains IDEs
- Project directory structure (scripts, documentation)

#### Documentation

- **README.md**: Initial project description and overview
- **LICENSE.md**: Copyright notice (All Rights Reserved)
- **suggestions.md**: Initial improvement suggestions and roadmap

#### SQL Scripts

- Basic schema creation scripts
- Initial table definitions
- Placeholder for seed data

---

## Features

### Supported Workflows

This initial release enables the following workflows:

1. **Club Management**: Register and manage shooting clubs
2. **Competitor Registration**: Track competitor identities and identifiers
3. **Match Creation**: Create matches and define stages for scheduled events
4. **Participation Tracking**: Record competitors participating in matches with their division/discipline
5. **Score Recording**: Capture detailed stage-by-stage scoring data
6. **Results Computation**: Store computed match totals and stage aggregates
7. **Leaderboard Snapshots**: Maintain historical leaderboard data in log tables

### Key Design Principles

- **Normalized Schema**: Proper entity separation with foreign key relationships
- **Flexibility**: Support for multiple divisions, disciplines, power factors, and categories
- **Audit Trail**: Timestamp tracking on all entities
- **Data Integrity**: Primary keys and basic constraints
- **Extensibility**: Designed for future enhancements and additional features

---

## Breaking Changes

Not applicable - this is the initial release.

---

## Technical Details

### Database Schema

#### Table Structure

**Primary Entities:** 4 tables

- club
- competitor
- ipsc_match
- ipsc_match_stage

**Results Entities:** 2 tables

- match_competitor
- match_stage_competitor

**Logging Entities:** 2 tables (structure defined for future use)

- log_match
- log_matches

**Join Tables:** 5 tables for managing relationships

#### Key Features

- **Primary Keys**: Auto-increment BIGINT on all tables
- **Timestamps**: Automatic `date_created` and `date_updated` tracking
- **Foreign Keys**: Basic relationships between core entities
- **Character Set**: UTF-8 support for international characters
- **Decimal Precision**: DECIMAL(19, 2) for scoring calculations

### Dependencies

**Database Requirements:**

- MySQL 8.x or compatible database engine
- InnoDB storage engine support
- UTF-8 character set support

### Technology Stack

- **Database**: MySQL 8.x
- **Storage Engine**: InnoDB
- **Character Set**: utf8mb4
- **Collation**: utf8mb4_0900_ai_ci

---

## Installation Guide

### Prerequisites

- MySQL 8.x installed and running
- Database client (DataGrip, MySQL Workbench, or CLI)
- Basic SQL knowledge

### Installation Steps

1. Clone the repository or download the release
2. Review the SQL scripts in the `scripts/` directory
3. Execute schema creation scripts in your MySQL instance
4. Verify table creation and relationships
5. Begin adding your club and competitor data

### Getting Started

1. **Create a Club**: Insert your shooting club into the `club` table
2. **Register Competitors**: Add competitor records with their identifiers
3. **Schedule a Match**: Create a match record linked to your club
4. **Define Stages**: Add stages for your match with target counts
5. **Record Participation**: Create match_competitor records for participants
6. **Enter Scores**: Record stage scores in match_stage_competitor

---

## Known Issues

- Join tables are present but not fully documented in initial release
- Log tables structure defined but aggregation procedures not yet implemented
- Some redundant columns present (club_name) that may be optimized in future releases

---

## Future Enhancements

Planned for upcoming releases:

- Views for leaderboards and competitor history
- Stored procedures for score aggregation
- Additional indexing for query optimization
- Enhanced documentation and examples
- Sample data sets for testing

---

## Contributors

**Leoni Lubbinge** - Database architecture and implementation

---

## Additional Resources

- [Project Overview & Quick Start Guide](../../README.md) - Introduction to the HPSC Database
- [Changelog](../../CHANGELOG.md) - Version history and changes

---

## Feedback

For questions, issues, or suggestions, please contact:

- **Email**: leonil@tahoni.info
- **GitHub**: [@tahoni](https://github.com/tahoni)

---

## Acknowledgments

This project was created to support the Hartbeespoortdam Practical Shooting Club (HPSC) in managing match
results and competitor performance tracking. Special thanks to the HPSC community for their input and
requirements gathering.

---

**Initial Release** - December 28, 2025

