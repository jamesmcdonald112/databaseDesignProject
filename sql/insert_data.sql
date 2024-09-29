-- court
INSERT INTO court (court_name, surface_type, availability_status) VALUES
('Court 1', 'Clay', TRUE),
('Court 2', 'Grass', TRUE);

-- member
INSERT INTO member (name, phone, email, join_date, skill_level, membership_type) VALUES
('Ciara Murphy', '353-85-2345678', 'ciara.murphy@example.com', '2015-01-10', 'Advanced', 'Annual'),
('Eoin Doyle', '353-85-3546789', 'eoin.doyle@example.com', '2024-09-15', 'Beginner', 'Monthly');

-- coach
INSERT INTO coach (name, specialty, certifications) VALUES
('James Murphy ', 'Technique', 'Level 3'),
('Aoife Keoghan', 'Strength Training', 'Level 2');

-- event
INSERT INTO event (event_name, event_type, date, time, location, coach_id) VALUES
('Summer Tournament', 'Tournament', '2024-07-20', '09:00:00', 'Court 1', 1),
('Beginner Training', 'Training', '2024-04-19', '12:00:00', 'Court 2', 2);

-- match_record
INSERT INTO match_record (event_id, court_id, player1_id, player2_id, match_type, winner) VALUES
(1, 1, 1, 2, 'Singles', 1),
(1, 1, 1, 2, 'Doubles', 2);

-- registration
INSERT INTO registration (member_id, event_id, date, status, payment_details) VALUES
(1, 1, '2023-05-01', 'Registered', 'Debit Card'),
(2, 1, '2023-05-01', 'Cancelled', 'Revolut');

-- match_organiser
INSERT INTO match_organiser (member_id, match_id) VALUES
(1, 1),
(2, 2);
