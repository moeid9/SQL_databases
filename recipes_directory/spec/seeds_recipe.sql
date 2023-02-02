-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipe RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipe (name, cooking_time, rating) VALUES ('Ramen', 5, 8);
INSERT INTO recipe (name, cooking_time, rating) VALUES ('Sushi', 30, 9);

