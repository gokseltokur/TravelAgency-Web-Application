CREATE PROCEDURE GetGreaterPayments
	@amount int
AS
SELECT * 
FROM Payment AS p
WHERE p.payment_amount >= @amount;


exec GetGreaterPayments 500;