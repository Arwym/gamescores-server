# Game Scores Server web app

## Overview

This application serves an API to read and store game scores for different games. A simple front-end web interface displays the scores table for each game.

### MVP
At this moment, we will focus on developing an API with two calls:

#### api/scores POST
Parameters:
- gameId: numeric
- score: numeric
- playerName: alphanumeric

#### api/scores/{gameId:numeric}/
Fetch all scores for specified game ID.

#### api/challenges/{gameId:numeric}
Fetch all challenges for specified game ID.

## Database Schema

Table: scores
id,
game_id,
player_name,
post_timestamp,
update_timestamp

Table: games
id,
title,
code,
description,
levels,
creation_timestamp,
update_timestamp

Table: game_challenge
id,
game_id,
challenge,
level