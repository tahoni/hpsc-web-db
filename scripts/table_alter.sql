#---------------------------------------------------------------------------------------------------
# 2026-01-28
#---------------------------------------------------------------------------------------------------

# Competitor
alter table competitor
    modify column sapsa_number varchar(255) null;
alter table competitor
    add column place int null;

# Match Competitor
alter table match_competitor
    add column is_disqualified boolean null;
alter table match_competitor
    add column place int null;

# Match Stage Competitor
alter table match_stage_competitor
    add column score_a int null;
alter table match_stage_competitor
    add column score_b int null;
alter table match_stage_competitor
    add column score_c int null;
alter table match_stage_competitor
    add column score_d int null;

alter table match_stage_competitor
    add column misses int null;
alter table match_stage_competitor
    add column procedurals int null;

alter table match_stage_competitor
    add column is_disqualified boolean null;

#---------------------------------------------------------------------------------------------------
# 2026-02-01
#---------------------------------------------------------------------------------------------------

# Match
alter table `match`
    modify column club_id int null;

#---------------------------------------------------------------------------------------------------
# 2026-02-02
#---------------------------------------------------------------------------------------------------

# Stage
alter table match_stage
    add column stage_name varchar(255) null;
