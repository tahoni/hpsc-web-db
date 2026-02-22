# Release History

This document provides a historical overview of all HPSC Database releases, with descriptions of the key
themes and objectives for each version.

---

## Table of Contents

- [Version 2.0.0 - Schema Refinement & Data Integrity](#version-200---schema-refinement--data-integrity)
- [Version 1.1.0 - Enhanced Schema & Documentation](#version-110---enhanced-schema--documentation)
- [Version 1.0.0 - Initial Release](#version-100---initial-release)

---

## Version 2.0.0 - Schema Refinement & Data Integrity

**Released:** February 22, 2026  
**Type:** Major Release (Breaking Changes)

### Release Theme

This major release focuses on **database normalization** and **temporal data tracking**, introducing breaking
changes to improve long-term maintainability and data integrity. The primary goal was to eliminate data
redundancy and add synchronization tracking capabilities.

### Key Objectives

1. **Enforce Referential Integrity**: Remove denormalized data columns and enforce proper foreign key
   relationships
2. **Add Temporal Tracking**: Introduce timestamp tracking for data synchronization and refresh operations
3. **Improve Schema Management**: Establish better documentation practices and migration patterns
4. **Enhance Maintainability**: Organize SQL scripts with chronological markers for easier change tracking

### Why This Release Matters

Version 2.0.0 represents a significant architectural improvement in how the database maintains data
consistency. By removing redundant `club_name` columns from result tables and enforcing JOIN operations, the
schema now follows database normalization best practices more strictly. This prevents data inconsistencies
that could arise from duplicate club names stored across multiple tables.

The addition of `date_refreshed` columns enables better tracking of when data was last synchronized from
external sources, which is crucial for match scoring systems that may import results from external platforms
or devices.

### Major Changes

- **Breaking**: Removed `club_name` columns from `ipsc_match` and `match_competitor` tables
- **New**: Added `date_refreshed` tracking columns to match and result tables
- **Improved**: Consolidated schema modification scripts with clear date markers
- **Enhanced**: Documentation templates for changelog and release notes

### Impact

This release requires **database migration** and **application code updates** for existing installations. All
queries that previously accessed `club_name` directly must be updated to use JOIN operations with the `club`
table.

### Related Documentation

- [Full Release Notes](RELEASE_NOTES.md) - Complete details for version 2.0.0
- [Changelog Entry](CHANGELOG.md#200---2026-02-22) - Categorized list of all changes
- [Migration Guide](RELEASE_NOTES.md#upgrade-guide) - Step-by-step upgrade instructions

---

## Version 1.1.0 - Enhanced Schema & Documentation

**Released:** January 28, 2026  
**Type:** Minor Release (Feature Addition)

### Release Theme

This release focused on **schema maturity** and **comprehensive documentation**, establishing a solid
foundation for the HPSC Database with complete table definitions, foreign key constraints, and detailed
architectural documentation.

### Key Objectives

1. **Complete Schema Definition**: Finalize all core domain tables with proper relationships
2. **Establish Foreign Keys**: Implement referential integrity constraints across all tables
3. **Document Architecture**: Create comprehensive technical documentation
4. **Provide Quick Start**: Enable developers to quickly understand and deploy the database

### Why This Release Matters

Version 1.1.0 transformed the initial prototype into a production-ready database schema. The addition of
comprehensive documentation (ARCHITECTURE.md) and enhanced README provided developers with the context and
guidance needed to understand the database design principles and deployment procedures.

This release established the pattern of "database-first" design with a normalized relational schema, setting
the architectural direction for future enhancements.

### Major Changes

- **New**: Complete table definitions in `table_create.sql`
- **New**: Foreign key constraints for referential integrity
- **New**: Comprehensive architecture documentation
- **Improved**: Enhanced README with quick start guide
- **Added**: Schema creation and seed data scripts

### Impact

This release provided the foundation for production deployment, with all necessary scripts and documentation
for setting up new database instances.

### Related Documentation

- [Changelog Entry](CHANGELOG.md#110---2026-01-28) - Complete list of additions and changes
- [Architecture Documentation](ARCHITECTURE.md) - Database design principles and technical requirements

---

## Version 1.0.0 - Initial Release

**Released:** December 28, 2025  
**Type:** Major Release (Initial)

### Release Theme

The inaugural release of the HPSC Database, establishing the **foundational schema** for managing practical
shooting club data, including clubs, competitors, matches, stages, and results.

### Key Objectives

1. **Define Core Entities**: Establish the primary database tables for clubs, competitors, and matches
2. **Support Results Tracking**: Create tables for recording match and stage-level performance data
3. **Enable Standings Logs**: Implement logging tables for derived competitor standings
4. **Initialize Project**: Set up repository structure and basic documentation

### Why This Release Matters

Version 1.0.0 launched the HPSC Database project, providing the first working schema for practical shooting
match management. This release established the core data model that supports typical shooting club workflows:
registering clubs and competitors, creating matches with stages, recording participation, and tracking
stage-by-stage scoring.

The initial schema design prioritized flexibility and extensibility, with support for multiple divisions,
disciplines, power factors, and categories—all essential for IPSC-style shooting competitions.

### Major Changes

- **New**: Core domain tables (club, competitor, match, match_stage)
- **New**: Result tracking tables (match_competitor, match_stage_competitor)
- **New**: Logging tables for derived standings (log_match, log_matches)
- **New**: Basic schema creation scripts
- **New**: Initial project documentation and license

### Impact

This release provided the initial working database schema for the Hartbeespoortdam Practical Shooting Club,
enabling the club to begin tracking match results and competitor performance digitally.

### Related Documentation

- [Changelog Entry](CHANGELOG.md#100---2025-12-28) - Initial release details
- [README](README.md) - Project introduction and overview

---

## Release Versioning Strategy

The HPSC Database project follows [Semantic Versioning](https://semver.org/) (SemVer):

- **Major versions (X.0.0)**: Breaking changes, significant schema modifications requiring migration
- **Minor versions (0.X.0)**: New features, backward-compatible additions
- **Patch versions (0.0.X)**: Bug fixes, documentation updates, backward-compatible fixes

### Version History Timeline

```
v1.0.0 (2025-12-28) ─── Initial Release
   │
   └─> v1.1.0 (2026-01-28) ─── Schema Maturity
          │
          └─> v2.0.0 (2026-02-22) ─── Breaking Changes
                 │
                 └─> Future releases...
```

---

## Looking Forward

### Upcoming Enhancements

Future releases will focus on:

- **Query Optimization**: Views for leaderboards and competitor history
- **Automation**: Stored procedures for computing match aggregates
- **Developer Tools**: Additional seed data and demo scripts
- **Performance**: Indexing strategies for common query patterns

### Long-term Vision

The HPSC Database aims to become a comprehensive, production-ready database solution for practical shooting
clubs, supporting:

- Multi-club management and series tracking
- Historical performance analytics
- Integration with scoring devices and platforms
- Flexible reporting and leaderboard generation

---

## Additional Resources

- [Changelog](CHANGELOG.md) - Detailed, categorized list of changes for each version following Keep a
  Changelog format
- [Release Notes](RELEASE_NOTES.md) - Comprehensive release information for version 2.0.0 with upgrade guides
  and breaking changes
- [Architecture Documentation](ARCHITECTURE.md) - Detailed database architecture, design principles, and
  technical requirements
- [Project Overview & Quick Start Guide](README.md) - Introduction to the HPSC Database with schema entities,
  conventions, and typical workflows
- [Improvement Suggestions](documentation/roadmap/SUGGESTIONS.md) - Future enhancements, indexing strategies,
  and change management best practices

---

## Questions or Feedback?

For questions about release history, version strategy, or to provide feedback:

- **Maintainer**: Leoni Lubbinge
- **Email**: leonil@tahoni.info
- **GitHub**: [@tahoni](https://github.com/tahoni)

---

*Last Updated: February 22, 2026*

