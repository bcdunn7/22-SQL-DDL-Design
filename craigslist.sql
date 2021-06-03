DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) NOT NULL,
    password VARCHAR(20) NOT NULL,
    pref_region INT NOT NULL REFERENCES region(id) ON DELETE SET NULL
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category VARCHAR(20) NOT NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_post INT NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    location TEXT NOT NULL,
    region INT NOT NULL REFERENCES region(id) ON DELETE SET NULL
);

CREATE TABLE post_category (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES post(id) ON DELETE CASCADE,
    category_id INT NOT NULL REFERENCES category(id) ON DELETE CASCADE
);