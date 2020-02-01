CREATE TRIGGER update_Booking_Log ON Booking
AFTER UPDATE AS 
BEGIN

    INSERT INTO Booking_Log(booking_id, performed_action, action_date)
    select i.booking_id, 'Update', GETDATE()   FROM inserted i;
    
END;