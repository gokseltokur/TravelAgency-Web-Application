CREATE PROCEDURE BookingsAboveSpecificNumberOfDays
	@numberOfDay int
AS
SELECT booking_id, DATEDIFF(day , booking_start_date, booking_end_date) AS number_of_days, booking_start_date, booking_end_date 
FROM Service_Booking AS s
WHERE DATEDIFF(day , booking_start_date, booking_end_date) >= @numberOfDay;


exec BookingsAboveSpecificNumberOfDays 4;