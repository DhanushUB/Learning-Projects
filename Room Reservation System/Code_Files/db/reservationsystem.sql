

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ubreservationsystem`
--

-- --------------------------------------------------------


-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UBId` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Contact` varchar(20) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `OriginLocation` int(11) NOT NULL,
  `SecurityQuestion` int(11) NOT NULL,
  `SecurityQuestionAnswer` varchar(100) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `RoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UBId`, `Username`, `Password`, `FirstName`, `LastName`, `DOB`, `Gender`, `Contact`, `DepartmentID`, `Semester`, `OriginLocation`, `SecurityQuestion`, `SecurityQuestionAnswer`, `Role`, `RoomID`) VALUES
(12345, 'admin', 'admin', 'Herman', 'Bailey', '2017-11-10', 'male', '1234567891', 1, 5, 1, 1, 'Heman', 'Admin', NULL),
(23435, 'JacksonMc', 'student', 'Jackson', 'Mckeighan  ', '1990-04-10', 'male', '23412345', 3, 2, 6, 2, 'john', 'student', 21),
(23456, 'ColinL', 'student', 'Colin', 'Levasseur', '1991-06-20', 'male', '213452563', 4, 2, 1, 9, 'noodles', 'student', 15),
(45632, 'TeraH', 'student', 'Tera', 'Harpe ', '1990-03-12', 'female', '231412513', 1, 1, 5, 5, 'bmw', 'student', 31),
(98767, 'ConsueloA', 'student', 'Consuelo', 'Addy  ', '1992-07-21', 'male', '1231234', 2, 1, 5, 4, 'abc', 'student', 22),
(134562, 'GregY', 'student', 'Greg	', 'Yates', '1994-03-12', 'male', '132534623', 1, 1, 3, 8, 'mary', 'student', 21),
(212345, 'KennyA', 'student', 'Kenny', 'Andrews', '1992-09-12', 'female', '1123141554', 6, 1, 2, 2, 'ben', 'student', 11),
(523645, 'AngelicaP	', 'student', 'Angelica', 'Page', '1993-08-23', 'female', '312534622', 4, 1, 4, 7, 'boston', 'student', 11),
(634523, 'JimmyN', 'student', 'Jimmy', 'Nelson', '1994-05-18', 'male', '2362321134', 5, 2, 2, 3, 'manchester', 'student', 22);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UBId`),
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `OriginLocation` (`OriginLocation`),
  ADD KEY `SecurityQuestion` (`SecurityQuestion`),
  ADD KEY `RoomID` (`RoomID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UBId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=634528;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`OriginLocation`) REFERENCES `location` (`ID`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`SecurityQuestion`) REFERENCES `securityquestion` (`ID`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
