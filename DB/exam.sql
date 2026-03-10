-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 01:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `username` varchar(255) NOT NULL DEFAULT 'admin',
  `firstName` char(100) NOT NULL DEFAULT 'Admin',
  `lastName` char(100) NOT NULL DEFAULT 'Admin',
  `imageUrl` varchar(255) DEFAULT '/images/admin.png',
  `pw` varchar(255) NOT NULL DEFAULT '$2y$10$B9gGv1ohRO.KubkLY1gyGuwmc0.SNdBYMME8cYsuvVDpC6YdBwNny'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`username`, `firstName`, `lastName`, `imageUrl`, `pw`) VALUES
('admin', 'Admin', 'Admin', '/images/admin.png', '$2a$12$uNnXNXAQ0ui8HM10K7bt.eQQv1SP0FzKDb260EqwpJjU0oF1ZFEH2');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `courseTitle` varchar(255) NOT NULL,
  `courseCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseTitle`, `courseCode`) VALUES
(1, 'Electromagnetic Wave Theory', 'EEG 509'),
(2, 'Database Management', 'CPE 502'),
(3, 'Signals and Systems', 'EEG 203'),
(4, 'Computer Networking Fundamentals', 'CPE 510');

-- --------------------------------------------------------

--
-- Table structure for table `course_examiner`
--

CREATE TABLE `course_examiner` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_examiner`
--

INSERT INTO `course_examiner` (`id`, `username`, `courseId`) VALUES
(1, 'jane_osoba', 1),
(2, 'jane_osoba', 2),
(3, 'ayo_ph', 1),
(4, 'ayo_ph', 2),
(5, 'ayo_ph', 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_student`
--

CREATE TABLE `course_student` (
  `id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_student`
--

INSERT INTO `course_student` (`id`, `username`, `courseId`) VALUES
(1, '150408502', 1),
(2, '150408502', 2),
(3, '150408502', 3),
(4, '130408502', 2),
(5, '130408016', 2);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `examId` int(11) NOT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `timeDuration` time NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `courseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`examId`, `instruction`, `timeDuration`, `activated`, `createdAt`, `lastModified`, `courseId`) VALUES
(1, '    Attempt all questions. You have 1 hour. If your time runs out, your answers are submitted automatically.', '00:45:00', 1, '0000-00-00 00:00:00', '2023-04-28 21:33:06', 1),
(2, ' Answer just 1 question in 45 minutes. If your time runs out, your answers are submitted automatically.', '00:45:00', 0, '0000-00-00 00:00:00', '2023-04-28 21:28:01', 2),
(3, 'You have 25 minutes. Do what you can. If your time runs out, your answers are submitted automatically.', '00:25:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3),
(4, ' Answer just one question', '00:10:00', 1, '2019-12-06 17:33:42', '2019-12-06 17:33:42', 4);

-- --------------------------------------------------------

--
-- Table structure for table `examiner`
--

CREATE TABLE `examiner` (
  `username` varchar(255) NOT NULL,
  `firstName` char(100) NOT NULL,
  `lastName` char(100) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `pw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examiner`
--

INSERT INTO `examiner` (`username`, `firstName`, `lastName`, `imageUrl`, `gender`, `pw`) VALUES
('ayo_ph', 'Nahid', 'Hossain', '/images/examiner_male.png', 'male', '$2a$12$DirDyhIBxcWlUwEM6HqMsOWsrc9sMUDGFYv8Mn8vt8HSq4dVUdW0.'),
('jane_osoba', 'Sourav', 'Ahmed', '/images/examiner_female.png', 'female', '$2a$12$DirDyhIBxcWlUwEM6HqMsOWsrc9sMUDGFYv8Mn8vt8HSq4dVUdW0.');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `questionId` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) DEFAULT NULL,
  `answer` varchar(255) NOT NULL,
  `examId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionId`, `question`, `option1`, `option2`, `option3`, `option4`, `option5`, `answer`, `examId`) VALUES
(1, 'What is Kirchoff\'s Voltage Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(2, 'What is Kirchoff\'s Current Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(3, 'What is Kirchoff\'s Voltage Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(4, 'What is Kirchoff\'s Current Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(5, 'What is Kirchoff\'s Voltage Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(6, 'What is Kirchoff\'s Current Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(7, 'What is Kirchoff\'s Voltage Law?', 'The sum of all voltages is zero.', 'It states that the total current around a closed loop must be zero.', 'It states that the total voltage around a closed loop must be zero.', 'A and C above', 'None of the above', 'It states that the total voltage around a closed loop must be zero.', 1),
(8, 'Normalization solves the problem of?', 'Data redundancy', 'Insert anomaly', 'Delete anomaly', 'Update anomaly', 'All of the above', 'All of the above', 2),
(9, 'MySQL is a type of _____ database?', 'relational', 'non-relational', 'object-oriented', 'heirachical', 'MongoDB', 'relational', 2),
(10, 'Normalization solves the problem of?', 'Data redundancy', 'Insert anomaly', 'Delete anomaly', 'Update anomaly', 'All of the above', 'All of the above', 2),
(11, 'MySQL is a type of _____ database?', 'relational', 'non-relational', 'object-oriented', 'heirachical', 'MongoDB', 'relational', 2),
(12, 'Normalization solves the problem of?', 'Data redundancy', 'Insert anomaly', 'Delete anomaly', 'Update anomaly', 'All of the above', 'All of the above', 2),
(13, 'MySQL is a type of _____ database?', 'relational', 'non-relational', 'object-oriented', 'heirachical', 'MongoDB', 'relational', 2),
(14, 'Normalization solves the problem of?', 'Data redundancy', 'Insert anomaly', 'Delete anomaly', 'Update anomaly', 'All of the above', 'All of the above', 2),
(15, 'MySQL is a type of _____ database?', 'relational', 'non-relational', 'object-oriented', 'heirachical', 'MongoDB', 'relational', 2),
(16, 'Which of the following is an even signal?', 'x(t)=sin(wt)', 'y(t)=sin(wt+2)', 'z(t)=cos(wt)', 'A and B above', 'None of the above', 'z(t)=cos(wt)', 3),
(17, 'How is the discrete time impulse function defined in terms of the step function?', 'd[n] = u[n+1] â€“ u[n]', 'd[n] = u[n] â€“ u[n-2]', 'd[n] = u[n] â€“ u[n-1]', 'd[n] = u[n+1] â€“ u[n-1]', 'd[n] = u[n+1] â€“ u[n-12]', 'd[n] = u[n] â€“ u[n-1]', 3),
(18, 'A system with memory which anticipates future values of input is called _________ ', 'Non-causal System ', 'Non-anticipative System', 'Causal System', 'Static System ', 'Stable system', 'Non-causal System', 3),
(19, 'Determine the nature of the system: y(n)=x(-n).', 'Causal', 'Non-causal', 'Causal for all positive values of n', 'Non-causal for negative values of n', 'None of the above', 'Non-causal', 3),
(20, 'Which of the following is an even signal?', 'x(t)=sin(wt)', 'y(t)=sin(wt+2)', 'z(t)=cos(wt)', 'A and B above', 'None of the above', 'z(t)=cos(wt)', 3),
(21, 'How is the discrete time impulse function defined in terms of the step function?', 'd[n] = u[n+1] â€“ u[n]', 'd[n] = u[n] â€“ u[n-2]', 'd[n] = u[n] â€“ u[n-1]', 'd[n] = u[n+1] â€“ u[n-1]', 'd[n] = u[n+1] â€“ u[n-12]', 'd[n] = u[n] â€“ u[n-1]', 3),
(22, 'A system with memory which anticipates future values of input is called _________ ', 'Non-causal System ', 'Non-anticipative System', 'Causal System', 'Static System ', 'Stable system', 'Non-causal System', 3),
(23, 'Determine the nature of the system: y(n)=x(-n).', 'Causal', 'Non-causal', 'Causal for all positive values of n', 'Non-causal for negative values of n', 'None of the above', 'Non-causal', 3),
(24, ' What is an electric field?', 'A force surrounding a charge', 'An area with grass around electricity', 'A field with an electric fence', 'A force to reckon with', 'None of the above', 'A force surrounding a charge', 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `username` varchar(15) NOT NULL,
  `firstName` char(100) NOT NULL,
  `lastName` char(100) NOT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `pw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`username`, `firstName`, `lastName`, `imageUrl`, `gender`, `pw`) VALUES
('130408016', 'Rubel', 'Ahmed', '/images/student_female_2.jpg', 'female', '$2a$12$hrW0WXagLYX9YqWYfarrwOvt2CxS.t.zd8rvTGu7UyRFwFdQzLZ8i'),
('130408502', 'Sabir', 'Ahmed', '/images/student_male.jpg', 'male', '$2y$10$7s3vhwb/S5k4TgDIvnud3eLVTKaE9XospRMiXHna.3eF8FX5JlLbe'),
('150408502', 'Shuvo', 'Ahmed', '/images/student_female_3.jpg', 'female', '$2y$10$7s3vhwb/S5k4TgDIvnud3eLVTKaE9XospRMiXHna.3eF8FX5JlLbe');

-- --------------------------------------------------------

--
-- Table structure for table `student_result`
--

CREATE TABLE `student_result` (
  `studentId` varchar(255) NOT NULL,
  `examId` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `scoreOverall` int(11) NOT NULL,
  `submitTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_result`
--

INSERT INTO `student_result` (`studentId`, `examId`, `score`, `scoreOverall`, `submitTime`) VALUES
('130408016', 2, 2, 8, '2023-04-28 22:02:23'),
('150408502', 1, 4, 7, '2019-12-31 04:04:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `course_examiner`
--
ALTER TABLE `course_examiner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `course_student`
--
ALTER TABLE `course_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`examId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `examiner`
--
ALTER TABLE `examiner`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionId`),
  ADD KEY `examId` (`examId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `student_result`
--
ALTER TABLE `student_result`
  ADD PRIMARY KEY (`studentId`,`examId`),
  ADD KEY `examId` (`examId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course_examiner`
--
ALTER TABLE `course_examiner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_student`
--
ALTER TABLE `course_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `examId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `questionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_examiner`
--
ALTER TABLE `course_examiner`
  ADD CONSTRAINT `Course_Examiner_ibfk_1` FOREIGN KEY (`username`) REFERENCES `examiner` (`username`),
  ADD CONSTRAINT `Course_Examiner_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`);

--
-- Constraints for table `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `Course_Student_ibfk_1` FOREIGN KEY (`username`) REFERENCES `student` (`username`),
  ADD CONSTRAINT `Course_Student_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `Exam_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`examId`) REFERENCES `exam` (`examId`);

--
-- Constraints for table `student_result`
--
ALTER TABLE `student_result`
  ADD CONSTRAINT `Student_Result_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`username`),
  ADD CONSTRAINT `Student_Result_ibfk_2` FOREIGN KEY (`examId`) REFERENCES `exam` (`examId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
