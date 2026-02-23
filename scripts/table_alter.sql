#---------------------------------------------------------------------------------------------------
# 2026-02-14 - 2026-02-21
#---------------------------------------------------------------------------------------------------

-- Add date_refreshed columns (2026-02-14, 2026-02-15)
ALTER TABLE ipsc_match
    ADD COLUMN date_refreshed DATETIME NULL;
ALTER TABLE match_competitor
    ADD COLUMN date_refreshed DATETIME NULL;
ALTER TABLE match_stage_competitor
    ADD COLUMN date_refreshed DATETIME NULL;

-- Remove redundant club_name columns (2026-02-21)
ALTER TABLE ipsc_match
    DROP COLUMN club_name;
ALTER TABLE match_competitor
    DROP COLUMN club;

ALTER TABLE ipsc_match
    MODIFY COLUMN scheduled_date DATETIME NOT NULL;
