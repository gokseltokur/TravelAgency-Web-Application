CREATE VIEW Paid_Payments AS
SELECT payment_id, other_details, payment_amount, payment_date
FROM Payment
WHERE other_details = 'Paid';
