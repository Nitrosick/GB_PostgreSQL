-- Игровая платформа Steam

-- Основная сущность базы данных - Игра. Она будут иметь следующие характеристики:
-- 1. Название
-- 2. Описание
-- 3. Цена
-- 4. Жанр (ссылка на таблицу жанров)
-- 5. Принадлежность бандлу (ссылка на таблицу бандлов)
-- 6. Дата выхода
-- 7. Издатель

-- Жанры игр:
-- 1. Название

-- Бандлы (наборы):
-- 1. Название
-- 2. Цена за набор

-- Игровые трейлеры и ролики:
-- 1. id игры
-- 2. Ссылка
-- 3. Размер файла

-- Сущность Пользователь:
-- 1. Логин
-- 2. Отображаемое имя
-- 3. Пароль

-- Профиль пользователя:
-- 1. E-mail
-- 2. Денежный баланс
-- 3. Уровень
-- 4. Регион (ссылка на таблицу регионов)
-- 5. Ссылка на аватар

-- Регионы:
-- 1. Название

-- Купленные игры (связь между таблицами пользователей и играми):
-- 1. id пользователя
-- 2. id игры

-- Список желаемого (связь между таблицами пользователей и играми):
-- 1. id пользователя
-- 2. id игры

-- Оценки (связь между таблицами пользователей и играми):
-- 1. id пользователя
-- 2. id игры
-- 3. Оценка

-- Отзывы (связь между таблицами пользователей и играми):
-- 1. id игры
-- 2. id пользователя
-- 3. Отзыв

-- Task 1
CREATE DATABASE steam;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE bandles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    price INT NOT NULL
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    price INT NOT NULL,
    genre_id INT,
    bandle_id INT,
    release_date TIMESTAMP,
    publisher VARCHAR(100) NOT NULL,

    FOREIGN KEY (genre_id) REFERENCES genres(id)
    ON DELETE SET NULL,
    FOREIGN KEY (bandle_id) REFERENCES bandles(id)
    ON DELETE SET NULL
);

CREATE TABLE video (
    id SERIAL PRIMARY KEY,
    game_id INT,
    url VARCHAR(250) NOT NULL UNIQUE,
    size BIGINT NOT NULL,

    FOREIGN KEY (game_id) REFERENCES games(id)
    ON DELETE CASCADE
);

CREATE TABLE profiles (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    balance BIGINT NOT NULL DEFAULT 0,
    level INT NOT NULL DEFAULT 1,
    region_id INT,
    avatar_url VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE SET NULL,
    FOREIGN KEY (region_id) REFERENCES regions(id)
    ON DELETE SET NULL
);

CREATE TABLE purchases (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    PRIMARY KEY (user_id, game_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
    ON DELETE CASCADE
);

CREATE TABLE wishlist (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    PRIMARY KEY (user_id, game_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
    ON DELETE CASCADE
);

CREATE TABLE grades (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    grade INT NOT NULL,
    PRIMARY KEY (user_id, game_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
    ON DELETE CASCADE
);

CREATE TABLE reviews (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    review TEXT NOT NULL,
    PRIMARY KEY (user_id, game_id),

    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
    ON DELETE CASCADE
);

-- Task 5
SELECT
	g.name,
	g.description,
	(SELECT gr.name FROM genres gr WHERE g.genre_id = gr.id) AS genre
	-- Correlating subquery
FROM games g
WHERE g.id IN (SELECT game_id FROM purchases);
-- Non correlating subquery

SELECT
	u.login,
	u.name,
	u.password_hash,
	(SELECT p.email FROM profiles p WHERE p.user_id = u.id) AS email,
	(SELECT p.level FROM profiles p WHERE p.user_id = u.id) AS level,
	(SELECT p.avatar_url FROM profiles p WHERE p.user_id = u.id) AS avatar
    -- Correlating subqueries
FROM users u
WHERE u.name LIKE 'C%';

-- Task 6
SELECT
	u.name,
	COUNT(g.grade) OVER (PARTITION BY u.id) AS grades_count
FROM users u
JOIN grades g ON g.user_id = u.id
ORDER BY grades_count DESC
LIMIT 10;

WITH games_by_genres AS (
	SELECT
		COUNT(*) AS games_count,
		gr.name AS genre
	FROM games g
	JOIN genres gr ON gr.id = g.genre_id
	GROUP BY gr.name
)
SELECT
	AVG(games_count) AS avg_by_genres
FROM games_by_genres;

-- Task 7
CREATE VIEW users_wishes AS (
	SELECT
		u.login,
		u.name,
		g.name AS game
	FROM users u
	LEFT JOIN wishlist w ON w.user_id = u.id
	JOIN games g ON g.id = w.game_id
);

CREATE VIEW avg_videos AS (
	SELECT
		g.name AS game,
		v.url,
		v.size
	FROM video v
	JOIN games g ON g.id = v.game_id
	WHERE v.size > 200000
	AND v.size < 300000
	ORDER BY v.size
);

-- Task 8
CREATE FUNCTION user_most_games()
RETURNS INTEGER AS
$$
	WITH leader AS (
		SELECT
			u.id,
			COUNT(*) AS cnt
		FROM users u
		JOIN purchases p ON p.user_id = u.id
		GROUP BY u.id
		ORDER BY COUNT(*) DESC
		LIMIT 1
	)
	SELECT id FROM leader;
$$
LANGUAGE SQL;

SELECT user_most_games();

-- Task 9
CREATE OR REPLACE FUNCTION check_insert_grade()
RETURNS TRIGGER AS
  $$
    BEGIN
      IF NEW.grade < 1 OR NEW.grade > 5
	  THEN
        RAISE EXCEPTION '% is incorrect value. The grade must be between 1 and 5!', NEW.grade;
	  ELSE
	  	RETURN NEW;
      END IF;
    END
  $$
LANGUAGE PLPGSQL;

CREATE TRIGGER check_grade_on_insert BEFORE INSERT ON grades
  FOR EACH ROW
  EXECUTE FUNCTION check_insert_grade();

CREATE TRIGGER check_grade_on_update BEFORE UPDATE ON grades
  FOR EACH ROW
  EXECUTE FUNCTION check_insert_grade();

UPDATE grades SET grade = 6 WHERE user_id = 4;

-- Task 10
"QUERY PLAN"
"Limit  (cost=13.76..13.78 rows=10 width=18) (actual time=0.123..0.125 rows=10 loops=1)"
"  ->  Sort  (cost=13.76..14.01 rows=100 width=18) (actual time=0.123..0.124 rows=10 loops=1)"
"        Sort Key: (count(g.grade) OVER (?)) DESC"
"        Sort Method: top-N heapsort  Memory: 26kB"
"        ->  WindowAgg  (cost=9.85..11.60 rows=100 width=18) (actual time=0.070..0.109 rows=100 loops=1)"
"              ->  Sort  (cost=9.85..10.10 rows=100 width=14) (actual time=0.065..0.069 rows=100 loops=1)"
"                    Sort Key: u.id"
"                    Sort Method: quicksort  Memory: 30kB"
"                    ->  Hash Join  (cost=4.25..6.52 rows=100 width=14) (actual time=0.030..0.048 rows=100 loops=1)"
"                          Hash Cond: (g.user_id = u.id)"
"                          ->  Seq Scan on grades g  (cost=0.00..2.00 rows=100 width=8) (actual time=0.004..0.008 rows=100 loops=1)"
"                          ->  Hash  (cost=3.00..3.00 rows=100 width=10) (actual time=0.022..0.022 rows=100 loops=1)"
"                                Buckets: 1024  Batches: 1  Memory Usage: 13kB"
"                                ->  Seq Scan on users u  (cost=0.00..3.00 rows=100 width=10) (actual time=0.002..0.010 rows=100 loops=1)"
"Planning Time: 0.159 ms"
"Execution Time: 0.150 ms"

SELECT
	u.name,
	COUNT(*) AS grades_count
FROM users u
JOIN grades g ON g.user_id = u.id
GROUP BY g.user_id, u.name
ORDER BY COUNT(*) DESC
LIMIT 10;

"QUERY PLAN"
"Limit  (cost=10.43..10.46 rows=10 width=18) (actual time=0.088..0.090 rows=10 loops=1)"
"  ->  Sort  (cost=10.43..10.68 rows=100 width=18) (actual time=0.088..0.089 rows=10 loops=1)"
"        Sort Key: (count(*)) DESC"
"        Sort Method: top-N heapsort  Memory: 26kB"
"        ->  HashAggregate  (cost=7.27..8.27 rows=100 width=18) (actual time=0.070..0.076 rows=66 loops=1)"
"              Group Key: g.user_id, u.name"
"              ->  Hash Join  (cost=4.25..6.52 rows=100 width=10) (actual time=0.031..0.048 rows=100 loops=1)"
"                    Hash Cond: (g.user_id = u.id)"
"                    ->  Seq Scan on grades g  (cost=0.00..2.00 rows=100 width=4) (actual time=0.005..0.009 rows=100 loops=1)"
"                    ->  Hash  (cost=3.00..3.00 rows=100 width=10) (actual time=0.022..0.022 rows=100 loops=1)"
"                          Buckets: 1024  Batches: 1  Memory Usage: 13kB"
"                          ->  Seq Scan on users u  (cost=0.00..3.00 rows=100 width=10) (actual time=0.003..0.010 rows=100 loops=1)"
"Planning Time: 0.151 ms"
"Execution Time: 0.117 ms"
