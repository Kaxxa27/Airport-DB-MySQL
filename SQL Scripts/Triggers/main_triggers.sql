USE aerobooking;

select * from seatclass;
select * from ticket
order by price;
--  DROP TRIGGER update_ticket_price;

DELIMITER //

CREATE TRIGGER update_ticket_price
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    DECLARE seatclass_multiplier DECIMAL(10,2) DEFAULT 1;

    -- Получаем множитель стоимости класса места
    SELECT CASE sc.name
           WHEN 'Economy' THEN 1
           WHEN 'Business' THEN 1.5
           WHEN 'First Class' THEN 2
           ELSE 1 END
    INTO seatclass_multiplier
    FROM seat s
    JOIN seatclass sc ON s.seatclass_id = sc.id   
    WHERE s.id = NEW.seat_id
    LIMIT 1;
    
    -- Рассчитываем новую стоимость
    SET NEW.price = NEW.price * seatclass_multiplier;
END;

//
DELIMITER ;





