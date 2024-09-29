-- court 
CREATE TABLE court ( 
	court_id INT AUTO_INCREMENT PRIMARY KEY, 
	court_name VARCHAR(255) NOT NULL, 
	surface_type VARCHAR(50) NOT NULL, 
	availability_status BOOLEAN NOT NULL 
	-- Availability status: true if available, false otherwise 
);

-- member
CREATE TABLE member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    join_date DATE NOT NULL,
    skill_level VARCHAR(50) NOT NULL,
    membership_type VARCHAR(50) NOT NULL
    -- If theres time at the end, consider an ENUM for 'Annual', 'Quarterly', 'Monthly', 'Weekly'.
);

-- coach
CREATE TABLE coach (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255),
    certifications VARCHAR(255) NULL
    -- If theres time at the end, consider an ENUM for roles like 'Technique Coach', 'Fitness Coach', etc.
    -- If theres time at the end, consider an ENUM for certifications etc
);

-- event
CREATE TABLE event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    coach_id INT,
    FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
    -- If theres time at the end, consider an ENUM for Event types like be 'Tournament', 'Training', 'Friendly'.
    
);

-- match_record
CREATE TABLE match_record (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    court_id INT NOT NULL,
    player1_id INT NOT NULL,
    player2_id INT NOT NULL,
    match_type VARCHAR(50) NOT NULL,
    winner INT, -- matching the winners id
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (court_id) REFERENCES court(court_id),
    FOREIGN KEY (player1_id) REFERENCES member(member_id),
    FOREIGN KEY (player2_id) REFERENCES member(member_id)
    -- If theres time at the end, consider an ENUM for matchtypes including 'Singles', 'Doubles', 'Mixed Doubles', etc.
);

-- registration
CREATE TABLE registration (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    event_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    payment_details VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id)
    -- If theres time at the end, consider an ENUM for  Status including 'Registered', 'Pending', 'Cancelled'.
);

-- match_organiser
CREATE TABLE match_organiser (
    member_id INT NOT NULL,
    match_id INT NOT NULL,
    PRIMARY KEY (member_id, match_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id),
    FOREIGN KEY (match_id) REFERENCES match_record(match_id)
);