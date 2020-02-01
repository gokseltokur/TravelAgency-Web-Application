CREATE TRIGGER insert_Booking_Log ON Booking
AFTER INSERT AS 
BEGIN
    
    INSERT INTO Booking_Log(booking_id, performed_action, action_date)
    select i.booking_id, 'Insert', GETDATE() FROM inserted i;
    
END;