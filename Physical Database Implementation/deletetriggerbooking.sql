CREATE TRIGGER delete_Booking_Log ON Booking
AFTER DELETE AS 
BEGIN
	DECLARE @hasPayment int;
	DECLARE @hasServiceBooking int;
	
	SELECT @hasPayment = COUNT(*) FROM Payment
	WHERE Payment.booking_id=(select booking_id FROM deleted)

	SELECT @hasServiceBooking = COUNT(*) FROM Service_Booking
	WHERE Service_Booking.booking_id=(SELECT booking_id FROM deleted)
    
      IF ((@hasPayment) > 0 OR (@hasServiceBooking) > 0)
	BEGIN
   RAISERROR('You cannot delete corresponding booking it has records.',16, 1)
	ROLLBACK TRANSACTION
	END
	
	 IF ((@hasPayment) = 0 AND (@hasServiceBooking) = 0)
	BEGIN
   INSERT INTO Booking_Log(booking_id, performed_action, action_date)
    SELECT i.booking_id, 'Delete', GETDATE() FROM deleted i;
	END
    
END;