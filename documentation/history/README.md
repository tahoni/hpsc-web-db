# Release History & Documentation

📚 Complete historical archive and documentation of all HPSC Database releases.

---

## 📌 Table of Contents

- [📌 Overview](#-overview)
- [🧭 Quick Navigation](#-quick-navigation)
    - [✅ Current Release](#-current-release)
    - [🗂️ Previous Releases](#-previous-releases)
- [📚 Comprehensive References](#-comprehensive-references)
    - [🧾 Project History & Evolution](#-project-history--evolution)
    - [🗃️ Complete Release Notes Archive](#-complete-release-notes-archive)
- [🧱 File Organization](#-file-organization)
    - [📁 Directory Layout](#-directory-layout)
- [🧑‍💻 How to Use This Documentation](#-how-to-use-this-documentation)
    - [🔄 For Users Upgrading Between Versions](#-for-users-upgrading-between-versions)
    - [👋 For New Team Members](#-for-new-team-members)
- [📊 Version Summary Table](#-version-summary-table)
- [⚠️ Breaking Changes Overview](#-breaking-changes-overview)
    - [🚨 Major Breaking Changes (Require Code Updates)](#-major-breaking-changes-require-code-updates)
    - [✅ Non-Breaking Releases](#-non-breaking-releases)
- [🔗 Related Documentation](#-related-documentation)
    - [🏠 Root Directory](#-root-directory)
    - [🗂️ Archive Directory](#-archive-directory)
- [📝 Document Metadata](#-document-metadata)

---

## 📌 Overview

This directory contains versioned release notes and supporting history documentation for the HPSC Database.
It complements the consolidated release notes in the repository root and the narrative history in
`HISTORY.md`.

---

## 🧭 Quick Navigation

### ✅ Current Release

- **[Version 2.0.0](./RELEASE_NOTES_v2.0.0.md)** - Schema Refinement & Data Integrity
    - **Release Date:** February 23, 2026
    - **Status:** Current/Stable
    - **Key Features:** Database normalisation, temporal tracking, documentation standards

### 🗂️ Previous Releases

- **[Version 1.1.0](./RELEASE_NOTES_v1.1.0.md)** - Enhanced Schema & Documentation (Jan 28, 2026)
- **[Version 1.0.0](./RELEASE_NOTES_v1.0.0.md)** - Initial Release (Dec 28, 2025)

---

## 📚 Comprehensive References

### 🧾 Project History & Evolution

- **[HISTORY.md](../../HISTORY.md)** - Comprehensive project history
    - Release themes and objectives
    - Narrative context for major changes
    - Version strategy and timeline

### 🗃️ Complete Release Notes Archive

- **[RELEASE_NOTES_HISTORY.md](./RELEASE_NOTES_HISTORY.md)** - Versioned release notes directory index
    - Available versions list
    - Link to consolidated release notes

---

## 🧱 File Organization

### 📁 Directory Layout

```
documentation/history/
├── README.md                          ← You are here
├── RELEASE_NOTES_HISTORY.md           (Versioned release notes index)
├── RELEASE_NOTES_v2.0.0.md            (Current release)
├── RELEASE_NOTES_v1.1.0.md
└── RELEASE_NOTES_v1.0.0.md
```

---

## 🧑‍💻 How to Use This Documentation

### 🔄 For Users Upgrading Between Versions

1. **Check for breaking changes:**
    - Review the target version file (e.g., `RELEASE_NOTES_v2.0.0.md`)
    - Look for the **Breaking Changes** section
    - Read the migration guidance in the root release notes

2. **Understand new features:**
    - Review the **What's New** section
    - Cross-check the consolidated `RELEASE_NOTES.md`

3. **Plan your upgrade:**
    - Follow any schema migration steps
    - Validate data integrity after applying changes

### 👋 For New Team Members

1. **Start with project overview:**
    - Read `../../README.md` for schema introduction and workflows
    - Review `HISTORY.md` for release context

2. **Learn the release structure:**
    - Use `RELEASE_NOTES_HISTORY.md` as the index
    - Open the latest versioned release notes

3. **Understand current state:**
    - Read `RELEASE_NOTES_v2.0.0.md`
    - Check the root `RELEASE_NOTES.md` for consolidated guidance

---

## 📊 Version Summary Table

| Version   | Date         | Theme                              | Status | Breaking Changes |
|-----------|--------------|------------------------------------|--------|------------------|
| **2.0.0** | Feb 23, 2026 | Schema Refinement & Data Integrity | Stable | ⚠️ Yes           |
| **1.1.0** | Jan 28, 2026 | Enhanced Schema & Documentation    | Stable | ✅ None           |
| **1.0.0** | Dec 28, 2025 | Initial Release                    | Legacy | N/A              |

---

## ⚠️ Breaking Changes Overview

### 🚨 Major Breaking Changes (Require Code Updates)

- **v2.0.0** - Removed redundant `club` columns and enforced `club_id` JOINs

### ✅ Non-Breaking Releases

- **v1.1.0, v1.0.0** - Backward compatible schema additions and baseline setup

---

## 🔗 Related Documentation

### 🏠 Root Directory

- **[../../README.md](../../README.md)** - Project overview
- **[../../ARCHITECTURE.md](../../ARCHITECTURE.md)** - System architecture
- **[../../RELEASE_NOTES.md](../../RELEASE_NOTES.md)** - Current release notes
- **[../../CHANGELOG.md](../../CHANGELOG.md)** - Technical changelog

### 🗂️ Archive Directory

- **[../archive/ARCHIVE.md](../archive/ARCHIVE.md)** - Legacy release archive (non-SemVer history)

---

## 📝 Document Metadata

- **Created:** February 24, 2026
- **Last Updated:** February 24, 2026
- **Coverage:** v1.0.0 - v2.0.0 (3 releases)
- **Total Files:** 4 documentation files

---

**Last Updated:** February 24, 2026
