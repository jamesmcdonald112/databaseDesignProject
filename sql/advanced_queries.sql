-- SUB QUERY
-- List of events led by coaches with a specialty in 'Technique'

SELECT 
    e.event_name,
    c.name AS CoachName
FROM 
    event e
JOIN 
    coach c ON e.coach_id = c.coach_id
WHERE 
    c.specialty = 'Technique';

-- VIEW

-- A View listing all coaches and their specalty and certifications

CREATE VIEW CoachData AS
SELECT 
    name,
    specialty,
    certifications
FROM 
    coach;

-- To see all data from the newly created view
SELECT * FROM CoachData;

-- JOIN

-- A join showing event details and the name of the coach
SELECT 
	e.event_name, 
	e.date, e.time, 
	c.name AS CoachName 
FROM event e 
INNER JOIN coach c ON e.coach_id = c.coach_id;

-- AGGREGATE FUNCTIONS
-- Total count of members
SELECT COUNT(*) AS TotalMembers FROM member;

-- CODD'S RULES

-- Rule 1: The Information Rule: Data can retrieved by matching identifiers; so in essence data is retrieved with out reference to the underlying file systems a simple SELECT statement explaining how a unique value was returned using a primary key.

-- Demonstration
SELECT name FROM coach WHERE coach_id = 1;


-- Rule 3: Systematic Treatment of Null Values: A example of table that has a NULL value associated with a number of columns execute a query against it and both data types where NULL appears should be treated the same.

-- Demonstration

-- Add new Coach
INSERT INTO coach (name, specialty, certifications) VALUES ('John Adams', 'Technique', NULL);

-- Query showing null value as "No Certifications"
SELECT name, specialty, IFNULL(certifications, 'No Certifications') AS certifications_status FROM coach;


-- Rule 6: The View Updating Rule: Views are based on underlying tables so build a view execute an UPDATE query against; note the value UPDATED. Run a SELECT query against the base table and you should see the new value.

-- Demonstration

-- Create a view for event data
CREATE VIEW event_view AS
SELECT event_id, event_name, date, time FROM event;

-- Update the view
UPDATE event_view SET time = '10:45:00' WHERE event_id = 1;

-- View the updated information using SELECT from the base table
SELECT event_id, event_name, time FROM event WHERE event_id = 1;