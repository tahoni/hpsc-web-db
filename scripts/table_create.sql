#---------------------------------------------------------------------------------------------------
# 2026-02-1
#---------------------------------------------------------------------------------------------------

-- Club table
CREATE TABLE IF NOT EXISTS club
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255) NOT NULL UNIQUE,
    abbreviation VARCHAR(255)
);

-- IpscMatch table
CREATE TABLE IF NOT EXISTS ipsc_match
(
    id                 BIGINT PRIMARY KEY AUTO_INCREMENT,
    club_id            BIGINT       NULL,
    name               VARCHAR(255) NOT NULL UNIQUE,
    scheduled_date     DATE         NOT NULL,
    club_name          VARCHAR(255),
    match_firearm_type VARCHAR(255),
    match_category     VARCHAR(255),
    date_created       DATETIME     NOT NULL,
    date_updated       DATETIME,
    date_edited        DATETIME,
    FOREIGN KEY (club_id) REFERENCES club (id)
);

-- Competitor table
CREATE TABLE IF NOT EXISTS competitor
(
    id                          BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name                  VARCHAR(255) NOT NULL,
    last_name                   VARCHAR(255) NOT NULL,
    middle_names                VARCHAR(255),
    date_of_birth               DATE,
    sapsa_number                INT,
    competitor_number           VARCHAR(255) NOT NULL,
    default_competitor_category VARCHAR(255)
);

-- IpscMatchStage table
CREATE TABLE IF NOT EXISTS ipsc_match_stage
(
    id               BIGINT PRIMARY KEY AUTO_INCREMENT,
    match_id         BIGINT NOT NULL,
    stage_number     INT    NOT NULL,
    stage_name       VARCHAR(255),
    range_number     INT,
    target_paper     INT,
    target_popper    INT,
    target_plates    INT,
    target_disappear INT,
    target_penalty   INT,
    min_rounds       INT,
    max_points       INT,
    FOREIGN KEY (match_id) REFERENCES ipsc_match (id)
);

-- MatchCompetitor table
CREATE TABLE IF NOT EXISTS match_competitor
(
    id                  BIGINT PRIMARY KEY AUTO_INCREMENT,
    competitor_id       BIGINT   NOT NULL,
    match_id            BIGINT   NOT NULL,
    club                VARCHAR(255),
    firearm_type        VARCHAR(255),
    division            VARCHAR(255),
    power_factor        VARCHAR(255),
    match_points        DECIMAL(19, 2),
    match_ranking       DECIMAL(19, 2),
    competitor_category VARCHAR(255),
    date_created        DATETIME NOT NULL,
    date_updated        DATETIME,
    date_edited         DATETIME,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (match_id) REFERENCES ipsc_match (id)
);

-- MatchStageCompetitor table
CREATE TABLE IF NOT EXISTS match_stage_competitor
(
    id                   BIGINT PRIMARY KEY AUTO_INCREMENT,
    competitor_id        BIGINT   NOT NULL,
    match_stage_id       BIGINT   NOT NULL,
    firearm_type         VARCHAR(255),
    division             VARCHAR(255),
    power_factor         VARCHAR(255),
    score_a              INT,
    score_b              INT,
    score_c              INT,
    score_d              INT,
    points               INT,
    misses               INT,
    penalties            INT,
    procedurals          INT,
    has_deduction        BOOLEAN,
    deduction_percentage DECIMAL(19, 2),
    time                 DECIMAL(19, 2),
    hit_factor           DECIMAL(19, 2),
    stage_points         DECIMAL(19, 2),
    stage_percentage     DECIMAL(19, 2),
    stage_ranking        DECIMAL(19, 2),
    is_disqualified      BOOLEAN,
    competitor_category  VARCHAR(255),
    date_created         DATETIME NOT NULL,
    date_updated         DATETIME,
    date_edited          DATETIME,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (match_stage_id) REFERENCES ipsc_match_stage (id)
);
