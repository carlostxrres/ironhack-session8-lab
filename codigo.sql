-- 1. Crear la base de datos

CREATE DATABASE TikTokDB;
USE DATABASE TikTokDB;

-- 2. Crear las tablas

CREATE TABLE Users (
    user_id VARCHAR(36) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    country_of_origin VARCHAR(50) NOT NULL
);

CREATE TABLE Videos (
    video_id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    publish_date DATETIME NOT NULL,
    duration_in_seconds INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Comments (
    comment_id VARCHAR(36) PRIMARY KEY,
    video_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date DATETIME NOT NULL,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id VARCHAR(36) PRIMARY KEY,
    video_id VARCHAR(36) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    like_date DATETIME NOT NULL,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Followers (
    follower_id VARCHAR(36) PRIMARY KEY,
    following_user_id VARCHAR(36) NOT NULL,
    followed_user_id VARCHAR(36) NOT NULL,
    follow_start_date DATE NOT NULL,
    FOREIGN KEY (following_user_id) REFERENCES Users(user_id),
    FOREIGN KEY (followed_user_id) REFERENCES Users(user_id)
);

-- 3. Insertar datos de ejemplo

INSERT INTO Users (user_id, username, email, registration_date, country_of_origin) VALUES
('22a46745-71c0-556a-857a-3f13e82f6b90', 'pepita', 'pepita@gmail.com', '2024-01-27', 'spain'),
('5c91eefa-3ab6-5e99-936c-853250e23519', 'josemari', 'josemari@gmail.com', '2024-04-26', 'france'),
('c8a0530e-337c-5bad-9940-6dd12e2fb6e1', 'adelaida', 'adelaida@gmail.com', '2024-05-15', 'portugal');

INSERT INTO Videos (video_id, user_id, title, description, publish_date, duration_in_seconds) VALUES
('0f305bbe-8682-5a28-8d9b-ae053ebea792', '22a46745-71c0-556a-857a-3f13e82f6b90', 'Qué pasa, colegas', 'Mi primer vídeo', '2024-09-25 15:04:54', 123),
('c28d747f-f0dc-5c9f-9d7b-6dc47400cfbf', '5c91eefa-3ab6-5e99-936c-853250e23519', 'Visitando la muralla china', 'De vacaciones', '2024-08-29 23:00:15', 296),
('fd2a8035-8504-5a0c-b35d-673c40ff774b', '22a46745-71c0-556a-857a-3f13e82f6b90', 'Mi perrita Luna', 'Pero mira cómo se echa la siesta', '2024-01-06 01:29:40', 181);

INSERT INTO Comments (comment_id, video_id, user_id, comment_text, comment_date) VALUES
('7f64c38f-257c-5fdc-a8e1-cfe49fc98846', '0f305bbe-8682-5a28-8d9b-ae053ebea792', '5c91eefa-3ab6-5e99-936c-853250e23519', 'que pasaaa', '2024-03-01 07:04:52'),
('e647617c-09a4-5943-9284-567543891a26', '0f305bbe-8682-5a28-8d9b-ae053ebea792', 'c8a0530e-337c-5bad-9940-6dd12e2fb6e1', 'hombre, por fin te haces tiktok', '2024-06-07 08:50:19'),
('5ed79079-dd39-5d6a-8668-724167c22bc1', 'c28d747f-f0dc-5c9f-9d7b-6dc47400cfbf', '22a46745-71c0-556a-857a-3f13e82f6b90', 'Cómo mola la muralla china, ojalá ir un día', '2024-10-27 04:18:57');

INSERT INTO Likes (like_id, video_id, user_id, like_date) VALUES
('3bd994ff-2b71-5dcd-9830-39390b1f5e93', '0f305bbe-8682-5a28-8d9b-ae053ebea792', '5c91eefa-3ab6-5e99-936c-853250e23519', '2024-05-04 02:11:40'),
('9c9cbba2-68a1-54cf-9369-a07f052ced43', '0f305bbe-8682-5a28-8d9b-ae053ebea792', 'c8a0530e-337c-5bad-9940-6dd12e2fb6e1', '2024-06-27 06:30:31'),
('47f30fcd-39a5-5dd1-b5cf-806692c7b2db', 'c28d747f-f0dc-5c9f-9d7b-6dc47400cfbf', '22a46745-71c0-556a-857a-3f13e82f6b90', '2024-10-19 07:04:14');

INSERT INTO Followers (follower_id, following_user_id, followed_user_id, follow_start_date) VALUES
('594ae253-4a1f-56fb-a8af-267a2a61a35c', '5c91eefa-3ab6-5e99-936c-853250e23519', '22a46745-71c0-556a-857a-3f13e82f6b90', '2024-07-20'),
('fc749439-54ea-5cec-bb98-b08ef44bc3fd', 'c8a0530e-337c-5bad-9940-6dd12e2fb6e1', '22a46745-71c0-556a-857a-3f13e82f6b90', '2024-03-28'),
('b5aaefd1-209d-5d37-9999-eb111528a5a4', '22a46745-71c0-556a-857a-3f13e82f6b90', '5c91eefa-3ab6-5e99-936c-853250e23519', '2024-07-15');

-- 4. Consultar los datos

SELECT * FROM Users; -- Ver todos los usuarios de TikTok
SELECT * FROM Videos; -- Ver todos los videos publicados
SELECT * FROM Comments; -- Ver los comentarios realizados en los videos
SELECT * FROM Likes; -- Ver todos los likes dados a los videos
SELECT * FROM Followers; -- Ver las relaciones de seguimiento entre los usuarios