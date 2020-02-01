CREATE VIEW Revenue_of_Each_Agency AS
SELECT B.travel_agency_id, SUM(P.payment_amount) AS TotalAmount
FROM Booking AS B
LEFT OUTER JOIN Payment AS P ON P.booking_id = B.booking_id
GROUP BY  B.travel_agency_id;
