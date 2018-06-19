

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ubreservationsystem`
--

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID`, `Name`) VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Biotech'),
(5, 'Technology Management'),
(6, 'MBA');

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID`, `Name`) VALUES
(1, 'Asia'),
(2, 'Africa'),
(3, 'Australia'),
(4, 'North America'),
(5, 'South America'),
(6, 'Europe'),
(7, 'Antarctic');

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`QueryId`, `RoomID`, `UBId`, `Semester`, `CreatedOn`, `Query`, `Response`, `RespondedON`) VALUES
(1, 31, 45632, 1, '2017-11-12 06:00:00', 'A/C not working', '', NULL);

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ID`, `Occupancy`, `FloorNumber`) VALUES
(11, 3, 1),
(12, 3, 1),
(13, 3, 1),
(14, 3, 1),
(15, 3, 1),
(21, 2, 2),
(22, 2, 2),
(23, 2, 2),
(24, 2, 2),
(25, 2, 2),
(31, 1, 3),
(32, 1, 3),
(33, 1, 3),
(34, 1, 3),
(35, 1, 3);

--
-- Dumping data for table `roomreservation`
--

INSERT INTO `roomreservation` (`ReservationID`, `RoomID`, `ReservedTime`, `UBId`, `Semester`, `EndTime`) VALUES
(1, 11, '2017-11-02 06:00:00', 212345, 1, NULL),
(2, 11, '2017-11-02 08:00:00', 523645, 1, NULL),
(3, 31, '2017-11-03 08:00:00', 45632, 1, NULL),
(4, 15, '2017-11-10 08:00:00', 12345, 4, NULL),
(5, 21, '2017-11-03 06:00:00', 23435, 2, NULL),
(6, 22, '2017-11-09 06:00:00', 98767, 1, NULL),
(7, 21, '2017-11-08 06:00:00', 134562, 1, NULL),
(8, 15, '2017-11-02 07:00:00', 23456, 2, NULL),
(9, 22, '2017-11-11 06:00:00', 634523, 1, NULL);

--
-- Dumping data for table `securityquestion`
--

INSERT INTO `securityquestion` (`ID`, `Question`) VALUES
(1, 'What was your childhood nickname?'),
(2, 'What is the name of your favorite childhood friend?'),
(3, 'What is your favorite team?'),
(4, 'What is your favorite movie?'),
(5, 'What was the make and model of your first car?'),
(6, 'What was the make and model of your first car?'),
(7, 'In what town was your first job?'),
(8, 'What school did you attend for sixth grade?'),
(9, 'What was your favorite food as a child?');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UBId`, `Username`, `Password`, `FirstName`, `LastName`, `DOB`, `Gender`, `Contact`, `DepartmentID`, `Semester`, `OriginLocation`, `SecurityQuestion`, `SecurityQuestionAnswer`, `Role`, `RoomID`) VALUES
(12345, 'HermanB', 'admin', 'Herman', 'Bailey', '2017-11-13', 'male', '123456789', 1, 4, 1, 1, 'Heman', 'Admin', 15),
(23435, 'JacksonMc', 'student', 'Jackson', 'Mckeighan  ', '1990-04-10', 'male', '23412345', 3, 2, 6, 2, 'john', 'student', 21),
(23456, 'ColinL', 'student', 'Colin', 'Levasseur', '1991-06-20', 'male', '213452563', 4, 2, 1, 9, 'noodles', 'student', 15),
(45632, 'TeraH', 'student', 'Tera', 'Harpe ', '1990-03-12', 'female', '231412513', 1, 1, 5, 5, 'bmw', 'student', 31),
(98767, 'ConsueloA', 'student', 'Consuelo', 'Addy  ', '1992-07-21', 'male', '1231234', 2, 1, 5, 4, 'abc', 'student', 22),
(134562, 'GregY', 'student', 'Greg	', 'Yates', '1994-03-12', 'male', '132534623', 1, 1, 3, 8, 'mary', 'student', 21),
(212345, 'KennyA', 'student', 'Kenny', 'Andrews', '1992-09-12', 'female', '1123141554', 6, 1, 2, 2, 'ben', 'student', 11),
(523645, 'AngelicaP	', 'student', 'Angelica', 'Page', '1993-08-23', 'female', '312534622', 4, 1, 4, 7, 'boston', 'student', 11),
(634523, 'JimmyN', 'student', 'Jimmy', 'Nelson', '1994-05-18', 'male', '2362321134', 5, 2, 2, 3, 'manchester', 'student', 22);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
