# Game Scores Server web app

## Overview

This application serves an API to read and store game scores for different games. A simple front-end web interface displays the scores table for each game.

### MVP
At this moment, we will focus on developing an API with three main calls:

#### api/scores POST
Post a new game score.

Parameters:
- game_id: numeric
- score: numeric
- player_name: alphanumeric

#### api/scores/{game_id:numeric}(/{limit:numeric}) GET
Fetch all scores for specified game ID.

#### api/challenges/{game_id:numeric} GET
Fetch all challenges for specified game ID.

## Database Schema

Table: scores
score_id,
game_id,
player_name,
post_timestamp,
update_timestamp

Table: games
game_id,
title,
code,
description,
levels,
creation_timestamp,
update_timestamp

Table: challenges
challenge_id,
game_id,
challenge,
level,
group