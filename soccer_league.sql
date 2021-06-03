DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    team_id INT NOT NULL REFERENCES team(id) ON DELETE SET NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    season INT NOT NULL REFERENCES season(id) ON DELETE SET NULL,
    team_1 INT REFERENCES team(id) ON DELETE SET NULL,
    team_2 INT REFERENCES team(id) ON DELETE SET NULL,
    date DATE NOT NULL
);

CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL
);

CREATE TABLE game_referee (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL REFERENCES game(id) ON DELETE CASCADE,
    ref_id INT NOT NULL REFERENCES referee(id) ON DELETE CASCADE
);

CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL REFERENCES game(id) ON DELETE CASCADE,
    player_id INT NOT NULL REFERENCES player(id) ON DELETE CASCADE
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    game_id INT NOT NULL REFERENCES game(id) ON DELETE CASCADE,
    team_id INT NOT NULL REFERENCES team(id) ON DELETE CASCADE,
    result INT NOT NULL 
);

-- use int for result to differentiate between win, loss, and draw (as opposed to boolean); and less likely to be mistyped as text