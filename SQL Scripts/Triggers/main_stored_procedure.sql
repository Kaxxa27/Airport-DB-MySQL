USE aerobooking;


-- UpdateUserInfo PROCEDURE

-- DROP PROCEDURE UpdateUserInfo;
DELIMITER //
CREATE PROCEDURE UpdateUserInfo
(IN userID INT, IN newUserName VARCHAR(45), 
 IN newPassword CHAR(64), IN newEmail VARCHAR(45),
 IN newActiveStatus TINYINT(1), IN newAdminStatus TINYINT(1), IN newStaffStatus TINYINT(1))
BEGIN
    UPDATE user
    SET
        username = IFNULL(newUserName, username),
        password = IFNULL(newPassword, password),
        email = IFNULL(newEmail, email),
        is_active = IFNULL(newActiveStatus, is_active),
        is_admin = IFNULL(newAdminStatus, is_admin),
        is_staff = IFNULL(newStaffStatus, is_staff)
    WHERE id = userID;
END;
//
DELIMITER ;


select * from user;
-- Используя оператор CALL
-- CALL UpdateUserInfo(5, NULL, 'test123', 'opp@mmm.rom', 0, NULL, NULL);


-- CancelTicketReservation PROCEDURE

DELIMITER //
CREATE PROCEDURE CancelTicketReservation(IN ticketID INT)
BEGIN
    DELETE FROM ticket
    WHERE id = ticketID;
END;
//
DELIMITER ;

select * from ticket;

-- CALL CancelTicketReservation(1);


-- GetAverageTicketPrice PROCEDURE

DELIMITER //
CREATE PROCEDURE GetAverageTicketPrice(IN flightNumber VARCHAR(10), OUT averagePrice DECIMAL(10,3))
BEGIN
    SELECT AVG(t.price) INTO averagePrice
    FROM ticket t
    JOIN flight f ON t.flight_id = f.id
    WHERE f.flight_number = flightNumber;
END;
//
DELIMITER ;

select * from ticket;
select * from flight;
CALL GetAverageTicketPrice('QF 101', @averagePrice);
select @averagePrice;
-- Теперь переменная @averagePrice содержит результат