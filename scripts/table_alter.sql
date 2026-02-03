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

# Match Stage
alter table match_stage
    add column stage_name varchar(255) null;


#---------------------------------------------------------------------------------------------------
# 2026-02-03
#---------------------------------------------------------------------------------------------------

# Match Stage competitor
alter table match_stage_competitor
    add column has_deduction int null;
alter table match_stage_competitor
    add column deduction_percentage decimal(10, 2) null;
alter table match_stage_competitor
    add column date_updated datetime null;

# Match Competitor
alter table match_competitor
    add column date_updated datetime null;

# Match
alter table `match`
    add column date_created datetime null;
alter table `match`
    add column date_updated datetime null;
