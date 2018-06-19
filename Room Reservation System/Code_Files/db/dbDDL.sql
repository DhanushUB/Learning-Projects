drop database ubreservationsystem;

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
CREATE DATABASE IF NOT EXISTS `ubreservationsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ubreservationsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `department`:
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `location`:
--

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `QueryId` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `UBId` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `Query` varchar(100) NOT NULL,
  `Response` varchar(100) NOT NULL,
  `RespondedON` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `queries`:
--   `RoomID`
--       `room` -> `ID`
--   `UBId`
--       `users` -> `UBId`
--

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `UBId` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `RatedOn` datetime NOT NULL,
  `Rating` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `rating`:
--   `UBId`
--       `users` -> `UBId`
--   `RoomID`
--       `room` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `ID` int(11) NOT NULL,
  `Occupancy` int(11) NOT NULL,
  `FloorNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `room`:
--

-- --------------------------------------------------------

--
-- Table structure for table `roomreservation`
--

CREATE TABLE `roomreservation` (
  `ReservationID` int(11) NOT NULL,
  `RoomID` int(11) NOT NULL,
  `ReservedTime` datetime NOT NULL,
  `UBId` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `EndTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `roomreservation`:
--   `RoomID`
--       `room` -> `ID`
--   `UBId`
--       `users` -> `UBId`
--

-- --------------------------------------------------------

--
-- Table structure for table `securityquestion`
--

CREATE TABLE `securityquestion` (
  `ID` int(11) NOT NULL,
  `Question` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `securityquestion`:
--

-- --------------------------------------------------------

--
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
-- RELATIONSHIPS FOR TABLE `users`:
--   `DepartmentID`
--       `department` -> `ID`
--   `OriginLocation`
--       `location` -> `ID`
--   `SecurityQuestion`
--       `securityquestion` -> `ID`
--   `RoomID`
--       `room` -> `ID`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`QueryId`),
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `UBId` (`UBId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `UBId` (`UBId`),
  ADD KEY `RoomID` (`RoomID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roomreservation`
--
ALTER TABLE `roomreservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `UBId` (`UBId`);

--
-- Indexes for table `securityquestion`
--
ALTER TABLE `securityquestion`
  ADD PRIMARY KEY (`ID`);

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
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `QueryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `RatingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `roomreservation`
--
ALTER TABLE `roomreservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `securityquestion`
--
ALTER TABLE `securityquestion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UBId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=634524;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `queries_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`),
  ADD CONSTRAINT `queries_ibfk_2` FOREIGN KEY (`UBId`) REFERENCES `users` (`UBId`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`UBId`) REFERENCES `users` (`UBId`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`);

--
-- Constraints for table `roomreservation`
--
ALTER TABLE `roomreservation`
  ADD CONSTRAINT `roomreservation_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`),
  ADD CONSTRAINT `roomreservation_ibfk_2` FOREIGN KEY (`UBId`) REFERENCES `users` (`UBId`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`OriginLocation`) REFERENCES `location` (`ID`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`SecurityQuestion`) REFERENCES `securityquestion` (`ID`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`RoomID`) REFERENCES `room` (`ID`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
