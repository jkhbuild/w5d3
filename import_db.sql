
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users TEXT NOT NULL,
    questions TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_question TEXT NOT NULL,
    parent TEXT,
    users TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
    
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    users TEXT NOT NULL,
    questions TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users(id, first_name, last_name)
VALUES
    (1,'kunju', 'kim');

INSERT INTO
    questions(id,title, body,user_id)
VALUES
    (1,'orm?', 'How do you do this????!',1);

