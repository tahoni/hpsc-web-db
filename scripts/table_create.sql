#---------------------------------------------------------------------------------------------------
# 2026-02-10
#---------------------------------------------------------------------------------------------------

-- Club table
CREATE TABLE club
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255) NOT NULL UNIQUE,
    abbreviation VARCHAR(255)
);

-- Competitor table
CREATE TABLE competitor
(
    id                          BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name                  VARCHAR(255) NOT NULL,
    last_name                   VARCHAR(255) NOT NULL,
    middle_names                VARCHAR(255),
    date_of_birth               DATE,
    sapsa_number                INT,
    competitor_number           VARCHAR(255) NOT NULL,
    default_competitor_category VARCHAR(50)
);

-- Match table
CREATE TABLE `match`
(
    id                 BIGINT PRIMARY KEY AUTO_INCREMENT,
    club_id            BIGINT       NOT NULL,
    name               VARCHAR(255) NOT NULL UNIQUE,
    scheduled_date     DATE         NOT NULL,
    club_name          VARCHAR(50),
    match_firearm_type VARCHAR(50),
    match_category     VARCHAR(50),
    date_created       DATETIME     NOT NULL,
    date_updated       DATETIME,
    date_edited        DATETIME,
    FOREIGN KEY (club_id) REFERENCES club (id)
);

-- MatchStage table
CREATE TABLE match_stage
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
    FOREIGN KEY (match_id) REFERENCES `match` (id)
);

-- MatchCompetitor table
CREATE TABLE match_competitor
(
    id                  BIGINT PRIMARY KEY AUTO_INCREMENT,
    competitor_id       BIGINT   NOT NULL,
    match_id            BIGINT   NOT NULL,
    club                VARCHAR(50),
    firearm_type        VARCHAR(50),
    division            VARCHAR(50),
    power_factor        VARCHAR(50),
    match_points        DECIMAL(19, 2),
    match_ranking       DECIMAL(19, 2),
    competitor_category VARCHAR(50),
    date_created        DATETIME NOT NULL,
    date_updated        DATETIME,
    date_edited         DATETIME,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (match_id) REFERENCES `match` (id)
);

-- MatchStageCompetitor table
CREATE TABLE match_stage_competitor
(
    id                   BIGINT PRIMARY KEY AUTO_INCREMENT,
    competitor_id        BIGINT   NOT NULL,
    match_stage_id       BIGINT   NOT NULL,
    firearm_type         VARCHAR(50),
    division             VARCHAR(50),
    power_factor         VARCHAR(50),
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
    competitor_category  VARCHAR(50),
    date_created         DATETIME NOT NULL,
    date_updated         DATETIME,
    date_edited          DATETIME,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (match_stage_id) REFERENCES match_stage (id)
);

-- Junction tables for lazy-loaded collections
CREATE TABLE club_matches
(
    club_id    BIGINT NOT NULL,
    matches_id BIGINT NOT NULL,
    FOREIGN KEY (club_id) REFERENCES club (id),
    FOREIGN KEY (matches_id) REFERENCES `match` (id)
);

CREATE TABLE competitor_competitor_matches
(
    competitor_id         BIGINT NOT NULL,
    competitor_matches_id BIGINT NOT NULL,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (competitor_matches_id) REFERENCES match_competitor (id)
);

CREATE TABLE competitor_competitor_stage_matches
(
    competitor_id               BIGINT NOT NULL,
    competitor_stage_matches_id BIGINT NOT NULL,
    FOREIGN KEY (competitor_id) REFERENCES competitor (id),
    FOREIGN KEY (competitor_stage_matches_id) REFERENCES match_stage_competitor (id)
);

CREATE TABLE match_match_stages
(
    match_id        BIGINT NOT NULL,
    match_stages_id BIGINT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES `match` (id),
    FOREIGN KEY (match_stages_id) REFERENCES match_stage (id)
);

CREATE TABLE match_match_competitors
(
    match_id             BIGINT NOT NULL,
    match_competitors_id BIGINT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES `match` (id),
    FOREIGN KEY (match_competitors_id) REFERENCES match_competitor (id)
);

CREATE TABLE match_stage_match_stage_competitors
(
    match_stage_id             BIGINT NOT NULL,
    match_stage_competitors_id BIGINT NOT NULL,
    FOREIGN KEY (match_stage_id) REFERENCES match_stage (id),
    FOREIGN KEY (match_stage_competitors_id) REFERENCES match_stage_competitor (id)
);
