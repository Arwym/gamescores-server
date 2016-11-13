# Game Scores Server web app

## Overview

This application serves an API to read and store game scores for different games. A simple front-end web interface displays the scores table for each game.

### MVP
At this moment, we will focus on developing an API with the following calls:

#### api/games/{game_id:numeric} GET
Fetch single game's data by its ID.

#### api/games/{limit:numeric}(/random) GET

#### api/scores POST
Post a new game score.

Parameters:
- game_id: numeric
- score: numeric
- player_name: alphanumeric
- meta: text

#### api/scores/{game_id:numeric}(/{limit:numeric}) GET
Fetch game scores.

#### api/challenges/{game_id:numeric}(/{limit:numeric})(/random) GET
Fetch game challenges.

## Database Schema

Table: scores
score_id,
game_id,
player_name,
meta,
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
group,
creation_timestamp,
update_timestamp