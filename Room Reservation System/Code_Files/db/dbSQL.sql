-- number of reservations in any given day
SELECT COUNT(*) as numberofreservations FROM `roomreservation` WHERE DATE(`ReservedTime`) = '2017-11-02';

-- number of reservations in any given month
SELECT COUNT(*) as numberofreservations FROM `roomreservation` WHERE MONTHNAME(`ReservedTime`) = 'November';

-- get details of reservations of a particular room
SELECT roomreservation.*, users.* FROM `roomreservation` inner join users on users.UBId=roomreservation.UBId WHERE roomreservation.RoomID=21;

-- youngest student details in first semester
SELECT * FROM `users` WHERE `DOB`=(SELECT MAX(`DOB`) FROM users) AND `Semester`=1;

-- room with maximum queries
SELECT room.* FROM room INNER JOIN queries on queries.RoomID=room.ID GROUP BY room.ID ORDER BY COUNT(*) DESC LIMIT 1;

-- what is the most used security question
SELECT securityquestion.Question FROM `users` INNER JOIN securityquestion on securityquestion.ID=users.SecurityQuestion GROUP BY securityquestion.ID ORDER BY COUNT(*) DESC LIMIT 1;

-- rooms which are not fully occupied
SELECT room.* FROM `room` INNER JOIN roomreservation ON roomreservation.RoomID=room.ID WHERE roomreservation.EndTime IS NULL GROUP BY room.ID HAVING COUNT(*) <> room.Occupancy;

-- get the location from which most students are registered
SELECT location.Name FROM `users` inner join location on location.ID=users.OriginLocation GROUP BY users.OriginLocation ORDER BY COUNT(*) DESC LIMIT 1;