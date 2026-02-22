#---------------------------------------------------------------------------------------------------
# 2026-02-14
#---------------------------------------------------------------------------------------------------

ALTER TABLE ipsc_match
    ADD COLUMN date_refreshed DATETIME NULL;

#---------------------------------------------------------------------------------------------------
# 2026-02-15
#---------------------------------------------------------------------------------------------------

ALTER TABLE match_competitor
    ADD COLUMN date_refreshed DATETIME NULL;

ALTER TABLE match_stage_competitor
    ADD COLUMN date_refreshed DATETIME NULL;


#---------------------------------------------------------------------------------------------------
# 2026-02-18
#---------------------------------------------------------------------------------------------------
ALTER TABLE club
    ADD COLUMN date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

#---------------------------------------------------------------------------------------------------
# 2026-02-21
#---------------------------------------------------------------------------------------------------

ALTER TABLE ipsc_match
    DROP COLUMN club_name;

ALTER TABLE match_competitor
    DROP COLUMN club_name;
