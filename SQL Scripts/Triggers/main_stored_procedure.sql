USE aerobooking;


-- UpdateUserInfo PROCEDURE

DROP PROCEDURE UpdateUserInfo;
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
CALL UpdateUserInfo(5, NULL, 'test123', 'opp@mmm.rom', 0, NULL, NULL);