DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
\c todo_app;
CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp,
  completed boolean NOT NULL DEFAULT false
);
-- removing column called "completed"
ALTER TABLE tasks 
DROP COLUMN IF EXISTS completed; 

-- adding column called "completed_at"
ALTER TABLE tasks
ADD COLUMN completed_at timestamp;

--chnge the updated_at column to not allow NULL values, default value of now()
UPDATE tasks
SET updated_at = NOT NULL DEFAULT now();
    

--create new task by setting values (not defining which columns) id = default value
INSERT INTO tasks (id, title, description, created_at, updated_at, completed)
VALUES 
    (default value, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

--create a new task
INSERT INTO tasks (title, description)
VALUES 
    ('Study PostgreSQL', 'Read all the documentation');

--select all title sof tasks that are not yet completed
SELECT title
FROM tasks
WHERE completed_at = NULL;

--update the task with the title of "study SQL" to be completed as of now
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

-- select all titles and dsecriptions of tasks that are not yet completed
SELECT title, description
FROM tasks
WHERE completed_at = NULL;

--select all field sof every task sorted by creation date in descending order
SELECT *
FROM tasks
ORDER BY created_at DESC;

--create a new task
INSERT INTO tasks (title, description)
VALUES 
    ('mistake 1', 'a test entry'),
    ('mistake 2', 'another test entry'),
    ('third mistake', 'another test entry');

--select title fields of all tasks with a title that includes the work mistake
SELECT *
FROM tasks
WHERE title LIKE '%mistake%';

--delete the task that has a title of mistake 1
DELETE FROM tasks
WHERE title = 'mistake 1';

--select title and desc fields of all tasks that includes the word mistake
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

--delete all tasks that includes the word mistake in the title
DELETE FROM tasks WHERE title LIKE '%mistake%';

--select all fields of all tasks sorted by title in asecnding order
SELECT * FROM tasks ORDER BY title ASC;

