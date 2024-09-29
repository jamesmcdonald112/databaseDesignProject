-- READ DATA

-- All members and their membership types
SELECT name, membership_type FROM member;

-- Upcoming events, with the date and the coach running them
SELECT e.event_name, e.date, c.name AS coach_name
FROM event e
JOIN coach c ON e.coach_id = c.coach_id;

-- UPDATE DATA

-- COACH

-- Adding a new coach to update
INSERT INTO coach (name, specialty, certifications) VALUES ('Mary Walsh', 'Top Spin', 'Level 1');

-- Update coach certification
UPDATE coach
SET certifications = 'Level 2'
WHERE name = 'Mary Walsh';

-- View Changed Data
SELECT name, certifications FROM coach
WHERE name = 'Mary Walsh';

-- EVENT

-- Add a new event to update it
INSERT INTO event (event_name, event_type, date, time, location, coach_id) VALUES
('Winter Tournament', 'Tournament', '2024-10-12', '10:00:00', 'Court 1', 2);

-- Update event time
UPDATE event
SET time = '10:00:00'
WHERE event_name = 'Winter Tournament';

-- View changed event
SELECT event_name, time FROM event
WHERE event_name = 'Winter Tournament';

-- DELETE DATA

-- Add data to delete
INSERT INTO member (name, phone, email, join_date, skill_level, membership_type) VALUES
('James McDonald', '353-85-7653781', 'james.mcdonald@example.com', '2020-09-30', 'Beginner', 'Annual');

-- View new member
SELECT * FROM member
WHERE name = 'James McDonald' AND email = 'james.mcdonald@example.com';

-- Delete New Member
DELETE FROM member
WHERE name = 'James McDonald' AND email = 'james.mcdonald@example.com';

