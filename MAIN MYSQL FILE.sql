CREATE TABLE parent (
    Parent_id INT not null,
    primary key(Parent_id),
    parent_Fname VARCHAR(50),
    parent_Lname VARCHAR(50),
    Parent_contact_num VARCHAR(15),
    Address_id INT,
    FOREIGN KEY (Address_id) REFERENCES address(address_id));

INSERT INTO parent (Parent_id, parent_Fname, parent_Lname, Parent_contact_num, Address_id)
VALUES
(1, 'John', 'Doe', '1234567890', 1),
(2, 'Jane', 'Smith', '9876543210', 2),
(3, 'Michael', 'Johnson', '5555555555', 3),
(4, 'Emily', 'Williams', '3333333333', 4),
(5, 'David', 'Brown', '4444444444', 5);

CREATE TABLE student (
    Student_id INT not null,
    primary key(student_id),
    student_Fname VARCHAR(50),
    student_Lname VARCHAR(50),
    student_class VARCHAR(20),
    student_extracurr TEXT,
    student_med_info TEXT,
    Student_aca_perf TEXT,
    Parent_id INT,
    School_id INT,
    Class_id INT,
    Address_id INT,
    FOREIGN KEY (Parent_id) REFERENCES parent(Parent_id),
    FOREIGN KEY (School_id) REFERENCES school(School_id),
    FOREIGN KEY (Class_id) REFERENCES class(Class_id),
    FOREIGN KEY (Address_id) REFERENCES address(address_id)
);

INSERT INTO student (Student_id, student_Fname, student_Lname, student_class, student_extracurr, student_med_info, Student_aca_perf, Parent_id, School_id, Class_id, Address_id)
VALUES
(1, 'Alice', 'Doe', 'Grade 9', 'Sports Club', 'None', 'A+', 1, 1, 1, 1),
(2, 'Bob', 'Smith', 'Grade 10', 'Chess Club', 'Asthma', 'B+', 2, 1, 2, 2),
(3, 'Ella', 'Johnson', 'Grade 8', 'Art Club', 'Allergic to nuts', 'A', 3, 2, 3, 3),
(4, 'Tom', 'Williams', 'Grade 11', 'Music Band', 'None', 'A-', 4, 2, 4, 4),
(5, 'Sophia', 'Brown', 'Grade 7', 'Drama Club', 'None', 'B', 5, 3, 5, 5);

CREATE TABLE teacher (
    Teacher_id INT not null,
 Primary key (Teacher_id ),
    teacher_Fname VARCHAR(50),
    teacher_Lname VARCHAR(50),
    teacher_position VARCHAR(50),
    teacher_prof_bio TEXT,
    teacher_email VARCHAR(100),
    Teacher_ph_no VARCHAR(15),
    School_id INT,
    Class_id INT,
    Bus_id INT,
    FOREIGN KEY (School_id) REFERENCES school(School_id),
    FOREIGN KEY (Class_id) REFERENCES class(Class_id),
    FOREIGN KEY (Bus_id) REFERENCES bus(bus_id)
);

INSERT INTO teacher (Teacher_id, teacher_Fname, teacher_Lname, teacher_position, teacher_prof_bio, teacher_email, Teacher_ph_no, School_id, Class_id, Bus_id)
VALUES
(1, 'Mr.', 'Anderson', 'Math Teacher', 'Experienced math teacher with a passion for learning.', 'mr.anderson@school.com', '123-456-7890', 1, 1, 1),
(2, 'Ms.', 'Taylor', 'English Teacher', 'Lover of literature and writing.', 'ms.taylor@school.com', '987-654-3210', 1, 2, 2),
(3, 'Mr.', 'Clark', 'Science Teacher', 'Enthusiastic about exploring the wonders of the universe.', 'mr.clark@school.com', '555-555-5555', 2, 3, 3),
(4, 'Ms.', 'Roberts', 'History Teacher', 'Bringing history to life with engaging lessons.', 'ms.roberts@school.com', '333-333-3333', 2, 4, 4),
(5, 'Mr.', 'Garcia', 'Art Teacher', 'Inspiring creativity and imagination.', 'mr.garcia@school.com', '444-444-4444', 3, 5, NULL);

CREATE TABLE student_teacher (
    Student_id INT not null,
    Teacher_id INT,
    Subject_name VARCHAR(50),
    PRIMARY KEY (Student_id),
    FOREIGN KEY (Student_id) REFERENCES student(Student_id),
    FOREIGN KEY (Teacher_id) REFERENCES teacher(Teacher_id)
);

INSERT INTO student_teacher (Student_id, Teacher_id, Subject_name)
VALUES
(1, 1, 'Math'),
(2, 2, 'English'),
(3, 3, 'Science'),
(4, 4, 'History'),
(5, 5, 'Art');

CREATE TABLE teacher_subject (
    Teacher_id INT,
    Subject_id INT not null,
    PRIMARY KEY (Teacher_id),
    FOREIGN KEY (Teacher_id) REFERENCES teacher(Teacher_id),
    FOREIGN KEY (Subject_id) REFERENCES subject(subject_id)
);

INSERT INTO teacher_subject (Teacher_id, Subject_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

CREATE TABLE school (
    School_id INT not null,
PRIMARY KEY(School_id),
    school_name VARCHAR(100),
    school_email VARCHAR(100),
    school_contact_num VARCHAR(15)
);

INSERT INTO school (School_id, school_name, school_email, school_contact_num)
VALUES
(1, 'Oakridge High School', 'info@oakridge.com', '111-111-1111'),
(2, 'Maple Leaf Academy', 'info@mapleleaf.com', '222-222-2222'),
(3, 'Pine Crest Elementary', 'info@pinecrest.com', '333-333-3333');


CREATE TABLE subject (
    subject_id INT not null,
   Primary key(subject_id),
    subject_name VARCHAR(50),
    subject_credits INT
);

INSERT INTO subject (Subject_id, subject_name, subject_credits)
VALUES
(1, 'Math', 4),
(2, 'English', 3),
(3, 'Science', 3),
(4, 'History', 3),
(5, 'Art', 2);


CREATE TABLE syllabus (
    syllabus_id INT not null,
    Primary key(syllabus_id),
    unit_num INT,
    chapter_name VARCHAR(100),
    Weightage DECIMAL(5,2),
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

INSERT INTO syllabus (syllabus_id, unit_num, chapter_name, Weightage, subject_id)
VALUES
(1, 1, 'Algebra', 0.2, 1),
(2, 1, 'Literature', 0.3, 2),
(3, 1, 'Chemical Reactions', 0.25, 3),
(4, 1, 'Ancient Civilizations', 0.3, 4),
(5, 1, 'Drawing Basics', 0.2, 5);

CREATE TABLE class (
    Class_id INT not null,
 PRIMARY KEY(class_id),
    class_division VARCHAR(10),
    class_teacher INT,
    class_room VARCHAR(20)
);

INSERT INTO class (Class_id, class_division, class_teacher, class_room)
VALUES
(1, '9A', 1, 'Room 101'),
(2, '10B', 2, 'Room 202'),
(3, '8C', 3, 'Room 303'),
(4, '11D', 4, 'Room 404'),
(5, '7E', 5, 'Art Room');

CREATE TABLE event (
    Event_id INT not null,
PRIMARY KEY(event_id),
    event_name VARCHAR(100),
    event_organiser VARCHAR(50),
    event_description TEXT,
    event_date DATE,
    event_timing TIME,
    Event_venue VARCHAR(100),
    School_id INT,
    FOREIGN KEY (School_id) REFERENCES school(School_id)
);

INSERT INTO event (Event_id, event_name, event_organiser, event_description, event_date, event_timing, Event_venue, School_id)
VALUES
(1, 'Science Fair', 'School', 'Annual science fair showcasing student projects.', '2024-05-15', '10:00', 'School Hall', 1),
(2, 'Literary Evening', 'School', 'Celebration of literature with readings and performances.', '2024-06-20', '6:00', 'Library', 2),
(3, 'Art Exhibition', 'School', 'Display of student artwork from the semester.', '2024-07-10', '2:00', 'Art Room', 3),
(4, 'Parent-Teacher Meeting', 'Teacher', 'Scheduled parent-teacher meetings for progress updates.', '2024-04-25', '3:00', 'School Hall', 1),
(5, 'Math Quiz Competition', 'Teacher', 'Inter-class math quiz competition.', '2024-04-30', '11:00', 'Room 101', 1);

select * from event;
CREATE TABLE schedule (
    schedule_id INT not null,
PRIMARY KEY(schedule_id),
    from_till VARCHAR(50),
    subject_scheduled VARCHAR(50)
);

INSERT INTO schedule (schedule_id, from_till, subject_scheduled)
VALUES
(1, '9:00 AM - 10:30 AM', 'Math'),
(2, '10:45 AM - 12:15 PM', 'English'),
(3, '1:00 PM - 2:30 PM', 'Science'),
(4, '9:00 AM - 10:30 AM', 'History'),
(5, '10:45 AM - 12:15 PM', 'Art');


CREATE TABLE address (
    address_id INT not null,
PRIMARY KEY(address_id),
    building_name VARCHAR(50),
    sector_num VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    landmark VARCHAR(50)
);

INSERT INTO address (address_id, building_name, sector_num, city, state, pincode, landmark)
VALUES
(1, '123 Main St', 'Sector A', 'Cityville', 'State A', '12345', 'Near Park'),
(2, '456 Oak Ave', 'Sector B', 'Townville', 'State B', '54321', 'Opposite Library'),
(3, '789 Maple Rd', 'Sector C', 'Villagetown', 'State C', '67890', 'Next to School'),
(4, '101 Pine Lane', 'Sector D', 'Forest City', 'State D', '98765', 'By River'),
(5, '111 Elm Street', 'Sector E', 'Gardenvale', 'State E', '45678', 'Corner Store');


CREATE TABLE bus (
    bus_id INT not null,
PRIMARY KEY(bus_id),
    bus_driver_contact VARCHAR(15),
    Route_id INT,
    FOREIGN KEY (Route_id) REFERENCES route(route_id)
);

INSERT INTO bus (bus_id, bus_driver_contact, Route_id)
VALUES
(1, '111-222-3333', 1),
(2, '444-555-6666', 2),
(3, '777-888-9999', 3),
(4, '123-456-7890', 4),
(5, '987-654-3210', 5);


CREATE TABLE route (
    route_id INT not null,
 PRIMARY KEY(route_id),
    route_name VARCHAR(100),
    sector_num VARCHAR(20),
    Address_id INT,
    FOREIGN KEY (Address_id) REFERENCES address(address_id)
);

INSERT INTO route (route_id, route_name, sector_num, Address_id)
VALUES
(1, 'School Route 1', 'Sector A - B', 1),
(2, 'School Route 2', 'Sector C - D', 2),
(3, 'School Route 3', 'Sector E - F', 3),
(4, 'School Route 4', 'Sector G - H', 4),
(5, 'School Route 5', 'Sector I - J', 5);

CREATE TABLE Event_attendees (
    Event_id INT not null,
Primary key(Event_id),
    Parent_id INT,
    Teacher_id INT,
    Role VARCHAR(50),
    FOREIGN KEY (Event_id) REFERENCES event(Event_id),
    FOREIGN KEY (Parent_id) REFERENCES parent(Parent_id),
    FOREIGN KEY (Teacher_id) REFERENCES teacher(Teacher_id)
);

INSERT INTO Event_attendees (Event_id, Parent_id, Teacher_id, Role)
VALUES
(1, 1, NULL, 'Parent'),
(2, NULL, 1, 'Teacher'),
(3, NULL, 5, 'Teacher'),
(4, 3, 3, 'Both'),
(5, NULL, 1, 'Teacher');

CREATE TABLE Schedule_of (
    Schedule_id INT not null,
Primary key(Schedule_id),
    Event_id INT,
    Class_id INT,
    Teacher_id INT,
    FOREIGN KEY (Event_id) REFERENCES event(Event_id),
    FOREIGN KEY (Class_id) REFERENCES class(Class_id),
    FOREIGN KEY (Teacher_id) REFERENCES teacher(Teacher_id)
);

INSERT INTO Schedule_of (Schedule_id, Event_id, Class_id, Teacher_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 1);

CREATE TABLE Parent_Student (
    Student_id INT not null,
    Parent_id INT not null,
    FOREIGN KEY (Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY (Parent_id) REFERENCES Parent(Parent_id),
    PRIMARY KEY (Student_id, Parent_id)  /* Composite Primary Key */
);

INSERT INTO Parent_Student (Parent_id, Student_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

CREATE TABLE Teacher_Assignment (
    Teacher_id INT not null,
    School_id INT not null,
    Bus_id INT,
    FOREIGN KEY (Teacher_id) REFERENCES Teacher(Teacher_id),
    FOREIGN KEY (School_id) REFERENCES school(School_id),
    FOREIGN KEY (Bus_id) REFERENCES bus(bus_id),
    PRIMARY KEY (Teacher_id, School_id)  /* Composite Primary Key */
);

INSERT INTO Teacher_Assignment (Teacher_id, School_id, Bus_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, NULL);

CREATE TABLE Student_Attendance (
    Event_id INT,
    Student_id INT,
    PRIMARY KEY (Event_id, Student_id),
    FOREIGN KEY (Event_id) REFERENCES Event(Event_id),
    FOREIGN KEY (Student_id) REFERENCES Student(Student_id)
);

-- Assuming Student participates in an event
INSERT INTO Student_Attendance (Event_id, Student_id)
VALUES (102, 1);


-- 1. Parent Can View Student's Information:
-- Assuming Parent ID 1 wants to view their student's information
SELECT s.Student_id, s.student_Fname, s.student_Lname, s.student_class, s.student_extracurr, s.student_med_info, s.Student_aca_perf
FROM Student s
INNER JOIN Parent_Student ps ON s.Student_id = ps.Student_id
INNER JOIN Parent p ON ps.Parent_id = p.Parent_id
WHERE p.Parent_id = 1; 

-- 2. Teacher Can View Student's Information:
-- Assuming Teacher ID 1 wants to view their student's information
SELECT s.Student_id, s.student_Fname, s.student_Lname, s.student_class, s.student_extracurr, s.student_med_info, s.Student_aca_perf
FROM Student s
INNER JOIN student_teacher st ON s.Student_id = st.Student_id
INNER JOIN Teacher t ON st.Teacher_id = t.Teacher_id
WHERE t.Teacher_id = 1; 

-- 3. Student in Class Can View Its Schedule:
-- Assuming Student ID 1 wants to view their schedule
SELECT sch.from_till, sch.subject_scheduled
FROM Schedule sch
INNER JOIN Schedule_of so ON sch.schedule_id = so.Schedule_id
INNER JOIN Class c ON so.Class_id = c.Class_id
WHERE c.class_id = 2; 

-- 4. Teacher Can View Their Schedule:
-- Assuming Teacher ID 1 wants to view their schedule
SELECT sch.from_till, sch.subject_scheduled
FROM Schedule sch
INNER JOIN Schedule_of so ON sch.schedule_id = so.Schedule_id
INNER JOIN Teacher t ON so.Teacher_id = t.Teacher_id
WHERE t.Teacher_id = 1; 

-- 5. Parent Can Schedule a Parent-Teacher Meeting:
-- Assuming the 'Event' table is used for Parent-Teacher meetings
INSERT INTO Event (Event_id, event_name, event_organiser, event_description, event_date, event_timing, Event_venue, School_id)
VALUES (1000, 'Parent-Teacher Meeting', 'Parent', 'Scheduled parent-teacher meeting', '2024-04-25', '15:00:00', 'School Hall', 1);

INSERT INTO Event_attendees (Event_id, Parent_id, Role)
VALUES (1000, 1, 'Parent');

select * from Event_attendees;
select * from Event;
-- 6. Teacher Can Schedule a Parent-Teacher Meeting:
-- Assuming the 'Event' table is used for Parent-Teacher meetings
INSERT INTO Event (event_id, event_name, event_organiser, event_description, event_date, event_timing, Event_venue, School_id)
VALUES (2090,'Parent-Teacher Meeting', 'Teacher', 'Scheduled parent-teacher meeting', '2024-04-25', '15:00:00', 'School Hall', 1);

-- Assuming Teacher attends the meeting
INSERT INTO Event_attendees (Event_id, Teacher_id, Role)
VALUES (2090, (SELECT Teacher_id FROM teacher WHERE Teacher_id = 1), 'Teacher');

-- Inserting events with specified Event_id values
INSERT INTO Event (Event_id, event_name, event_organiser, event_description, event_date, event_timing, Event_venue, School_id)
VALUES (100, 'Parent Event', 'Parent', 'Parent event description', '2024-04-26', '16:00:00', 'School Hall', 1),
       (101, 'Teacher Event', 'Teacher', 'Teacher event description', '2024-04-27', '17:00:00', 'Library', 2),
       (102, 'Student Event', 'Student', 'Student event description', '2024-04-28', '18:00:00', 'Art Room', 3);

-- 7. Parent, Teacher, and Student Can Participate in Events:
-- Assuming Parent participates in an event
INSERT INTO Event_attendees (Event_id, Parent_id, Role)
VALUES (100, 1, 'Attendee');

-- Assuming Teacher participates in an event
INSERT INTO Event_attendees (Event_id, Teacher_id, Role)
VALUES (101, 1, 'Attendee');


